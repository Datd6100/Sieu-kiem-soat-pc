
# *Sieu-kiem-soat-pc*
# Các phần
+ Phần 1 ngrok
+ Phần 2 tạo user mới & quyền ad & đặt mật khẩu cho user chính 
+ Phần 3 RDP WRAPPER & THIẾT LẬP
+ Phần 4 auto login
+ Phần tải theo link
+ Phần khác 

# PHẦN CÀI NGROK & TDMC 3356
- kiểm tra thư mục shell:common startup
- kiểm tra http://127.0.0.1:4040

# Phần tạo user mới & quyền ad & đặt mật khẩu cho user chính 
+ **LÀM**
  + chạy các file.bat trong tao_user
  +  Nhấn **Win + R** → gõ **netplwiz** → **Enter**.
    + Bỏ chọn ô **“Users must enter a user name and password to use this computer”** (Người dùng phải nhập tên và mật khẩu để sử dụng máy tính này).
    + nếu không có phần ô trên chạy file.reg và vào lại
+ tải file REG tại đây **[Downloads](https://github.com/Datd6100/Sieu-kiem-soat-pc/blob/main/Chong_phat_hien/hien_o_autologin.reg)**
- **KIỂM TRA**
  + trong netplwiz có User: PCTH
  + Bỏ chọn ô **“Users must enter a user name and password to use this computer”**
  + khởi động lại máy có cần **mật khẩu cho user chính** không 
# link tải file
+ auto login
   + https://learn.microsoft.com/vi-vn/sysinternals/downloads/autologon
+ rdp wrap & file fix lỗi
  + https://github.com/stascorp/rdpwrap
  + https://github.com/sebaxakerhtc/rdpwrap.ini/blob/master/rdpwrap.ini
# phần khác 
+ # 2 RDP VÔ 1 user trong một phiên 
🔹 **Cách làm: Dùng Session Shadowing**

+ **✅ Thiết lập trong RDP Wrapper**

  + **1. Mở RDPConf.exe.**
  + **2. Trong mục Session Shadowing Mode, chọn:**
    + > Full access without permission → vào chung session, bạn toàn quyền điều khiển, người dùng không cần chấp nhận.
    + > Hoặc Full access with user’s permission → khi kết nối sẽ hiện popup cho user xác nhận.
  + **3. Lưu cài đặt, rồi Restart TermService.**

+ **✅ Kết nối vào session đang chạy**

  + **1. Lấy ID phiên (Session ID) của user hiện tại:**
    + Mở CMD → gõ:
      > query session
    + Sẽ thấy tên user, trạng thái, và số ID (ví dụ: 1)
  + **2. lệnh shadow để vào chung session:**
    + > mstsc /shadow:1 /control /noConsentPrompt

+ > */shadow:1 → số ID của session cần vào.*
+ > */control → cho phép điều khiển, không chỉ xem.*
+ > */noConsentPrompt → không cần user đồng ý (chỉ khi bạn chọn “without permission”).*
