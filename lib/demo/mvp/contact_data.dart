import 'dart:async';


//通讯录实体
class Contact {
  final String fullName;

  final String email;

  const Contact({this.fullName,this.email});
}
//实体类获取接口
abstract class ContactRepoistory{
  // ['fjuːtʃə] 表示延迟对象--获取通讯录列表
  Future<List<Contact>> fetch();
}

