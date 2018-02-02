import 'dart:async';
import 'contact_data.dart';

//测试的时候提供测试数据
class MockContactRepository implements ContactRepoistory{

  //等待获取通讯录数
  @override
  Future<List<Contact>> fetch() async{
    return new Future.value(kContacts);
  }
}
//模拟实体类
const kContacts = const<Contact>[
  const Contact(fullName: "Li bai",email: "libai@live.com"),
  const Contact(fullName: "Cheng yaojin",email: "chengyaojin@live.com"),
  const Contact(fullName: "Mi yue",email: "miyue@live.com"),
  const Contact(fullName: "A ke",email: "ake@live.com"),
  const Contact(fullName: "Lu ban",email: "luban@live.com"),
  const Contact(fullName: "Da qiao",email: "daqiao@live.com"),
  const Contact(fullName: "Hou yi",email: "houyi@live.com"),
  const Contact(fullName: "Liu bei",email: "liubei@live.com"),
  const Contact(fullName: "Wang zhaojun",email: "wangzhaoju@live.com"),
];