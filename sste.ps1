# Устанавливаем WinRAR через Chocolatey
Write-Host "Установка WinRAR..."
choco install -y winrar

$temp_win = $env:TEMP

# Указываем путь к папке, где будет создана новая папка
$folderPath = $temp_win

# Указываем имя и путь к новой папке
$newFolderName = "steam_temp"
$newFolderPath = Join-Path -Path $folderPath -ChildPath $newFolderName

# Создаем новую папку
New-Item -Path $newFolderPath -ItemType Directory -Force

# Указываем URL для скачивания архива
$downloadUrl = "https://github.com/floflo1231211/test/raw/main/steamstep.zip"

# Указываем путь к месту сохранения архива
$archivePath = Join-Path -Path $newFolderPath -ChildPath "steam.zip"

# Скачиваем архив
Invoke-WebRequest -Uri $downloadUrl -OutFile $archivePath

# Проверяем наличие скачанного архива
if (Test-Path $archivePath) {
    # Распаковываем архив
    Expand-Archive -Path $archivePath -DestinationPath $newFolderPath
} else {
    Write-Host "Ошибка: Не удалось скачать архив."
}

# Проверяем наличие распакованных файлов
if (Test-Path $newFolderPath) {
    Write-Host "Загрузка прошла успешно."
    cd "$($newFolderPath)/steamstep"
} else {
    Write-Host "Ошибка: Не удалось распаковать архив."
}