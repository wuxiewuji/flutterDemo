//联系人获取的Presenter类


import 'package:flutterDemo/demo/mvp/contact_data.dart';
import 'package:flutterDemo/demo/mvp/contact_data_impl.dart';
import 'package:flutterDemo/demo/mvp/contract.dart';

//p
class ContactPresenter extends Presenter {
  final View view;
  //获取创建好的模拟数据实体类
  MockContactRepository mockContact;

  ContactPresenter(this.view){
    view.setPresenter(this);
  }

  //初始化获取数据类
  @override
  init() {
    mockContact = new MockContactRepository();
  }
  //获取数据
  @override
  loadContacts() {
    if (mockContact != null) {
       mockContact.fetch().then((List<Contact> lists) {
        view.onLoadContactsComplete(lists);
      }, onError: () {
        view.onLoadContactsError();
      });
    }
  }
}