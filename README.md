Run Plex Media Server under Balena Cloud
---

## Deploy:
1. enable local development in Balena Web UI.

2. check ip for the device
```shell
sudo balena scan
```

3. push build template to the device
```shell
balena push {DEVICE IP}
```
