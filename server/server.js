let WebSocketServer = require('ws').Server;
let express = require("express");
let { PORT} = require('./config.json');
const myParser = require('body-parser');
const multer = require('multer');
const path = require('path');

PORT = process.env.PORT || PORT;

let wss = new WebSocketServer({ port: PORT+1 });
console.log('wss监听端口： ', PORT+1);

wss.on("connect", function(ws){
    console.log('\n socket链接成功 ');

    ws.on("message", function (data){
        console.log("收到消息：", data );
        ws.send(JSON.stringify({type:"init", data:"hello"}));
    })

})


let app = express();

app.use(myParser.json());
app.use(myParser.urlencoded({ extended: false }));
app.use("/assets",express.static(path.join(__dirname,'assets')));

app.all('*', function (req, res, next) {
    console.log("有请求：",req.path,req.method,req.body,req.query);
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
    res.header("Access-Control-Allow-Credentials", true);
    res.header("Content-Type", "application/json;charset=utf-8");
    res.header("X-Powered-By", ' 3.2.1');
    next();
});  

app.listen(PORT, ()=>{
    console.log(`app listen: ${PORT}`);
})

app.get("/init", init);
app.post("/login",multer({}).single(),login);//
app.post("/test",test);//


function init(req, res) {
    console.log("收到参数：", req.query);
    res.send("OK");
}

function login(req, res){
    console.log("login收到参数：", req.body, req.params, req.query);
    res.send("OK")
}
function test(req, res){
    console.log("test收到参数：", req.body, req.params, req.query);
    res.send("OK")
}