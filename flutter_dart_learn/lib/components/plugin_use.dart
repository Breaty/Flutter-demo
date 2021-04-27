import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_dart_learn/components/utils.dart';

class PluginUse extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("flutter插件的使用")),
        body: new Container(
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
                new ListTile(
                  title: Text("包的获取"),
                ),
                ListCustomItemCard(contents: [
                  "网址:https://pub.dev/",
                  "使用方式：\n    https://pub.dev/packages/flutter_color_plugin",
                  "安装方法：\n    https://pub.dev/packages/flutter_color_plugin/install",
                  ""
                ]),
                new Container(
                  padding: EdgeInsets.only(top: 10,left: 20),
                  child: new Text(
                    "測試一下库的使用",
                    style: TextStyle(color: ColorUtil.color('#ff0000')),
                  ),
                )
            ],
          ),
        ),
    );
  }
}