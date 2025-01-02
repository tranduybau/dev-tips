# Kiểm tra kích thước folder

```bash
sudo apt install ncdu

ncdu /đường/dẫn/thư/mục
```

Hoặc sử dụng hàm sẵn:
```bash
du -sh /đường/dẫn/thư/mục

du -h --max-depth=1 /đường/dẫn | sort -h
```

# Đổi tên file:
```bash
mv path_1 path_2
```

# Cài node:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm i 20
corepack enable yarn
corepack enable pnpm
```