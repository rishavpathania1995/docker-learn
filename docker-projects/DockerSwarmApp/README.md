# Docker Swarm voting application 

```
docker network create --driver overlay frontend 
```

```
docker network create --driver overlay backend 
```

```
docker service create --name vote -p 80:80 --replicas 2 --network frontend \ dockersamples/examplevotingapp_vote:before
```

```
docker service create --name redis --network frontend redis:latest
```

```
docker service create --name worker --network frontend --network backend   \ dockersamples/examplevotingapp_worker

```
```
docker service create --name postgres --network backend --mount type=volume  ,source=db-data, target=/var/lib/postgresql/data postgres:latest
```
```
docker service create --name appback --network backend -p 5001:80   \ dockersamples/examplevotingapp_result:before
```
```
```