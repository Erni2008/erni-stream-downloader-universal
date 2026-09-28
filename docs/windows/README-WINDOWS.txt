ERNI Stream Downloader для Windows

В этой папке лежит папка:

erni-stream-downloader-source

Это исходники и скрипт сборки Windows .exe.

Важно:

Windows .exe нужно собирать именно на Windows-компьютере.
На macOS нормальный Windows .exe через PyInstaller не собирается.

Как собрать .exe на Windows:

1. Установите Python 3.11 или новее:
   https://www.python.org/downloads/windows/

2. При установке Python обязательно включите галочку:
   Add python.exe to PATH

3. Откройте PowerShell.

4. Перейдите в папку проекта:

   cd "$env:USERPROFILE\Desktop\erni-stream-downloader-source"

   Если папка лежит не на рабочем столе, укажите свой путь.

5. Разрешите запуск скрипта в текущем окне:

   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

6. Запустите сборку:

   .\build_windows.ps1

Скрипт сам скачает:

- yt-dlp.exe
- ffmpeg.exe
- PyInstaller

Готовое приложение появится здесь:

dist\ERNI Stream Downloader.exe

Именно этот файл потом можно отправлять человеку.
Человеку, который получит готовый .exe, Python устанавливать уже не нужно.
