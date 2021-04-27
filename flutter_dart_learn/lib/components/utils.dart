import 'package:flutter/material.dart';

class ListCustomItemCard extends StatelessWidget {
  final List<String> contents;

  const ListCustomItemCard({Key key, @required this.contents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 5, //阴影
        margin: EdgeInsets.only(left: 20, right: 20,top: 10),
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contents.map<Widget>((element)=>Text('    $element')).toList(),
            )));
  }
}
