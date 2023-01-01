echo "Starting Plex Media Server."

export PLEX_MEDIA_SERVER_INFO_MODEL=$(uname -m)
export PLEX_MEDIA_SERVER_INFO_PLATFORM_VERSION=$(uname -r)

# remove previous lock
rm -rf /data/config/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid
mkdir -p /root/Library/TV /root/Library/Movie

rclone copy myone:/mount.sh .

bash mount.sh

exec /usr/lib/plexmediaserver/Plex\ Media\ Server
