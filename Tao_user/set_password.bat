@echo off
REM Lấy tên user hiện tại bằng biến %username%
set user=%username%

REM Đặt mật khẩu mới là a1234a
net user %user% a1234a

echo.
echo Mật khẩu của user %user% đã được đổi thành: a1234a
pause