var app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io')(3000, {
  transports: ['websocket']
});
var bodyParser = require('body-parser');


//configure body-parser for express
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

server.listen(8888, function() {
  var host = server.address().address;
  var port = server.address().port;
  console.log("Example app listening at http://%s:%s", host, port);
});

app.get('/', function (req, res) {
  res.sendFile(__dirname + '/index.html');
});

app.post('/instance', function(req, res){
  response = {
      name : req.body.name,
      isRunning : req.body.isRunning,
      isWorking : req.body.isWorking,
      id: req.body.id
      };
  
  //this line is optional and will print the response on the command prompt
  //It's useful so that we know what infomration is being transferred 
  //using the server
  console.log(response);
  
  //convert the response in JSON format
  res.end(JSON.stringify(response));

  // send to socket.io
  io.sockets.emit('status', response);
});