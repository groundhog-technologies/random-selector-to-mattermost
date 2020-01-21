# Random Lunch
A simple RESTful API server to solve the hardest question in the world which is what's for lunch.

## Summary
People can put their own proposal for lunch and we can set a time to random pick from people's proposal.

## Requirement
docker

## Usage
### start server
```
make build
```

```
make run HOOKS=<HOOKS>
```

By default, the draw time will be today's noon
### Check the draw time
```
curl localhost:5000/time_info
```

### Check what are the current candidate
```
curl localhost:5000/lunch_candidate
```

### Add our proposal
```
curl -X POST -H "Content-Type: application/json" -d '{"raywu", "dumping"}' localhost:5000/lunch_candidate
```

### Check result 
```
curl localhost:5000/result
```

### Force draw now
```
curl -X POST localhost:5000/draw
```
