# Varnish Cache Integration - Fixed Architecture

## Vấn đề đã khắc phục

**Lỗi gốc:** Varnish không thể start vì port conflict
```
Error: Could not get socket :80: Permission denied
```

**Nguyên nhân:** Nginx đã chiếm port 80, Varnish cũng cố gắng listen port 80 → Xung đột

## Kiến trúc mới (theo nginx.mermaid)

```
Client (HTTP/HTTPS) 
    ↓ port 80/443
Nginx SSL Termination 
    ↓ HTTP internal  
Varnish Cache (port 6081)
    ↓ cache miss
Nginx Backend (port 8080) 
    ↓
PHP-FPM → MySQL
```

## Các thay đổi chính

### 1. Cấu hình Varnish
- **Trước:** Listen port 80 (xung đột với Nginx)
- **Sau:** Listen port 6081 (internal, không xung đột)

### 2. Cấu hình Nginx
- **Frontend (SSL Termination):**
  - HTTP (80): Redirect to HTTPS
  - HTTPS (443): SSL termination → Forward to Varnish (6081)
  
- **Backend (PHP Processing):**
  - Listen port 8080
  - Xử lý PHP-FPM khi Varnish cache miss

### 3. Migration Domain tự động
- Khi cài Varnish: Tự động chuyển tất cả domain từ port 80 → 8080
- Khi gỡ Varnish: Tự động khôi phục domain từ port 8080 → 80

## Các tính năng mới

### 1. Script Test cấu hình
```bash
/var/hostvn/menu/controller/cache/test_varnish_config
```
- Kiểm tra trạng thái dịch vụ
- Kiểm tra port conflicts
- Test connectivity giữa các components
- Hiển thị architecture flow

### 2. Template cấu hình domain
```bash
/var/hostvn/menu/template/varnish_frontend.conf
```
- SSL termination template
- Tự động detect SSL certificate paths
- Cache purge endpoints

### 3. Migration Scripts
- Tự động backup cấu hình trước khi thay đổi
- Rollback khi có lỗi
- Preserve SSL certificates

## Hướng dẫn sử dụng

### 1. Cài đặt Varnish
```bash
# Truy cập menu cache
hostvn → Cache manager → Varnish cache

# Chọn option 1: Cài đặt Varnish Cache
# Script sẽ tự động:
# - Cài đặt Varnish listen port 6081
# - Tạo Nginx frontend (SSL termination)
# - Chuyển tất cả domain sang port 8080
# - Test cấu hình và khởi động dịch vụ
```

### 2. Quản lý Domain
```bash
# Option 4: Quản lý domain
# - Bật/tắt Varnish cho từng domain riêng lẻ
# - Tự động tạo SSL termination config
# - Backup và khôi phục cấu hình
```

### 3. Test cấu hình  
```bash
# Option 8: Test cấu hình
# Kiểm tra toàn bộ hệ thống:
# - Service status
# - Port conflicts  
# - Configuration syntax
# - Connectivity tests
```

## Troubleshooting

### 1. Varnish không start
```bash
# Kiểm tra log
journalctl -u varnish -f

# Kiểm tra port conflict
ss -tulpn | grep :80
ss -tulpn | grep :6081

# Test cấu hình
hostvn → Cache → Varnish → Test cấu hình
```

### 2. Domain không accessible
```bash
# Kiểm tra cấu hình Nginx
nginx -t

# Kiểm tra frontend config
ls -la /etc/nginx/sites-enabled/*frontend*

# Test connectivity
curl -H "Host: domain.com" http://127.0.0.1:6081/
```

### 3. SSL không hoạt động
```bash
# Kiểm tra SSL certificate paths trong frontend config
grep ssl_certificate /etc/nginx/sites-enabled/*frontend.conf

# Verify SSL certificates
openssl x509 -in /path/to/cert.crt -text -noout
```

## Lưu ý quan trọng

1. **Backup tự động:** Tất cả cấu hình được backup trước khi thay đổi
2. **Port management:** Script tự động quản lý port, không cần can thiệp thủ công
3. **SSL compatibility:** Tự động detect và sử dụng SSL certificates hiện có
4. **Rollback support:** Có thể khôi phục cấu hình cũ khi gỡ Varnish
5. **No downtime:** Migration được thực hiện không gián đoạn dịch vụ

## Files được tạo/sửa đổi

```bash
# Scripts mới
/var/hostvn/menu/controller/cache/install_varnish          # Updated
/var/hostvn/menu/controller/cache/manage_varnish           # Updated  
/var/hostvn/menu/controller/cache/varnish_domain           # Updated
/var/hostvn/menu/controller/cache/remove_varnish           # Updated
/var/hostvn/menu/controller/cache/test_varnish_config      # New
/var/hostvn/menu/template/varnish_frontend.conf            # Updated
/var/hostvn/menu/route/parent                              # Updated

# Configuration files
/etc/systemd/system/varnish.service                       # Listen 6081
/etc/nginx/sites-available/varnish-frontend               # SSL termination
/etc/nginx/sites-available/backend                        # Backend config
/etc/varnish/default.vcl                                  # Varnish config
```

## Kiểm tra sau khi cài đặt

```bash
# 1. Verify services
systemctl status nginx varnish

# 2. Check ports
ss -tulpn | grep -E ":80|:443|:6081|:8080"

# 3. Test flow
curl -I http://domain.com     # Should redirect to HTTPS
curl -I https://domain.com    # Should show X-Cache header

# 4. Check logs
tail -f /var/log/nginx/access.log
journalctl -u varnish -f
```

Architecture này đảm bảo không có port conflicts và tuân thủ đúng thiết kế trong nginx.mermaid.
