# Cài đặt Nginx
sudo apt install -y nginx

# Bắt đầu Nginx và kích hoạt khởi động cùng hệ thống
sudo systemctl start nginx
sudo systemctl enable nginx

# Kiểm tra trạng thái Nginx
sudo systemctl status nginx

# Tạo file cho domain
vi /etc/nginx/sites-available/stoc