# DOCUMENTATION FOR MONGODB

## Xuất tất cả các collection vào folder

```bash
mongodump --out /path/to/folder
```

## Import tất cả các collection từ folder

```bash
mongorestore /path/to/folder
```

## Start mongodb local
```bash
mongod --config /opt/homebrew/etc/mongod.conf --fork
```

### Tìm và kill mongodb
```bash
ps aux | grep -v grep | grep mongod
```