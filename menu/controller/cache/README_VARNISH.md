# Varnish Cache Integration

Tính năng tích hợp Varnish Cache cho hệ thống quản lý LEMP Stack. Varnish Cache là một HTTP accelerator/reverse proxy cache mạnh mẽ giúp tăng tốc độ website đáng kể.

## Kiến trúc hệ thống

Theo thiết kế trong `nginx.mermaid`, hệ thống hoạt động như sau:

```
Client HTTP/HTTPS (80/443) → Nginx SSL Termination → Varnish Cache (80) → Nginx Backend (8080) → PHP-FPM → MySQL
```

### Luồng hoạt động:
1. **Client** gửi request đến **Nginx SSL Termination** (port 443/80)
2. **Nginx SSL** xử lý SSL và chuyển request đến **Varnish Cache** (port 80)
3. **Varnish Cache** kiểm tra cache:
   - **Cache HIT**: Trả về nội dung đã cache trực tiếp cho client
   - **Cache MISS**: Chuyển request đến **Nginx Backend** (port 8080)
4. **Nginx Backend** xử lý PHP thông qua **PHP-FPM** và truy vấn **MySQL**
5. Response được trả về và Varnish cache lại cho các request tiếp theo

## Tính năng chính

### ✅ Cài đặt tùy chọn
- Varnish chỉ được cài đặt khi người dùng lựa chọn
- Không ảnh hưởng đến hệ thống hiện tại nếu không sử dụng

### ✅ Quản lý theo domain
- Bật/tắt Varnish cho từng domain riêng biệt
- Danh sách domain đang sử dụng Varnish
- Tự động cấu hình Nginx backend cho domain

### ✅ Purge cache linh hoạt
- Purge cache theo domain cụ thể
- Purge cache theo URL cụ thể (hỗ trợ regex pattern)
- Purge toàn bộ cache

### ✅ Gỡ bỏ hoàn toàn
- Khôi phục cấu hình Nginx về trạng thái ban đầu
- Xóa tất cả file cấu hình Varnish
- Backup tự động trước khi gỡ bỏ

### ✅ Quản lý dịch vụ
- Bật/tắt Varnish service
- Khởi động lại Varnish
- Xem trạng thái chi tiết

### ✅ Thống kê và monitoring
- Hit/Miss ratio
- Top URLs được truy cập
- Real-time statistics
- Memory usage

### ✅ Cấu hình nâng cao
- Chỉnh sửa VCL (Varnish Configuration Language)
- Cấu hình memory allocation
- Cấu hình timeout settings
- Backup/Restore configuration

## Cấu trúc file

```
menu/controller/cache/
├── install_varnish          # Script cài đặt Varnish
├── manage_varnish           # Menu quản lý chính
├── varnish_domain          # Quản lý domain với Varnish
├── varnish_purge           # Purge cache
├── varnish_service         # Quản lý service
├── varnish_stats           # Thống kê
├── varnish_config          # Cấu hình nâng cao
├── remove_varnish          # Gỡ bỏ Varnish
└── reinstall_varnish       # Cài đặt lại

menu/template/
└── varnish_frontend.conf    # Template cấu hình Nginx frontend

/usr/share/nginx/private/varnish/
└── index.php               # Web interface quản lý cache
```

## Hướng dẫn sử dụng

### 1. Cài đặt Varnish Cache

```bash
# Truy cập menu cache
Menu chính → Cache manager → Varnish cache

# Chọn "Cài đặt Varnish Cache"
1. Cai dat Varnish Cache
```

### 2. Kích hoạt Varnish cho domain

```bash
# Menu quản lý Varnish
4. Quan ly domain → 1. Bat Varnish cho domain

# Chọn domain từ danh sách
```

### 3. Purge cache

```bash
# Menu quản lý Varnish
5. Purge cache

# Lựa chọn:
1. Purge theo domain        # Xóa toàn bộ cache của domain
2. Purge theo URL cu the    # Xóa cache của URL cụ thể
3. Purge tat ca cache       # Xóa toàn bộ cache
```

### 4. Quản lý qua Web Interface

Truy cập: `https://your-server-ip:admin-port/varnish`

- Purge cache theo URL pattern
- Purge cache theo domain
- Xem thống kê real-time
- Kiểm tra trạng thái Varnish

## Cấu hình mặc định

### Memory Allocation
- **Mặc định**: 512 MB hoặc 25% RAM hệ thống
- **Tối thiểu**: 64 MB
- **Khuyến nghị**: 25-50% RAM cho website có lưu lượng cao

### Timeout Settings
- **Connect timeout**: 60s
- **First byte timeout**: 60s
- **Between bytes timeout**: 60s

### Cache TTL
- **Static files** (CSS, JS, images): 1 tuần
- **HTML pages**: 1 giờ
- **Dynamic content**: Theo response headers

### Cache Rules
- **Không cache**: Admin pages, logged-in users, POST requests
- **Cache**: Static files, anonymous page views
- **Purge**: Tự động khi có PURGE request từ localhost

## Monitoring và Troubleshooting

### Kiểm tra trạng thái
```bash
# Kiểm tra service
systemctl status varnish

# Xem log
journalctl -u varnish -f

# Thống kê cache
varnishstat

# Real-time monitoring
varnishlog
```

### Cache Headers
Kiểm tra response headers để xác nhận Varnish hoạt động:
- `X-Cache: HIT` - Cache hit
- `X-Cache: MISS` - Cache miss
- `X-Cache-Hits: N` - Số lần hit

### Performance Tips
1. **Memory**: Cấp phát đủ RAM cho cache
2. **VCL**: Tùy chỉnh logic cache cho ứng dụng cụ thể
3. **Purging**: Thiết lập purge strategy phù hợp
4. **Monitoring**: Theo dõi hit ratio thường xuyên

## Tương thích

### Hệ thống
- **OS**: Ubuntu 18.04+, Debian 9+
- **Nginx**: 1.14+
- **PHP**: 7.0+ (tất cả phiên bản được hỗ trợ)
- **RAM**: Tối thiểu 1GB (khuyến nghị 2GB+)

### Ứng dụng web
- **WordPress**: Hoàn toàn tương thích
- **Laravel**: Tương thích với cấu hình cache headers
- **Custom PHP**: Cần cấu hình cache headers phù hợp

### Cache plugins
- Có thể hoạt động song song với Redis/Memcached
- Tích hợp tốt với WordPress cache plugins
- Hỗ trợ ESI (Edge Side Includes) cho content động

## Lưu ý quan trọng

### ⚠️ Backup
- Luôn backup cấu hình trước khi thay đổi
- File backup được lưu tại `/var/backups/varnish/`

### ⚠️ SSL/HTTPS
- Varnish xử lý HTTP, Nginx frontend xử lý SSL
- Cấu hình SSL không thay đổi khi dùng Varnish

### ⚠️ Performance
- Monitor RAM usage thường xuyên
- Kiểm tra hit ratio để tối ưu cấu hình
- Purge cache định kỳ cho content cũ

### ⚠️ Security
- Admin interface được bảo vệ bằng HTTP auth
- Varnish admin port (6082) chỉ listen localhost
- Purge endpoint chỉ cho phép từ localhost

## Support và Documentation

- **Official Varnish**: https://varnish-cache.org/docs/
- **VCL Documentation**: https://varnish-cache.org/docs/trunk/users-guide/vcl.html
- **Performance Tuning**: https://varnish-cache.org/docs/trunk/users-guide/performance.html
