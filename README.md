# ERNI Stream Downloader

Desktop-приложение для macOS и Windows, которое скачивает ваши YouTube-стримы/видео через `yt-dlp` и `ffmpeg` без ручного ввода команд в терминале.

## Скачать готовую программу

Обычному пользователю **не нужно собирать приложение из кода и использовать Terminal**. Откройте раздел [Releases](https://github.com/Erni2008/erni-stream-downloader-universal/releases/latest), скачайте ZIP для своей системы, распакуйте его и запустите приложение.

Готовая macOS-версия уже содержит `yt-dlp`, `ffmpeg`, `ffprobe` и `deno`. Отдельная установка через Homebrew не требуется.

Версия 1.8.0 также исправляет повторяющийся `HTTP Error 403: Forbidden`: приложение использует свежий встроенный `yt-dlp` и не продолжает старый повреждённый `.part` по истёкшей ссылке YouTube.

Приложение предназначено только для скачивания собственных видео или видео, на которые у вас есть разрешение. В нем нет обхода DRM, платного контента, приватных видео, авторизации или ограничений доступа.

## Главное

- Вставляете YouTube-ссылку.
- Выбираете папку сохранения.
- Выбираете качество: `Best available`, `1440p / 2K`, `1080p`, `720p`.
- Выбираете формат: `MP4` или `MKV`.
- Нажимаете `Download`.
- Приложение скачивает видео и звук, затем собирает итоговый файл через `ffmpeg`.

## Важное про MP4, звук и VEGAS Pro

YouTube часто отдает 2K/4K в кодеках VP9/AV1, а звук отдельно в Opus. Из-за этого обычный Windows-плеер или VEGAS Pro могут открыть файл без звука, без картинки или вообще показать ошибку импорта.

Поэтому режим `MP4` делает совместимый файл:

- video: `H.264`;
- audio: `AAC`;
- frame rate: `CFR`, constant frame rate;
- audio: `48 kHz stereo`;
- pixel format: `yuv420p`;
- container: `.mp4`.

Такой файл должен лучше открываться в Windows, macOS, Telegram, Discord и VEGAS Pro.

## Структура проекта

```text
erni-stream-downloader/
  app.py
  downloader/
    __init__.py
    core.py
    utils.py
    config.py
  docs/
    macos/
      README-MAC.txt
    windows/
      README-WINDOWS.txt
  ВСЕ ДЛЯ МАКА/
  ВСЕ ДЛЯ ВИНДЫ/
  requirements.txt
  build_mac.sh
  build_windows.ps1
  README.md
```

## macOS — только для разработчиков

Подробная инструкция:

```text
docs/macos/README-MAC.txt
```

Для самостоятельной сборки установить зависимости:

```bash
brew install yt-dlp ffmpeg
```

Запуск из кода:

```bash
python3 app.py
```

Сборка `.app`:

```bash
chmod +x build_mac.sh
./build_mac.sh
```

Готовое приложение появится здесь:

```text
dist/ERNI Stream Downloader.app
```

## Windows

Подробная инструкция:

```text
docs/windows/README-WINDOWS.txt
```

На Windows нужен Python только для сборки `.exe`. Обычному человеку, который получает уже готовый `.exe`, Python не нужен.

Сборка:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\build_windows.ps1
```

Скрипт сам скачает:

- `yt-dlp.exe`;
- `ffmpeg.exe`;
- `PyInstaller`.

Готовый файл появится здесь:

```text
dist\ERNI Stream Downloader.exe
```

Этот `.exe` можно отправлять другому человеку. На его ПК не нужно отдельно устанавливать Python, `yt-dlp` или `ffmpeg`.

## Проверка качества

Кнопка `Проверить качество` запускает `yt-dlp -F` и показывает максимальное доступное качество.

Если доступно 1440p, можно выбирать:

```text
1440p / 2K
```

Если доступно качество выше 2K, например 4K, для максимума выбирайте:

```text
Best available
```

## Пример

URL:

```text
https://www.youtube.com/live/F5gYUFV7180
```

Рекомендуемые настройки:

```text
Quality: 1440p / 2K
Format: MP4
Temporary local folder: enabled
```

## Типичные проблемы

### File too large / Errno 27

Скорее всего флешка или диск в FAT32. FAT32 не поддерживает файлы больше 4 GB.

Решение: переформатировать диск в `exFAT`.

### No space left on device

На диске не хватает места. Освободите место или выберите другую папку.

### Format is not available

Выбранное качество недоступно для этого видео. Нажмите `Проверить качество` и выберите рекомендованный вариант.

## License

MIT
