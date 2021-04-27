/// 泛型在函数中的使用

import 'opp_learn.dart';

class TestGeneric {

  void start(){
    Cache<String> cache1 = Cache();
    cache1.setItem('key1', "value1");
    // cache1.setItem('key1', 123);因为上面指定了泛型String , 所以value不能是int类型

    ///  获取一下内容
    cache1.getItem("key1");


    Member<Student> member = Member(Student("?","name啊",16));
    print(member.fixedName());
  }

}


// 泛型：
// 通俗理解：泛型主要是解决类、接口、方法的复用性、以及对不特定数据类型的支持
// 泛型作用：类型检查约束类比：List<String>

class Cache<T>{
  static final Map<String, Object> _cache = Map();

  void setItem (String key, T value){
      _cache[key] = value;
  }


  T getItem(String key){
    return _cache[key];
  }
}


/// 有时候你再实现类似通用接口的泛型中，期望的类型是某些特定类型时， 这是可以使用类型约束
class Member <T extends Person>{
  T _person;
  //泛型作用： 约束参数类型
  Member(this._person);

  String fixedName(){
    return 'fixed:${_person.name}';
  }
}