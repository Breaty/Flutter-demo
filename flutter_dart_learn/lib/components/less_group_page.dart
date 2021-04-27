import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/components/learn_view.dart';

class LessgroupPage extends StatelessWidget {
  final String title;

  const LessgroupPage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: new Container(

          ///装饰器
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(10),

          ///对齐方式
          alignment: Alignment.center,

          ///这是一个滚动组件
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("这是一个文本组件", style: textStyle),
                Text("接下来是一个图标组件", style: textStyle),
                Icon(
                  Icons.android,
                  size: 50,
                  color: Colors.red,
                ),
                Text("接下来是两个按钮：", style: textStyle),
                CloseButton(),
                BackButton(),
                Text("这是个很有意思的组件：", style: textStyle),
                Chip(label: Text("Chip的内容"), avatar: Icon(Icons.people)),
                Text("Card是一个带有圆角阴影的卡片：", style: textStyle),
                Card(
                  color: Colors.orange, //背景色
                  elevation: 5,

                  ///阴影
                  margin: EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("我是卡片里面的内容哦", style: textStyle),
                  ),
                ),
                Text("下面是一个弹窗，就看看吧：", style: textStyle),
                AlertDialog(
                  title: Text("弹窗title"),
                  content: Text("这里是内容哦"),
                )
              ],
            ),
          )),
    );
  }
}
