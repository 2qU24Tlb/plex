echo "Starting Plex Media Server."

export PLEX_MEDIA_SERVER_INFO_MODEL=$(uname -m)
export PLEX_MEDIA_SERVER_INFO_PLATFORM_VERSION=$(uname -r)

# remove previous lock
rm -rf /data/config/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid

mkdir -p /root/.config/rclone/ && cp /data/rclone.conf /root/.config/rclone/

mkdir -p /root/Library/Movie /root/Library/Show /root/Library/4K

rclone mount unioah:/HotFilm /root/Library/Movie \
  --allow-other \
  --umask 002 \
  --vfs-read-chunk-size=32M \
  --poll-interval=1h \
  --dir-cache-time=2h \
  --buffer-size=0 \
  --cache-dir /tmp/vfs_cache \
  --vfs-cache-mode full \
  --no-checksum \
  --no-modtime \
  --vfs-read-wait 0 \
  --max-read-ahead 0 \
  --use-mmap \
  --fast-list \
  --checkers 2 \
  --no-check-certificate \
  --multi-thread-cutoff 0 \
  --multi-thread-streams 5 \
  --vfs-cache-max-age 10000h \
  --vfs-cache-max-size 10G \
  --use-cookies \
  --daemon

exec /usr/lib/plexmediaserver/Plex\ Media\ Server
