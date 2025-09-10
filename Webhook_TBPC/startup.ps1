# Webhook Discord của bạn
$webhookUrl = "https://discord.com/api/webhooks/1415227323409760318/WL7EAf94T-3mkGUOLVhMkXpr9rtfVyO2CSTIB87ZvQ1LKFJrPIwS1UvxjgHhXe8By5uC"

# Nội dung thông báo
$payload = @{
    username = "Windows-PC"
    content  = "✅ Máy tính **$(hostname)** đã khởi động lúc $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
}

# Gửi request đến Discord webhook
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body ($payload | ConvertTo-Json -Depth 10) -ContentType "application/json"