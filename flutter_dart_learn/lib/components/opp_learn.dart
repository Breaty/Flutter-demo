import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/components/utils.dart';
//定义一个类，Dart中所有的类都继承自Object

/*
* 面向对象
* 封装
* 继承
* 多态
* 构造方法: 初始化列表
* */

///定义一个Dart类 所有的类都（无指定默认）继承自Object

///标准的构造方法
class Person {
  String name;
  int age;

  //标准的构造方法 初始化变量
  Person(this.name, this.age);

  //通过override可以重载父类的方法
  @override
  String toString() {
    return '*****name:$name, age:$age';
  }
}

//通过 extends继承Person
class Student extends Person {
  //定义类的变量， 通过下划线标识私有字段（变量）， 外部无法访问
  String _school;
  final String city;
  String country;
  String name;

  //类的 初始化列表， 通过super调用父类的构造方法，完成自己的初始化
  //自有参数：通过this._school初始化自有参数，
  //父类参数：age name交给父类进行初始化
  //可选参数（传或者不传都可以的参数成为可选参数） city， 通过大括号包裹
  //默认参数 用户不传参则给一个默认值 country
  //以上参数不只是构造方法可用，其他方法也可以用
  Student(this._school, String name, int age,{this.city, this.country = "China"})
      :
        //初始化列表， 除了调用父类构造器，在子类构造器方法体之前，你也可以初始化变量，不同的变量之间用逗号分隔开
        name = '$country.$city',
        //初始化列表
        //如果父类没有默认的构造方法（无参的构造方法），则需要在初始列表中调用父类的构造方法，进行初始化
        super(name, age) {
    //构造方法的方法体，不是必须的，可有可无
    print('构造方法的方法体');
  }

  //静态方法
  static doPrint(String str){
    print("doPrint:$str");
  }


  //命名构造方法 [类+.+方法名]
  //使用命名构造方法为类实现多个构造方法
  //final的参数必须作为参数 （city）
  Student.cover(Student stu, this.city) : super(stu.name, stu.age) {
    //这里是方法体
    print("命名构造方法");
  }

  //命名工厂方法 factory【类名+.+方法名】
  //他可以有返回值，而且不需要将类的final变量作为参数，是提供一种灵活获取类对象的方式
  factory Student.stu(Student stu){
    return Student(stu._school, stu.name, stu.age);
  }

  /*
  * setter和 getter方法
  * 可以将私有字段设置getter来让外界获取到私有字段
  * 可以为私有字段设置setter来控制外界对私有字段的修改
  * */
  String get school => _school;
  set school (String value){
    this._school = value;
  }



  //重写父类的方法
  @override
  String toString(){
    return "name:${name}, school:${this._school}，city:$city, country: $country, 父类的数据：${super.toString()}";//最后一个是父类的tuString
  }
}

//工厂构造方法
class Logger {
  //创造一个实例
  static Logger _cache;

  //用于返回唯一的一个类的实例
  /*
    * 工厂构造方法：
    * 不仅仅是构造方法，更是一种模式
    * 有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足要求
    * 那么可以使用工厂模式来定义构造方法
    * */
  factory Logger() {
    if (_cache == null) {
      //一般调动一个私有的一个命名构造方法的实例， 一般是为了返回一个之前已经创建的对象
      _cache = Logger._internal();
    }
    return _cache;
  }

  Logger._internal();

  void log(String msg) {
    print(msg);
  }
}


/*
* 抽象类
* 通过abstract标识的类叫抽象类，可以有也可以没有抽象方法，但是只要有抽象方法，那就必须表示为抽象类
* 使用abstract 修饰符定义的方法，该类不能被实例化。抽象类在定义接口的时候非常有用， 抽象类可以有自己的方法，可以有一个不包括方法体的方法，正常的方法也可以
* */
abstract class Study{
  void study();

  String getDescciption(){
    return "我是抽象类的一个具体方法的返回";
  }
}

//如果不实现抽象类Study里面的抽象方法，那就必须也声明是抽象方法
//换句话说 继承抽象类需要实现里面的抽象方法 否则也需要将自己定义成抽象类，在前面加上 abstract
//这个方法符合mixins的特征
class StudyFlutter extends Study{
  @override
  void study() {
    // TODO: implement study
    print("我是继承了抽象类的抽象方法的输出");
  }

}

/*
* 为类添加特征：mixins
* mixins 实在多个类层次结构中重用代码的一种方式
* mixins 在width关键字后面跟上一个或者多个mixin 的名字 （多个的话  用逗号分割）， 并且with要位于extends关键字之后，不能位于之前
* mixin特征 实现mixins 就创建一个继承自Object的子类 而且不能声明任何的构造方法 不能使用super
* 当使用on关键字，则表示该mixin只能在那个类的子类使用了，那么结果显然的，mixin中可以调用那个类定义的方法、
*  */

