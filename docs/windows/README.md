# Windows Guide

## Для обычного пользователя

Если вам уже дали готовый файл:

```text
ERNI Stream Downloader.exe
```

ничего дополнительно устанавливать не нужно. Просто откройте `.exe` двойным кликом.

Если Windows SmartScreen покажет предупреждение:

```text
More info -> Run anyway
```

## Для сборки `.exe`

Python нужен только на компьютере, где собирается приложение.

### 1. Установите Python

Скачайте Python 3.11 или новее:

```text
https://www.python.org/downloads/windows/
```

При установке обязательно включите:

```text
Add python.exe to PATH
```

### 2. Откройте CMD или PowerShell

Перейдите в папку проекта:

```cmd
cd /d "C:\Users\YOUR_NAME\Desktop\erni-stream-downloader"
```

### 3. Запустите сборку

В PowerShell:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\build_windows.ps1
```

В CMD:

```cmd
powershell -ExecutionPolicy Bypass -File build_windows.ps1
```

### 4. Где будет `.exe`

После сборки:

```text
dist\ERNI Stream Downloader.exe
```

Этот файл можно отправлять другому человеку. Ему не нужны Python, `yt-dlp` и `ffmpeg`.

## Что делает build_windows.ps1

Скрипт автоматически:

- устанавливает зависимости из `requirements.txt`;
- скачивает `yt-dlp.exe`;
- скачивает `ffmpeg.exe`;
- собирает one-file `.exe` через PyInstaller;
- кладет `yt-dlp.exe` и `ffmpeg.exe` внутрь приложения.

## VEGAS Pro

Для `MP4` приложение делает совместимый файл:

- H.264 video;
- AAC audio;
- CFR, constant frame rate;
- 48 kHz stereo;
- yuv420p.

Это сделано, чтобы VEGAS Pro стабильнее импортировал видео.
