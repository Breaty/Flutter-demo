
import 'package:flutter/material.dart';

///这里是一些常用组件
class SomeWidgetChild extends StatelessWidget{
  final String title;

  const SomeWidgetChild({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle titleStyle = TextStyle(fontSize: 20, color:Colors.deepOrangeAccent);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text(title)),
      body: ListView(children: [new Container(
          child:Column(
            children: [
              Text("空荡荡的首页"),
              SizedBox(height: 20),
              Text("接下来是一张美图", style:titleStyle),
              Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608528984547&di=a6eb289d7c79864629fa2a70fb0df500&imgtype=0&src=http%3A%2F%2Fww1.sinaimg.cn%2Fmw690%2Fa247f034gy1gjqgjzqbdzj21hc1hc4qr.jpg",
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text("这是一个输入框", style:titleStyle),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    hintText: '请输入',
                    hintStyle: TextStyle(fontSize: 14)
                ),
              ),
              SizedBox(height: 20),
              Text("这是很有意思的一个PageView，并且进行了一个小小的封装", style:titleStyle),
              Container(
                height: 100,
                margin:EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.lightBlue
                ),
                child: PageView(
                  children: <Widget>[
                    _item('Page1', Colors.red),
                    _item('Page2', Colors.orangeAccent),
                    _item('Page3', Colors.green),
                  ],
                ),
              )
            ],
          )
      )]),
    );
  }

  _item (String title, Color color){
    return Container(
        decoration: BoxDecoration( color: color ),
        alignment: Alignment.center,
        child:Text(title, style: TextStyle(color: Colors.white, fontSize: 22))
    );
  }
}