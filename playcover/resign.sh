#!/bin/bash

CERT_NAME="${2:-SelfSigned}"
WORK_DIR="Payload"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"   # folder chứa resign.sh

if [ -z "$1" ]; then
  echo "❌ Cách dùng: $0 file.ipa [Tên-Certificate]"
  exit 1
fi

IPA_FILE="$(realpath "$1")"
BASENAME="$(basename "$IPA_FILE" .ipa)"
SIGNED_IPA="$SCRIPT_DIR/${BASENAME}-signed.ipa"

if [ ! -f "$IPA_FILE" ]; then
  echo "❌ Không tìm thấy file: $IPA_FILE"
  exit 1
fi

# --- CREATE CERT IF NEEDED ---
if ! security find-certificate -c "$CERT_NAME" >/dev/null 2>&1; then
  echo "⚠️ Không thấy certificate '$CERT_NAME', đang tạo mới..."
  CERT_TEMP="$CERT_NAME.cer"
  KEY_TEMP="$CERT_NAME.key"
  P12_TEMP="$CERT_NAME.p12"

  openssl req -new -newkey rsa:2048 -nodes -keyout "$KEY_TEMP" -subj "/CN=$CERT_NAME" -out "$CERT_NAME.csr" || { echo "❌ Lỗi tạo CSR"; exit 1; }
  openssl x509 -req -signkey "$KEY_TEMP" -in "$CERT_NAME.csr" -out "$CERT_TEMP" -days 3650 || { echo "❌ Lỗi tạo cert"; exit 1; }
  openssl pkcs12 -export -inkey "$KEY_TEMP" -in "$CERT_TEMP" -out "$P12_TEMP" -passout pass:"" || { echo "❌ Lỗi tạo P12"; exit 1; }
  security import "$P12_TEMP" -k ~/Library/Keychains/login.keychain-db -P "" -T /usr/bin/codesign || { echo "❌ Import cert thất bại"; exit 1; }
  sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain "$CERT_TEMP" || { echo "❌ Trust cert thất bại"; exit 1; }
  rm -f "$KEY_TEMP" "$CERT_TEMP" "$CERT_NAME.csr" "$P12_TEMP"
  echo "✅ Đã tạo certificate '$CERT_NAME'"
fi

# --- UNZIP IPA ---
rm -rf "$WORK_DIR"
unzip -q "$IPA_FILE" -d "$WORK_DIR" || { echo "❌ Giải nén IPA thất bại"; exit 1; }

APP_PATH=$(find "$WORK_DIR" -name "*.app" | head -n 1)
if [ -z "$APP_PATH" ]; then
  echo "❌ Không tìm thấy .app trong $IPA_FILE"
  exit 1
fi

# --- RESIGN ---
echo "🔑 Đang ký lại app: $APP_PATH"
codesign -s "$CERT_NAME" --force --deep "$APP_PATH" || { echo "❌ codesign thất bại"; exit 1; }

# --- REPACK (ngay cạnh script) ---
echo "📦 Đang đóng gói lại thành: $SIGNED_IPA"
(cd "$WORK_DIR" && zip -qr "$SIGNED_IPA" *) || { echo "❌ Đóng gói IPA thất bại"; exit 1; }

echo "✅ Hoàn tất! File đã ký: $SIGNED_IPA"
