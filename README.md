```shell
docker compose -f "cronicle-cluster.yml" up --force-recreate --remove-orphans
```

In your webbrowser go to "localhost:5601", log in as default user and add the servers.
"cronicle-backup" now should be listed as "backup".

Now call "localhost:5603" in your webbrowser to open the cronicle-UI for the "cronicle-backup" instance, log in and it starts an infinite reload loop.