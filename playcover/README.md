# IPA Self-Signing Guide / Hướng dẫn Tự Ký IPA

## English Version

### Prerequisites
- macOS system
- Xcode Command Line Tools installed
- Terminal access

### Step 1: Create a Self-Signed Certificate

1. **Open Keychain Access**
   ```bash
   Keychain Access
   ```

2. **Create Certificate**
   - Go to `Keychain Access` → `Certificate Assistant` → `Create a Certificate`
   - Name: `IPA Signing Certificate`
   - Identity Type: `Self Signed Root`
   - Certificate Type: `Code Signing`
   - Check `Let me override defaults`
   - Click `Continue` through all steps
   - Set validity period (default 365 days is fine)
   - Save to `login` keychain

3. **Trust the Certificate**
   - Find your certificate in Keychain Access
   - Double-click it → `Trust` section
   - Set `Code Signing` to `Always Trust`
   - Close and enter your password

### Step 2: Create and Run the Signing Script

1. **Create the script file**
   ```bash
   nano resign.sh
   ```

2. **Paste the script content** (provided separately)

3. **Make script executable**
   ```bash
   chmod +x resign.sh
   ```

4. **Run the script**
   ```bash
   ./resign.sh your_app.ipa
   ```

### Troubleshooting
- If you get permission errors, try running with `sudo`
- Ensure the IPA file path is correct
- Check that Xcode Command Line Tools are installed: `xcode-select --install`

---

## Phiên Bản Tiếng Việt

### Yêu Cầu Hệ Thống
- Hệ điều hành macOS
- Đã cài đặt Xcode Command Line Tools
- Có quyền truy cập Terminal

### Bước 1: Tạo Certificate Tự Ký

1. **Mở Keychain Access**
   ```bash
   open "/Applications/Utilities/Keychain Access.app"
   ```

2. **Tạo Certificate**
   - Vào `Keychain Access` → `Certificate Assistant` → `Create a Certificate`
   - Tên: `IPA Signing Certificate`
   - Identity Type: `Self Signed Root`
   - Certificate Type: `Code Signing`
   - Tích chọn `Let me override defaults`
   - Nhấn `Continue` qua tất cả các bước
   - Đặt thời hạn hiệu lực (mặc định 365 ngày là được)
   - Lưu vào keychain `login`

3. **Tin Tưởng Certificate**
   - Tìm certificate của bạn trong Keychain Access
   - Double-click vào nó → phần `Trust`
   - Đặt `Code Signing` thành `Always Trust`
   - Đóng lại và nhập mật khẩu

### Bước 2: Tạo và Chạy Script Ký

1. **Tạo file script**
   ```bash
   nano resign.sh
   ```

2. **Dán nội dung script** (được cung cấp riêng)

3. **Cấp quyền thực thi cho script**
   ```bash
   chmod +x resign.sh
   ```

4. **Chạy script**
   ```bash
   ./resign.sh your_app.ipa
   ```

### Xử Lý Sự Cố
- Nếu gặp lỗi quyền truy cập, thử chạy với `sudo`
- Đảm bảo đường dẫn file IPA chính xác
- Kiểm tra Xcode Command Line Tools đã được cài: `xcode-select --install`

---

## Important Notes / Lưu Ý Quan Trọng

**English:**
- Self-signing is a temporary solution
- Apps may still crash due to missing entitlements
- Cannot submit to App Store with self-signed certificate
- May need to disable SIP in some cases

**Tiếng Việt:**
- Tự ký chỉ là giải pháp tạm thời
- App có thể vẫn crash do thiếu entitlements
- Không thể submit lên App Store với certificate tự ký
- Có thể cần tắt SIP trong một số trường hợp