class TextMixin extends Person with Study {
  TextMixin(String name, int age) : super(name, age);

  @override
  void study() {
    // TODO: implement study
  }
}

class SpecialParent {
  void doPrint(String str){
    print("special log:$str");
  }
}

///声明一个mixin
mixin Special on SpecialParent {

  @override
  void doPrint (String str){
      print("------------start-------------");
      super.doPrint(str);
      print("------------end-------------");
  }

}

///调用一下mixin
class UseMixin extends SpecialParent with Special{
  String str = "要不输出是是是哈哈啊啊啊a";

  @override
  void doPrint(String str) {
    // TODO: implement doPrint
    super.doPrint(str);
  }
}

class OppLearn extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    _oppLearn();

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("构造方法")),
        body: Container(
          // padding: EdgeInsets.all(10),
          child: new ListView(
            padding: EdgeInsets.only(bottom: 50),
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: Text(
                  "一、标准构造方法",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("详情见案例Person Student"),
              ),
              ListTile(
                title: Text(
                  "二、初始化列表",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "三、命名构造方法",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "四、常量构造方法",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "五、工厂构造方法",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              new Card(
                  elevation: 5, //阴影
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "   工厂构造方法不仅仅是构造方法，更是一种模式,有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足要求，那么可以使用工厂模式来定义构造方法"),
                  )),
              ListTile(
                title: Text(
                  "六、命名工厂构造方法",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "七、抽象类",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("    使用abstract标识的类"),
              ),
              new Card(
                  elevation: 5, //阴影
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child:Column(
                      children: [
                        Text("  使用abstract标识的类叫做抽象类，抽象类不一定有抽象方法，但是有抽象方法的class必须标识为抽象类"),
                        Text("  继承抽象类需要实现里面的抽象方法 否则也需要将自己定义成抽象类，在前面加上 abstract")
                      ],
                    ))),
              ListTile(
                title: Text(
                  "八、mixin",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("    mixins(混入类)是一个可以把自己的方法提供给其他类使用，但却不需要成为其他类的父类的类。通过with添加"),
              ),
              ListCustomItemCard(contents: [
                "mixin本身可以是抽象的，可以定义各种方法属性，也可以是抽象的，等后续类去实现",
                "mixins 在width关键字后面跟上一个或者多个mixin 的名字 （多个的话  用逗号分割）， 并且with要位于extends关键字之后，不能位于之前",
                "当使用on关键字，则表示该mixin只能在那个类的子类使用了，那么结果显然的，mixin中可以调用那个类定义的方法",
                '如果mixin存在冲突的部分，后面会覆盖前面的，没有冲突的则会保留，所以可以存在后面的mixin修改了前面的mixin的一部分逻辑的情况，不需要直接继承即可实现覆盖，避免了更复杂的继承关系'],)
            ],
          ),
        ));
  }

  void _oppLearn(){
    Logger log1 = Logger();
    Logger log2 = Logger();
    log1.log("？？？？？？？？");
    print('--------------------- OppLearn --------------------------');
    print("两个相等吗：${log1 == log2 }");

    //可选参数通过 key:value 传参
    Student stu = Student("北方民族大学", '名字', 18,city:'宁夏',country:"中国");
    stu.name = "换个名字吧";

    //这里打印的数据是通过Person的toString方法得到的结果
    print("输出的啥：$stu");
    stu._school = "换个学校吧";//也可以改
    print(stu._school);
    //静态方法只能通过类名调用，实例stu不可以调用
    Student.doPrint("随便打印点啥");

    //以下为测试传参
    printPerson1('tt');
    printPerson1('tt',age:15);
    
    printPerson2('name');
    printPerson2('name',188);


    Student stu2 = Student('清华大学', '天才tom', 20, city: '北京',country: '中国');
    print("新的一个student:$stu2");

    StudyFlutter  studyFlutter = StudyFlutter();
    studyFlutter.study();//调用抽象方法

    UseMixin usemixin = UseMixin();
    usemixin.doPrint("阿花发件方哈时间的话卡视角电话卡极速对决哈卡手机号");
  }

}


///{}规定的参数可以选传，通过key:value的形式
printPerson1(String name, {int age=30, String gender="FEMALE"}) {
  print("-1----printPerson1：name=$name,age=$age,gender=$gender");
}

///[]规定的可选参数必须按顺序传参
printPerson2(String name, [int age=18, String gender="MALE"]) {
  print("-2----printPerson2：name=$name,age=$age,gender=$gender");
}

