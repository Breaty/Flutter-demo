import 'package:flutter/material.dart';

//dart 常用数据类型
class DartType extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DartType> {
  @override
  Widget build(BuildContext context) {
    _numType();

    /*_stringType();

    _booleanType();

    _listType();

    _MapType();
    _tips();*/

    return Scaffold(
      appBar: AppBar(title: Text("常用数据类型以及用法"),
          leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back),
          )),
      body: new Container(
          child: new ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 50),
            children: [
              new ListTile(
                contentPadding: EdgeInsets.only(top: 0, left: 10, bottom: 0),
                title: new Text("一、常用数字类型:", style: TextStyle(fontSize: 20)),
                subtitle: new Text("测试案例请在方法_numberType中查看"),
              ),
              new ListTile(
                  contentPadding: EdgeInsets.only(top: 0, left: 20, bottom: 0),
                  title: new Text("num"),
                  subtitle: new Text("数字类型的父亲，既可以是整数也可以是小数"),
                  focusColor: Colors.blue),
              new ListTile(
                contentPadding: EdgeInsets.only(top: 0, left: 20, bottom: 0),
                title: new Text("int"),
                subtitle: new Text("整型，只能是整数"),
              ),
              new ListTile(
                contentPadding: EdgeInsets.only(top: 0, left: 20, bottom: 0),
                title: new Text("double"),
                subtitle: new Text("双精度型"),
              ),
              new ListTile(
                contentPadding: EdgeInsets.only(top: 0, left: 10, bottom: 0),
                title: new Text("二、数值类型之间的转换:", style: TextStyle(fontSize: 20)),
                subtitle: Text("以下以数字number作为案例"),
              ),
              new ListTile(
                title: Text("运算符"),
                subtitle: Text(
                    "+、 - 、* 、/ 、 ~/ 、 %"),
              ), new ListTile(
                title: Text("数值常用属性"),
                subtitle: Text(
                    "isNaN、isEven、isOdd(后两者只有整型有)"),
              ),
              new ListTile(
                title: Text("数值常用方法"),
                subtitle: Text(
                    "abs()、round()、floorl()、ceil()、toInt()、toDouble()"),
              ),
              new ListTile(
                title: Text("取绝对值"),
                subtitle: Text("num.abs()"),
              ),
              new ListTile(
                title: Text("数值转整型"),
                subtitle: Text("number.toInt()"),
              ),
              new ListTile(
                title: Text("数值转双精度double型"),
                subtitle: Text("number.toDouble()"),
              ),
              new ListTile(
                  contentPadding: EdgeInsets.only(top: 0, left: 10, bottom: 0),
                  title: new Text("三、String类型以及常用方法:",
                      style: TextStyle(fontSize: 20)),
                  subtitle: Text("以下以字符串str5作为测试文本")),
              new ListTile(
                  contentPadding: EdgeInsets.only(top: 0, left: 10, bottom: 0),
                  title: new Text("字符串拼接"),
                  subtitle: Text("字符串拼接可以通过\$或者+号拼接")),
              new ListTile(
                  contentPadding: EdgeInsets.only(top: 0, left: 10, bottom: 0),
                  title: new Text("字符串截取 substring"),
                  subtitle: Text(
                      "字符串截取从startindex~endindex之间的字符串(不含endindex字符)：str5.substring(startindex, endindex)")),
              new ListTile(
                title: Text("判断字符串中是否包含某个字符 contains"),
                subtitle: Text("str5.contains('判断的字符')"),
              ),
              new ListTile(
                title: Text("pattern分割字符 split"),
                subtitle: Text("str5.split(pattern)"),
              ),
              new ListTile(
                title: Text("字符串替换 replaceAll"),
                subtitle: Text("全部替换：str5.replaceAll('被替换内容'，'替换内容')"),
              ),
              new ListTile(
                title: Text("字符串可遍历替换 replaceAllMapped"),
                subtitle: Text(
                    "遍历替换：str5.replaceAllMapped('被替换内容',(Match m)=>'替换内容')"),
              ),
              new ListTile(
                title: Text("判断字符串是不是以某个字符开始的 startsWith"),
                subtitle: Text("遍历替换：str5.startsWidth('判断内容')"),
              ),
              new ListTile(
                title: Text("判断字符串是不是以某个字符结束的 endsWith"),
                subtitle: Text("遍历替换：str5.endsWith('判断内容')"),
              ),

              new ListTile(
                  contentPadding: EdgeInsets.only(top: 0, left: 10, bottom: 0),
                  title: new Text("三、bool类型",
                      style: TextStyle(fontSize: 20)),
                  subtitle: Text(
                      "布尔类型， Dart是强 bool 类型检查， 只有 bool 类型的值是true 才被人为是true, 更多请看方法_booleanTYpe")),
              new ListTile(
                  contentPadding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  title: new Text("四、List数组类型",
                      style: TextStyle(fontSize: 20)),
                  subtitle: Text("List类型和js Array类似，下面列举几个基本项，其余请参考方法_listType")),
              new ListTile(
                title: Text("定义一个数组 List"),
                subtitle: Text(
                    "可以指定泛型（int）List<int> list = [1,2,3,4]，也可以使用generate"),
              ),
              new ListTile(
                title: Text("往数组中添加新元素 add/addAll"),
                subtitle: Text(
                    "添加单个：list.add(newItem)，直接讲一个数组添加到list中： list.addAll(newList)"),
              ),
              new ListTile(
                title: Text("移除数组的指定元素 remove"),
                subtitle: Text("list.remove('移出项')"),
              ),
              new ListTile(
                title: Text("List转map类型 asMap"),
                subtitle: Text("数组转map, 索引将作为map的key值：list.asMap()"),
              ),
              new ListTile(
                title: Text("List倒序 reversed"),
                subtitle: Text("list.reversed, 返回一个新的数组"),
              ),

              new ListTile(
                  contentPadding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  title: new Text("五、Map类型数据",
                      style: TextStyle(fontSize: 20)),
                  subtitle: Text(
                      "Map类型是以key:value键值对格式存储的数据集合,Map对象不能是能json的.取值，只能使用中括号，详见方法_MapType")),
              new ListTile(
                title: Text("Map遍历方式"),
                subtitle: Text(
                    "forEach: map.forEach((key, value) {}), map: map.map((key, value) {return MapEntry(value, key);}),for：for(var i in map.keys){}; "),
              ),
              new ListTile(
                title: Text("Map取值 keys、values"),
                subtitle: Text(
                    "通过中括号取值 map['key'], 获取key的数组：map.keys， 获取value的数组：map.values"),
              ),
              new ListTile(
                title: Text("Map移除值 remove"),
                subtitle: Text(
                    "移除某个key的对象：map.remove(key), 返回移除的value,该方法直接修改原本的map"),
              ), new ListTile(
                title: Text("Map判断是否包含某个key(containsKey)/value(containsValue)"),
                subtitle: Text(
                    "map.containsKey('key'),map.containsValue('value') 返回一个bool"),
              ),

              new ListTile(
                  title: Text("六、var object Object三者的区别",
                      style: TextStyle(fontSize: 20))
              ),
              new ListTile(
                title: Text("dynamic 动态数据类型"),
                subtitle: Text(
                    "dynamic类型数据只有在使用的时候才知道是什么类型的数据，优点：通过dynamic可以定义任意类型数据  缺点：会使语法检查失效"),
              ),
              new ListTile(
                title: Text("var 关键字"),
                subtitle: Text(
                    "var是一个关键字， 不关心数据类型是什么，但是一定义后不能再更改数据类型,如果定义时没有确定类型，可以重新赋值其他类型，但是不建议这么做"),
              ),
              new ListTile(
                title: Text("Object 类型"),
                subtitle: Text("Object是一个基类"),
              ),

            ],
          )
      ),
    );
  }

  void _numType() {
    num num1 = -1.0; //是数字类型的父亲
    num num2 = 2;

    int int1 = 3; //只能是整数
    double double1 = 1.68; //双精度型
    print(
        "--------------------number 常用类型和方法-------------------------------------------");

    print("num类型 num1: $num1 ， num2: $num2 , int1: $int1 , double:$double1");

    //数据类型转换
    print("以下为数字num1进行的数据类型转换,原值：$num1");
    print("以下为数字num1进行的数据类型转换,原值：$num1");
    print('转换绝对值:${num1.abs()}'); //绝对值
    print('转换整数:${num1.toInt()}'); //绝对值
    print('转换双精度:${num1.toDouble()}'); //绝对值
    print('运算符 ~/ :${10 ~/ 8 }');//取整
    print('运算符 ~/ :${5 ~/ 8 }');//取整
    print('运算符 isNaN :${num1.isNaN}');
    print('运算符 isEven :${int1.isEven}');//只有整型有
    print('运算符 isOdd :${int1.isOdd}');//只有整型有
  }

  void _stringType() {
    String str1 = "字符串1",
        str2 = '单引号字符串2';
    String str3 = '\$字符拼接 str:$str1 str2:$str2';
    String str4 = '+字符拼接 str:' + str1 + ' str2:' + str2;
    String str5 = "常用字符串数据类型，请查看控制台输出";
    print(
        "--------------------String 常用方法-------------------------------------------");

    print(str3);
    print(str4);

    print("先看看str5都是些什么:$str5");
    print("裁剪索引从1到5的部分：${str5.substring(1, 5)}");
    print("文本中‘类型’的索引：${str5.indexOf('类型')}");
    print("str5里面包含文本‘请’吗？${str5.contains("请")}");
    print("str5里面包含文本‘中国’吗？${str5.contains("中国")}");
    print("字符分割：${str5.split("查看")}");
    print("字符替换：${str5.replaceAll("查看", '—替换内容—')}");
    print("可遍历型字符替换：${str5.replaceAllMapped("查看", (Match m) => '.替换内容.')}");
    print("判断是不是以某个字符(常用)开始的：${str5.startsWith('常用')}");
    print("判断是不是以某个字符(字符串)开始的：${str5.startsWith('字符串')}");
    print("判断是不是以某个字符(输出)结束的：${str5.endsWith('输出')}");
    print("判断是不是以某个字符(字符串)结束的：${str5.endsWith('字符串')}");
  }

  //布尔类型， Dart是强 bool 类型检查， 只有 bool 类型的值是true 才被人为是true
  void _booleanType() {
    bool success = true,
        fail = false;

    print(
        "--------------------bool 常用方法-------------------------------------------");

    print(success);
    print(fail);

    print("true | false: ${success | fail}");
    print("true || false: ${success || fail}");
    print("true && false: ${success && fail}");
    print("true & false: ${success & fail}");
  }

  void _listType() {
    print(
        "--------------------list 数组型 常用方法-------------------------------------------");
    List list = [1, 2, 3, '集合']; //初始化添加元素

    //指定泛型
    List<int> list2 = [1, 2, 3]; //指定泛型后不能再有其他类型的项，否则会报错

    List<int> list3 = [];

    // list3 = list;//会报错type 'List<dynamic>' is not a subtype of type 'List<int>' 泛型的不能复制给int型的数组

    list3.add(1); //通过add添加元素
    list3.addAll(list2); //通过addAll添加元素,将整个数组添加进去

    List<int> list4 = List.generate(10, (index) => index * 2); //只用迭代器复制

    // List<int> list5 = list4.remove(0);

    print("集合list：${list}");
    print("集合list3：${list3}");
    print("集合list4：长度：${list4.length} , ${list4}");
    print("集合list4移除4：${list4.remove(4)}");
    print("集合list4移除后：${list4}");
    print("集合list4逆序：${list4.reversed}");
    print("集合list4中8的索引：${list4.indexOf(8)}");
    print("集合list4转map：${list4.asMap()}");
    print("集合list4第一个元素：${list4.first}");
    print("集合list4最后一个元素：${list4.last}");
    print("集合list4 hashCode：${list4.hashCode}");

    //  集合遍历的方式
    for (int i = 0; i < list4.length; i++) {
      // print("遍历元素${list4[i]}");
    }

    for (var o in list4) {
      // print("遍历元素${o}");
    }

    list4.forEach((element) {
      // print("遍历元素${element}");
    });
  }

  void _MapType() {
    print(
        "--------------------Map类型 常用方法-------------------------------------------");

    //Map初始化
    Map names = {'xiaoming': "小明", "xiaohong": "小红"};
    Map ages = {};

    //赋值方式 map不支持json的.取值，只能用中括号
    ages['xiaoming'] = 18;
    ages['xiaohong'] = 28;
    ages['moumou'] = 28;


    print("names: $names");
    print("names keys: ${names.keys}");
    print("names values: ${names.values}");
    print("names containsKey 是否包含moumou: ${names.containsKey('moumou')}");
    print(
        "names containsKey key中是否包含xiaoming: ${names.containsKey('xiaoming')}");
    print("names containsValue value中是否包含'小明': ${names.containsValue('小明')}");
    print("移除moumou前: $ages");
    print("移除moumou的返回: ${ages.remove('moumou')}");
    print("移除moumou后: ${ages}");

    //  遍历方式
    ages.forEach((key, value) {
      print("遍历：key:$key, value:$value");
    });

    Map ages2 = ages.map((key, value) {
      return MapEntry(value, key);
    });

    for (String key in ages.keys) {
      print("输出数据：key: $key,value: ${ages[key]}");
    }
    print("返回一个新的key,value颠倒的age map：$ages2");
  }

  //科普小知识： var object Object三者的区别
  void _tips() {
    print(
        "-------------------- var object Object -------------------------------------------");

    //动态数据类型 dynamic ， 优点：通过dynamic可以定义任意类型数据  缺点：会使语法检查失效
    dynamic x = 'hal';

    print(" dynamic $x");
    print(" dynamic runtimeType ${x.runtimeType}");
    x = 123;

    print(" 重新赋值后dynamic runtimeType ${x.runtimeType}");

    //  var 数据类型 var是一个关键字， 不关心数据类型是什么，但是一定义后不能再更改数据类型,如果定义时没有确定类型，可以重新赋值其他类型，但是不建议这么做
    var a = 'var 类型';
    // a = 123;//会报错

    var b = 123;
    b = 456;

    var c;
    c = 123;

    print("a：${a}");
    print("b：${b}");
    print("c：${c}");
    print("a的数据类型：${a.runtimeType}");


    Object obj = "122";

    print("obj:$obj, 类型：${obj.runtimeType}");
    print("obj:$obj, 类型：${obj}");
  }
}