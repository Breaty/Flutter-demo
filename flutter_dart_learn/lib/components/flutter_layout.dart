import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FlutterLayout extends StatelessWidget {
  final title;

  const FlutterLayout({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: new Container(
        child: ListView(
          shrinkWrap: true,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                new Container(
                  padding: EdgeInsets.all(10),
                  child: ClipOval(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608528984547&di=a6eb289d7c79864629fa2a70fb0df500&imgtype=0&src=http%3A%2F%2Fww1.sinaimg.cn%2Fmw690%2Fa247f034gy1gjqgjzqbdzj21hc1hc4qr.jpg"),
                    ),
                  ),
                ),
                new Card(
                  child: Text("这是一个裁剪的圆形图片"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Container(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      //裁剪一个方形的图
                      borderRadius: BorderRadius.circular(10), //加一个10的圆角
                      child: Opacity(
                        opacity: 0.6, //价格透明度 60%
                        child: Image.network(
                          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608528984547&di=a6eb289d7c79864629fa2a70fb0df500&imgtype=0&src=http%3A%2F%2Fww1.sinaimg.cn%2Fmw690%2Fa247f034gy1gjqgjzqbdzj21hc1hc4qr.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ),
                new Card(
                  child: Text("这是一个裁剪的方形图片，透明度只有60%"),
                ),
              ],
            ),
            Container(
                height: 100,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    // color: Colors.lightBlue
                    ),
                child: PhysicalModel(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  clipBehavior: Clip.antiAlias,
                  child: PageView(
                    children: <Widget>[
                      _item('Page1', Colors.red),
                      _item('Page2', Colors.orangeAccent),
                      _item('Page3', Colors.green),
                    ],
                  ),
                )),
            Column(
              children: [
                /// 这个组件可以撑满整个宽度哦，可以设置宽度的百分比
                FractionallySizedBox(
                  widthFactor: 0.8, //相当于整体宽度的80%
                  child: Container(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Text("撑满整个屏幕啊"),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 60),
                  // height: 156,
                  child: Image.asset(
                    "assets/login-top-bg.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                    top: 70,
                    left: 150,
                    child: Center(
                      child: Image.asset(
                        "assets/login-logo.png",
                        width: 109,
                      ),
                    )),
              ],
            ),
            Text("创建一个wrap布局， 从左往右进行排列，会自动换行"),
            ///创建一个wrap布局， 从左往右进行排列，会自动换行
            Wrap(
              spacing: 10, //水平间距
              runSpacing: 6, //垂直间距
              children: [
                _chip("bbbbb"),
                _chip("2222"),
                _chip("2222"),
                _chip("2222"),
                _chip("2222"),
                _chip("2222"),
                _chip("2222"),
              ],
            ),
            Text("创建一个列表吧")
          ],
        ),
      ),
    );
  }

  _item(String title, Color color) {
    return Container(
        decoration: BoxDecoration(color: color),
        alignment: Alignment.center,
        child:
            Text(title, style: TextStyle(color: Colors.white, fontSize: 22)));
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(label.substring(0, 1), style: TextStyle(fontSize: 10)),
      ),
    );
  }
}

//使用Expanded
class UseExpanded extends StatelessWidget {
  final String title;

  const UseExpanded({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(

            ///对齐方式
            alignment: Alignment.center,
            child: _column()
            /* SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: _column()),*/
            ));
  }

  _column() {
    TextStyle titleStyle = TextStyle(fontSize: 20, color:Colors.deepOrangeAccent);

    return Column(
      children: <Widget>[
        Text("Expanded和其他滚动组件不兼容！！！！！！！超出屏幕范围肯定会报错",style: titleStyle,),
        Text("保持：Expanded、Flexible只在Row、Column等组件内，不在其他组件内使用"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Text("这是一个列表哈"),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.orange,
              child: Text("我想要完全撑满的高度"),
            )),
      ],
    );
  }
}
