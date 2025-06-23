# Hướng dẫn sử dụng tính năng Quản lý DNS Cloudflare

## Giới thiệu
Tính năng này cho phép bạn quản lý các bản ghi DNS của tên miền trên Cloudflare thông qua API. Bạn có thể xem, thêm, sửa, xóa các bản ghi DNS và thiết lập Dynamic DNS.

## Cách sử dụng

### 1. Xác thực Cloudflare API

Khi bạn sử dụng tính năng này lần đầu tiên, hệ thống sẽ yêu cầu bạn nhập thông tin đăng nhập Cloudflare:
- Email tài khoản Cloudflare
- API Key hoặc API Token của Cloudflare

Để lấy API Key/Token:
1. Đăng nhập vào tài khoản Cloudflare
2. Vào phần "My Profile" > "API Tokens"
3. Bạn có thể sử dụng Global API Key hoặc tạo API Token mới với quyền chỉnh sửa DNS

### 2. Quản lý các bản ghi DNS

Sau khi xác thực thành công, bạn sẽ thấy danh sách các tên miền trong tài khoản Cloudflare. Chọn tên miền muốn quản lý để vào menu quản lý DNS:

#### 2.1. Xem danh sách bản ghi DNS A và AAAA
- Hiển thị tất cả các bản ghi A (IPv4) và AAAA (IPv6)
- Hiển thị thông tin: tên bản ghi, nội dung (IP), trạng thái proxy

#### 2.2. Thêm/Cập nhật bản ghi @ (domain gốc)
- Thêm hoặc cập nhật bản ghi A cho tên miền chính
- Cho phép chỉnh sửa IP và trạng thái proxy

#### 2.3. Thêm/Cập nhật bản ghi subdomain
- Thêm hoặc cập nhật bản ghi A cho subdomain
- Cho phép đặt IP và trạng thái proxy

#### 2.4. Xóa bản ghi subdomain
- Xóa bản ghi DNS của subdomain đã tạo

#### 2.5. Cấu hình Dynamic DNS
- Tạo script tự động cập nhật IP cho domain hoặc subdomain
- Hữu ích khi bạn có IP động và muốn luôn cập nhật IP mới nhất lên DNS

### 3. Cách Dynamic DNS hoạt động

Khi bạn cấu hình Dynamic DNS:
1. Hệ thống sẽ tạo một script tự động tại `/usr/local/bin/`
2. Script này sẽ được đặt lịch chạy mỗi 5 phút thông qua crontab
3. Script sẽ tự động kiểm tra IP công khai hiện tại của máy chủ
4. So sánh và cập nhật DNS nếu IP đã thay đổi
5. Log các thay đổi vào file log để theo dõi

## Xử lý sự cố

Nếu bạn gặp vấn đề:
- Kiểm tra file log tại `/tmp/cloudflare_dns_debug.log`
- Đảm bảo API Key/Token hợp lệ và có quyền chỉnh sửa DNS
- Kiểm tra kết nối mạng đến API Cloudflare

## Lưu ý

- Để Dynamic DNS hoạt động tốt, máy chủ của bạn cần có kết nối internet ổn định
- Khi tạo bản ghi mới, bạn có thể bật/tắt tính năng Proxy của Cloudflare (đám mây cam)
- Các thay đổi DNS có thể mất từ vài phút đến vài giờ để được cập nhật hoàn toàn
