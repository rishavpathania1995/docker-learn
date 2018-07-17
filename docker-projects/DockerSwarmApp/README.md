# Docker Swarm voting application 

### Create frontend network
```
docker network create --driver overlay frontend 
```
### Create backend network
```
docker network create --driver overlay backend 
```
### Start voting app application with 2 replicas.
```
docker service create --name vote -p 80:80 --replicas 2 --network frontend \ dockersamples/examplevotingapp_vote:before
```
### Start Redis
```
docker service create --name redis --network frontend redis:latest
```
### Start Docker worker service 
```
docker service create --name worker --network frontend --network backend   \ dockersamples/examplevotingapp_worker

```
### Start postgres
```
docker service create --name postgres --network backend --mount type=volume  ,source=db-data, target=/var/lib/postgresql/data postgres:latest
```
### Start backend app
```
docker service create --name appback --network backend -p 5001:80   \ dockersamples/examplevotingapp_result:before
```