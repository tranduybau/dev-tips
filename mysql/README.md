# DOCUMENTATION FOR MYSQL

## Xuất tất cả các database vào file SQL

```bash
mysqldump --all-databases > backup_all_databases.sql
```

## Xuất một database cụ thể

```bash
mysqldump -u username -p database_name > backup_database.sql
```

## Import database từ file SQL

```bash
mysql -u username -p database_name < backup_database.sql
```

## Start MySQL local
```bash
brew services start mysql
```

## Stop MySQL local
```bash
brew services stop mysql
```

### Tìm và kill MySQL process
```bash
ps aux | grep -v grep | grep mysql
```

### Kết nối MySQL từ command line
```bash
mysql -u username -p
```
