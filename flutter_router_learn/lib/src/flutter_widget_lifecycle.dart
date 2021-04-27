import 'package:flutter/material.dart';

///flutter声明周期
/// 1. 初始化时期
/// createState  initState
/// 2. 更新时期
/// didChangeDependencies、 build、 didUpdateWidget
/// 3. 销毁期
class WidgetLifeCycle extends StatefulWidget {

  ///1. 当我们构建一个新的StateFulWidget时，这个会立即调用
  ///并且这个方式必须被覆盖（必须重写）
  @override
  _WidgetLifeCycleState createState() => _WidgetLifeCycleState();
}

class _WidgetLifeCycleState extends State<WidgetLifeCycle> {

  int _count = 0;


  ///这是创建widget时调用的除构造方法以外的第一个方法：
  ///类似Android的 onCreated 与 IOS 的viewDidLoad
  ///在这个方法中通常会做一些初始胡工作 比兔channel的 初始化 监听器的初始化等等
  @override
  void initState() {
    print("-1. -----------initState----");
    // TODO: implement initState
    super.initState();
  }
  ///当依赖的state对象改变时会调用
  ///a.在第一次构建Widget时，在initState之后立即调用此方法
  ///b.如果statefulWidgets依赖于InheritedWidget, 那么当当前State所依赖的InheritedWidget重的变量改变时会再次调用它
  ///拓展：InheritedWidget可以高效的将数据在widget树种向下传递的
  @override
  void didChangeDependencies() {
    print("-2.-----------didChangeDependencies----");
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("----3.-build-------------------------------------");
    var title=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title:Text(title)),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title("1. 初始化时期"),
            _List("createState initState"),
            _title("2. 更新时"),
            _List("didChangeDependencies\n 该方法调用时间:"
                "a.在第一次构建Widget时，在initState之后立即调用此方法\n"
                "b.如果statefulWidgets依赖于InheritedWidget, 那么当当前State所依赖的InheritedWidget重的变量改变时会再次调用它\n"
                "下面是一个测试，点击会修改显示的数字:$_count"),
            RaisedButton(onPressed: (){
                setState(() {
                  _count++;
                });
            },
              child: Text("点我", style:TextStyle(fontSize: 22)),
            )
          ],
        ),
      ),
    );
  }
  
  _title(String title){
      return Container(
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.only(bottom: 10),
        child: Text(title, style: TextStyle(fontSize: 20, color: Colors.deepOrange),),
      );
  }
  
  _List(String str){
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(str,style:TextStyle(fontSize: 18, height: 1.5)),
    );
  }
}
