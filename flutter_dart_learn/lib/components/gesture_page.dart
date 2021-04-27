import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///手势检测


class GesturePage extends StatefulWidget{
  final String title;

  const GesturePage({Key key, @required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _GesturePage(title);
}

class _GesturePage extends State<GesturePage>{
  final String title;
  String printString = "";
  //小球的位置
  double moveX = 0.0, moveY = 0.0;
  _GesturePage(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '路由的返回设置',
      home: Scaffold(
        appBar: AppBar(title: Text(title),
        ///这里是配置的返回按钮
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.backpack),
        ),

        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=>_printMsg('点击'),
                    onDoubleTap: ()=>_printMsg('双击'),
                    onLongPress: ()=>_printMsg('长按'),
                    onTapCancel: ()=>_printMsg('取消'),
                    onTapUp: (e)=>_printMsg('松开'),
                    onTapDown: (e)=>_printMsg('按下'),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color:Colors.deepOrange),
                      child: Text("点我",style:TextStyle(fontSize: 36, color: Colors.white)),
                    ),
                  ),
                  RaisedButton(
                      child: Text("清空"),
                      onPressed: (){
                        setState(() {
                          printString = "";
                        });
                      }),
                  Text("事件执行顺序：$printString"),
                  _card("1. 单纯点击：按下->松开->点击"),
                  _card("2. 长按：按下->取消->长安"),
                  _card("3. 按下后鼠标移出区域：按下->取消"),
                  _card("4. 双击：双击")
                ],
              ),
              Positioned(
                  top: moveX,
                  left: moveY,
                  child: GestureDetector(
                    onPanUpdate: (e)=>_doMove(e),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Text("跟着跑",style: TextStyle(fontSize:20,height: 2.8),textAlign: TextAlign.center),
                    ),
                  ))
            ],
          ),
        )
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      printString += " ,$msg";
    });
  }

  _card(String text){
    return new Card(
      child: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.all(10),
        child: Text(text,style: TextStyle(color: Colors.white),),
      ),
    );
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveY +=e.delta.dx;
      moveX +=e.delta.dy;
    });
  }


}
