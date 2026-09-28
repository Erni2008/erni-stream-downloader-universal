#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

python3 -m pip install -r requirements.txt

vendor_dir="vendor/macos"
mkdir -p "$vendor_dir"

# Bundle the official self-contained yt-dlp binary so the downloaded app does
# not depend on Homebrew or a terminal installation.
yt_dlp_bin="$vendor_dir/yt-dlp"
curl -fL --retry 3 \
  "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_macos" \
  -o "$yt_dlp_bin"
chmod +x "$yt_dlp_bin"

ffmpeg_bin="$(command -v ffmpeg || true)"
ffprobe_bin="$(command -v ffprobe || true)"
deno_bin="$(command -v deno || true)"

if [ -z "$ffmpeg_bin" ] || [ -z "$ffprobe_bin" ]; then
  echo "ffmpeg and ffprobe are required only on the build machine." >&2
  exit 1
fi

extra_args=(
  --add-binary "$yt_dlp_bin:."
  --add-binary "$ffmpeg_bin:."
  --add-binary "$ffprobe_bin:."
)

if [ -n "$deno_bin" ]; then
  extra_args+=(--add-binary "$deno_bin:.")
fi

python3 -m PyInstaller \
  --noconfirm \
  --clean \
  --windowed \
  --name "ERNI Stream Downloader" \
  "${extra_args[@]}" \
  app.py

app_bundle="dist/ERNI Stream Downloader.app"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString 1.8.0" "$app_bundle/Contents/Info.plist"
/usr/libexec/PlistBuddy -c "Add :CFBundleVersion string 1.8.0" "$app_bundle/Contents/Info.plist" 2>/dev/null \
  || /usr/libexec/PlistBuddy -c "Set :CFBundleVersion 1.8.0" "$app_bundle/Contents/Info.plist"
codesign --force --deep --sign - "$app_bundle"

echo "Built: dist/ERNI Stream Downloader.app"
