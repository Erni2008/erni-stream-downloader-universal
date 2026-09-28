# macOS Guide

## Для обычного запуска

Если у вас уже есть:

```text
ERNI Stream Downloader.app
```

можно перенести приложение на рабочий стол или в `Applications` и открыть двойным кликом.

Если macOS покажет предупреждение безопасности:

1. Нажмите правой кнопкой по приложению.
2. Выберите `Open`.
3. Подтвердите запуск.

## Установка зависимостей

На macOS должны быть установлены `yt-dlp` и `ffmpeg`.

Если Homebrew уже установлен:

```bash
brew install yt-dlp ffmpeg
```

Если Homebrew не установлен:

```text
https://brew.sh
```

## Запуск из кода

```bash
python3 app.py
```

## Сборка `.app`

```bash
chmod +x build_mac.sh
./build_mac.sh
```

Готовое приложение появится здесь:

```text
dist/ERNI Stream Downloader.app
```

## Внешние диски и флешки

Если сохраняете большое видео на флешку или внешний диск, лучше включить:

```text
Download to temporary local folder first, then copy to selected drive
```

Так приложение сначала скачает и соберет файл на локальном диске, а потом скопирует готовый файл на внешний диск.

## VEGAS Pro и MP4

Даже на macOS режим `MP4` делает файл совместимым:

- H.264 video;
- AAC audio;
- CFR, constant frame rate;
- 48 kHz stereo;
- yuv420p.

Такой файл легче открыть в Windows-плеерах и VEGAS Pro.
