import 'package:flutter_learning_demo/demo/studywidget/mvp/contact_data.dart';
import 'package:flutter_learning_demo/demo/studywidget/mvp/mvp_base.dart';


//为通讯录功能编写约束，约束的内容为 IView 和 IPresenter

abstract class Presenter implements IPresenter{
  //加载数据
  loadContacts();
}

abstract class View implements IView<Presenter>{
  //数据加载完成的拿到数据的回调
  void onLoadContactsComplete(List<Contact> items);
  //获取数据失败的回调
  void onLoadContactsError();
}