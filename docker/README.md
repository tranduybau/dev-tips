# DOCUMENTATION FOR DOCKER

## Docker file:
Tác dụng: Tạo ra một image của một ứng dụng.

## Docker-compose:
Tác dụng: Tạo ra một container của một ứng dụng.

## Lệnh:
1. Danh sách app đang chạy:
```bash
docker ps -a
```

2. Kill app:
```bash
docker stop
```

3. Xóa tất cả container đã dừng
```bash
docker container prune
```

4. Lệnh stop và xóa docker đang chạy nhanh:

```bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

5. Lệnh re-build lại từ docker compose file:
```bash
docker-compose up --build -d
```

6. Restart/remove all docker log, cache:

```bash
docker stop $(docker ps -aq)
docker system prune -a -f
```