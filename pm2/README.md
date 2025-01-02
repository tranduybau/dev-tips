# DOCUMENTATION FOR PM2

## Install PM2
```bash
# Cài đặt PM2 toàn cục
npm install -g pm2

# Hoặc sử dụng yarn
yarn global add pm2

# Kiểm tra phiên bản PM2
pm2 --version
```

## Run source with eco.system.js

```js
module.exports = {
  apps: [{
    name: "next-app",
    script: "pnpm",
    args: "start",
    env: {
      PORT: 3000,
      NODE_ENV: "production"
    },
    watch: true,
    autorestart: true
  }]
}

```