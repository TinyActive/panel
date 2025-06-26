<div align="center">

# 🚀 TinyPanel - Trình cài đặt & Tối ưu LEMP Stack

[![Cài đặt & Tối ưu LEMP Stack](https://img.shields.io/badge/LEMP-Installer-blue?style=for-the-badge)](https://tinyactive.github.io/panel)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-18.04%20|%2024.04-orange?style=for-the-badge&logo=ubuntu)](https://ubuntu.com)

<img src="https://tinyactive.com/wp-content/uploads/2024/02/Asset-5.svg" width="300px" />

**Cài đặt LEMP stack nhanh, an toàn và tối ưu cho VPS của bạn**

[📚 Tài liệu](https://tiny-panel.gitbook.io/) | 
[👥 Nhóm hỗ trợ](https://www.facebook.com/groups/hostvn.vn) | 
[🌐 Trang chủ](https://hostvn.vn/)

</div>

---

> TinyPanel giúp cài đặt và cấu hình Nginx, MariaDB, PHP với các thiết lập tối ưu về hiệu năng và bảo mật. Viết bằng Bash shell script cho Ubuntu (18.04 tới 24.04)
<div align="center">
⚠️ LƯU Ý: Nghiêm cấm phân phối lại hoặc đóng gói lại dự án này cho mục đích thương mại.
</div>

## 📋 Tính năng nổi bật

### 💻 Cài đặt

<table>
  <tr>
    <td width="50%">
      <ul>
        <li>✅ Menu dễ sử dụng, cập nhật thường xuyên</li>
        <li>✅ MariaDB 10.5 cấu hình tối ưu</li>
        <li>✅ Nginx phiên bản mới nhất</li>
        <li>✅ Hỗ trợ nhiều phiên bản PHP (5.6, 7.0-7.4 8.0-8.4)</li>
        <li>✅ Cấu hình FastCGI cache cho Nginx</li>
        <li>✅ Redis & Memcached cho cache</li>
        <li>✅ Tích hợp SSL Let's Encrypt</li>
        <li>✅ Hỗ trợ CloudFlare DNS API xác thực SSL nhanh</li>
      </ul>
    </td>
    <td width="50%">
      <ul>
        <li>✅ phpMyAdmin 4.9.x/5.0.x theo phiên bản PHP</li>
        <li>✅ PHPMemcachedAdmin & phpRedisAdmin</li>
        <li>✅ Bảng điều khiển Opcache</li>
        <li>✅ Fail2ban bảo vệ an ninh</li>
        <li>✅ WP-CLI, Composer, Supervisor, Rclone</li>
        <li>✅ Quét mã độc với ClamAV & ImunifyAV</li>
        <li>✅ Menu nâng cấp tất cả thành phần</li>
        <li>✅ <b>Không thu thập dữ liệu VPS</b></li>
      </ul>
    </td>
  </tr>
</table>

### ⚡ Tối ưu hóa

<table>
  <tr>
    <td width="50%">
      <ul>
        <li>🔥 Tối ưu MySQL, Nginx, PHP theo VPS</li>
        <li>🔥 Hỗ trợ nén Brotli tăng tốc tải trang</li>
        <li>🔥 Cấu hình rewrite cho các framework phổ biến:
          <ul>
            <li>WordPress</li>
            <li>Laravel</li>
            <li>Magento</li>
            <li>OpenCart</li>
            <li>Drupal</li>
          </ul>
        </li>
        <li>🔥 Chạy song song 2 phiên bản PHP</li>
        <li>🔥 Tùy chọn Redis hoặc Memcached</li>
      </ul>
    </td>
    <td width="50%">
      <ul>
        <li>🔥 Quản lý FTP chi tiết cho lập trình viên</li>
        <li>🔥 Tự động gia hạn SSL Let's Encrypt</li>
        <li>🔥 Hỗ trợ cấu hình SSL trả phí</li>
        <li>🔥 Xem log lỗi theo tên miền (Nginx, MySQL, PHP)</li>
        <li>🔥 Tự động cập nhật IP CloudFlare cho Nginx & CSF</li>
        <li>🔥 Triển khai web app dễ dàng</li>
        <li>🔥 Và nhiều tính năng khác...</li>
      </ul>
    </td>
  </tr>
</table>

### 🔒 Bảo mật

<table>
  <tr>
    <td width="50%">
      <ul>
        <li>🛡️ Cấu hình bảo mật web server nâng cao</li>
        <li>🛡️ Cô lập user theo website, chống lây nhiễm mã độc</li>
        <li>🛡️ Vô hiệu hóa hàm PHP nguy hiểm & open_basedir</li>
        <li>🛡️ Tự động chặn brute force với Fail2ban:
          <ul>
            <li>Bảo vệ SSH</li>
            <li>Bảo vệ SFTP</li>
            <li>Bảo vệ công cụ quản trị</li>
          </ul>
        </li>
        <li>🛡️ Tăng cường bảo mật WordPress:
          <ul>
            <li>Chặn shell trong thư mục uploads</li>
            <li>Bảo vệ file/thư mục nhạy cảm</li>
            <li>Bảo vệ wp-admin khỏi brute force</li>
            <li>Vô hiệu hóa API liệt kê user</li>
          </ul>
        </li>
      </ul>
    </td>
    <td width="50%">
      <ul>
        <li>🛡️ Quản lý Firewall chặn/mở IP dễ dàng</li>
        <li>🛡️ Tùy chỉnh cổng:
          <ul>
            <li>Đổi cổng SSH</li>
            <li>Đổi cổng Admin</li>
            <li>Đổi cổng SFTP</li>
          </ul>
        </li>
        <li>🛡️ Tạo mật khẩu mạnh</li>
        <li>🛡️ Quét mã độc với:
          <ul>
            <li>ClamAV</li>
            <li>ImunifyAV</li>
          </ul>
        </li>
        <li>🛡️ Cập nhật bảo mật thường xuyên</li>
        <li>🛡️ Và nhiều tính năng bảo mật khác...</li>
      </ul>
    </td>
  </tr>
</table>

### 🔌 Quản lý WordPress

<div align="center">
  <img src="https://s.w.org/style/images/about/WordPress-logotype-standard.png" width="250px" />
</div>

<table>
  <tr>
    <td width="33%">
      <h4>Quản lý lõi</h4>
      <ul>
        <li>🔧 Kiểm tra phiên bản WordPress</li>
        <li>🔧 Cập nhật lõi WordPress</li>
        <li>🔧 Cập nhật plugin</li>
        <li>🔧 Tự động cài đặt</li>
        <li>🔧 Đổi tên miền</li>
        <li>🔧 Đổi mật khẩu admin</li>
        <li>🔧 Ngẫu nhiên tiền tố DB tăng bảo mật</li>
      </ul>
    </td>
    <td width="33%">
      <h4>Cơ sở dữ liệu & Tối ưu</h4>
      <ul>
        <li>📊 Tối ưu database</li>
        <li>📊 Sửa chữa database</li>
        <li>📊 Tùy chỉnh cache key Redis/Memcached</li>
        <li>📊 Cấu hình Nginx cho plugin cache phổ biến:
          <ul>
            <li>WP-Rocket</li>
            <li>W3 Total Cache</li>
            <li>WP Super Cache</li>
            <li>Cache Enabler</li>
            <li>Swift Performance</li>
            <li>Fast Cache</li>
          </ul>
        </li>
      </ul>
    </td>
    <td width="33%">
      <h4>Tính năng & Bảo mật</h4>
      <ul>
        <li>🛠️ Cấu hình plugin SEO:
          <ul>
            <li>Yoast SEO</li>
            <li>Rank Math</li>
          </ul>
        </li>
        <li>🛠️ Bật/tắt chế độ bảo trì</li>
        <li>🛠️ Bật/tắt debug</li>
        <li>🛠️ Bật/tắt xmlrpc</li>
        <li>🛠️ Vô hiệu hóa toàn bộ plugin</li>
        <li>🛠️ Nhiều công cụ WordPress khác...</li>
      </ul>
    </td>
  </tr>
</table>

### 💾 Sao lưu & Khôi phục

<table>
  <tr>
    <td width="50%">
      <h4>Điểm đến sao lưu</h4>
      <ul>
        <li>📁 Sao lưu & khôi phục trên máy chủ</li>
        <li>📁 Sao lưu & khôi phục Google Drive qua Rclone</li>
        <li>📁 Hỗ trợ nhiều tài khoản Google Drive</li>
        <li>📁 Sao lưu qua Telegram (Proxy API)
          <a href="https://tiny-panel.gitbook.io/tiny-panel-docs/telegram?fallback=true">(Chi tiết)</a>
        </li>
      </ul>
    </td>
    <td width="50%">
      <h4>Quản lý sao lưu</h4>
      <ul>
        <li>📂 Cấu hình chính sách lưu trữ</li>
        <li>📂 Duyệt & quản lý file sao lưu</li>
        <li>📂 Tự động sao lưu theo lịch</li>
        <li>📂 Tùy chọn nội dung sao lưu</li>
      </ul>
    </td>
  </tr>
</table>

## ⚙️ Yêu cầu hệ thống

<table>
  <tr>
    <td width="50%">
      <ul>
        <li>🖥️ VPS tối thiểu 512MB RAM</li>
        <li>🖥️ Máy chủ sạch (không cài sẵn dịch vụ)</li>
      </ul>
    </td>
    <td width="50%">
      <ul>
        <li>🖥️ Ubuntu 18.04, 20.04 hoặc Debian 10</li>
        <li>🖥️ Yêu cầu quyền root</li>
      </ul>
    </td>
  </tr>
</table>

## 🚀 Cài đặt nhanh

```bash
curl -sO https://sdk.tinycp.me/install && chmod +x install && ./install
```

## 📘 Tài liệu & Hướng dẫn sử dụng

Xem chi tiết tài liệu và hướng dẫn tại:
[https://help.hostvn.vn/](https://help.hostvn.vn/)

## 🗺️ Lộ trình phát triển

- Thêm tính năng mới theo góp ý cộng đồng
- Bổ sung kỹ thuật tối ưu hóa
- Hỗ trợ các phiên bản Ubuntu/Debian mới
- Tăng cường bảo mật

## 🔧 Công nghệ sử dụng

<table>
  <tr>
    <td width="33%">
      <h4>Thành phần chính</h4>
      <ul>
        <li><a href="http://nginx.org/en/download.html">Nginx</a></li>
        <li><a href="https://downloads.mariadb.org/">MariaDB</a></li>
        <li><a href="https://www.php.net/">PHP</a></li>
        <li><a href="https://www.clamav.net/">ClamAV</a></li>
        <li><a href="https://www.imunify360.com/antivirus">ImunifyAV</a></li>
      </ul>
    </td>
    <td width="33%">
      <h4>Công cụ quản trị</h4>
      <ul>
        <li><a href="https://www.phpmyadmin.net/">phpMyAdmin</a></li>
        <li><a href="https://github.com/elijaa/phpmemcachedadmin">PHPMemcachedAdmin</a></li>
        <li><a href="https://github.com/erikdubbelboer/phpRedisAdmin">phpRedisAdmin</a></li>
        <li><a href="https://rclone.org/">Rclone</a></li>
      </ul>
    </td>
    <td width="33%">
      <h4>Công cụ phát triển</h4>
      <ul>
        <li><a href="https://wp-cli.org/">WP-CLI</a></li>
        <li><a href="https://getcomposer.org/">Composer</a></li>
        <li>Supervisor</li>
        <li>Let's Encrypt</li>
      </ul>
    </td>
  </tr>
</table>

## 📞 Liên hệ & Hỗ trợ

<table>
  <tr>
    <td width="50%">
      <h4>Kênh chính thức</h4>
      <ul>
        <li>🌐 <b>Website</b>: 
          <a href="https://hostvn.vn">hostvn.vn</a>, 
          <a href="https://hostvn.net">hostvn.net</a>
        </li>
        <li>👥 <b>Nhóm Facebook</b>: 
          <a href="https://www.facebook.com/groups/hostvn.vn">Cộng đồng HOSTVN</a>
        </li>
        <li>📧 <b>Email</b>: 
          <a href="mailto:sanvv@hostvn.com">sanvv@hostvn.com</a>
        </li>
      </ul>
    </td>
    <td width="50%">
      <h4>Góp ý & Đóng góp</h4>
      <ul>
        <li>🐛 Báo lỗi qua <a href="https://github.com/TinyActive/panel/issues">GitHub Issues</a></li>
        <li>💡 Đề xuất tính năng qua nhóm Facebook</li>
        <li>🔧 Đóng góp code qua Pull Request</li>
        <li>📝 Cải thiện tài liệu</li>
      </ul>
    </td>
  </tr>
</table>

<p>Chúng tôi luôn lắng nghe góp ý để cải thiện TinyPanel. Mọi ý kiến đóng góp đều giúp dự án tốt hơn cho cộng đồng!</p>

## 👨‍💻 Đội ngũ & Ghi nhận

<table>
  <tr>
    <td width="50%">
      <h4>Nhà phát triển chính</h4>
      <ul>
        <li>👨‍💻 <b>Sanvv</b> - Lập trình viên chính</li>
        <li>👨‍💻 <b>Mạnh Tường</b> - Lập trình viên</li>
      </ul>
    </td>
    <td width="50%">
      <h4>Dựa trên</h4>
      <ul>
        <li>🏆 Script gốc HOSTVN.VN</li>
        <li>🏆 Đóng góp từ cộng đồng mã nguồn mở</li>
      </ul>
    </td>
  </tr>
</table>

<div align="center">
  <p>
    <sub>© 2025 TinyPanel - Dựa trên HOSTVN Scripts</sub>
  </p>
  <p>
    <a href="https://github.com/TinyActive/panel/blob/main/Contributors.md">Hướng dẫn đóng góp</a> •
    <a href="https://github.com/TinyActive/panel/blob/main/changelog.txt">Lịch sử thay đổi</a>
  </p>
</div>
