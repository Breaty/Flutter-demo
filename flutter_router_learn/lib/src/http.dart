import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

Dio dio = Dio();

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Demo"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50),
            child: Container(
              color: Colors.black,
              child: new Transform(
                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 120.0),
            //容器外填充
            constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
            //卡片大小
            decoration: BoxDecoration(
                //背景装饰
                gradient: RadialGradient(
                    //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98),
                boxShadow: [
                  //卡片阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            transform: Matrix4.rotationZ(.2),
            //卡片倾斜变换
            alignment: Alignment.center,
            //卡片内文字居中
            child: Text(
              //卡片文字
              "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
          RaisedButton(
              child: Text("初始化请求"),
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = false;
                        _text = "正在请求...";
                      });
                      // _httpGet("http://192.168.0.196:1886/init?a=1");
                      try {
                        Response response = await dio.get(
                            "http://192.168.0.196:1886/init?id=12&name=wendu");
                        _text = response.data.toString();

                        //直接传参
                        // Response posres =await dio.post("http://192.168.0.196:1886/login?password=12&name=wendu", data:{"username":"loginuser", "password":"123456"});

                        //这个是formdata
                        FormData formData = new FormData.fromMap(
                            {"username": "loginuser", "password": "123456"});
                        Response postFormRes = await dio.post(
                            "http://192.168.0.196:1886/login",
                            data: formData);

                        print("????" + response.data.toString());
                        // print("????post: "+posres.data.toString());
                        print(
                            "????postFormRes: " + postFormRes.data.toString());
                      } catch (e) {
                        _text = "请求失败：$e";
                      } finally {
                        setState(() {
                          _loading = false;
                        });
                      }
                    }),
          Text("请求状态: $_text"),
        ],
      ),
    );
  }

  _httpGet(String url) async {
    try {
      HttpClient httpclient = new HttpClient();
      HttpClientRequest request = await httpclient.getUrl(Uri.parse(url));

      //使用iPhone的UA
      request.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      //等待连接服务器（会将请求信息发送给服务器）
      HttpClientResponse response = await request.close();
      //读取响应内容
      _text = await response.transform(utf8.decoder).join();
      //输出响应头
      print(response.headers);
      //关闭client后，通过该client发起的所有请求都会中止。
      httpclient.close();
    } catch (e) {
      _text = "请求失败：$e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
