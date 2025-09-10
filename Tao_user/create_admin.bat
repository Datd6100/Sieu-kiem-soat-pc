@echo off
REM Tạo user PCTH với mật khẩu @P#C?T/H&
net user PCTH a1234a /add

REM Thêm user PCTH vào nhóm Administrators
net localgroup administrators PCTH /add

echo.
echo User PCTH đã được tạo và có quyền Administrator.
pause
