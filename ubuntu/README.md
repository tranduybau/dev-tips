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