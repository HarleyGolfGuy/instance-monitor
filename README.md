# instance-monitor

> A Vue.js project which monitors instances of any worker service

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# start the server
nodemon ./server/server.js

```

## Instances

I currently have this set up to monitor instances numbered with an id from 1 to 24.

Your instances will need to be able to submit an http post.  To simulate and test use the 'curl' command
```
# Example curl command
curl -H "Content-Type: application/json" -X POST -d '{ "name": "instance-1", "isRunning": 1, "isWorking": 1, "id": 1}' http://localhost:8888/instance
```

The api is currently set up where you must name the instance "instance-$num" where $num is an integer.

* name : As mentione the name is 'instance-$num' where $num is an integer
* isRunning : binary 0 or 1 ... meant to show the service is up and running
* isWorking : binary 0 or 1 ... meant to show the service is working on a job
* id : Not really being used, but I set to an integer equal to the $num

