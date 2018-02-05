import 'package:flutter/material.dart';
import 'package:flutterDemo/demo/mvp/contac_presenter.dart';
import 'package:flutterDemo/demo/mvp/contact_data.dart';
import 'package:flutterDemo/demo/mvp/contract.dart';

//view层
class ContactsPage extends StatelessWidget {
  const ContactsPage({ Key key }) : super(key: key);
  static const String routeName = '/mvp_route';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("MVP 例子书写"),
        ),
        body: new ContactList()
    );
  }
}

class ContactList extends StatefulWidget {
  ContactList({ Key key }) : super(key: key);


  @override
  _ContactListState createState() {
    _ContactListState view = new _ContactListState();
    //创建p,传递View给p层
    ContactPresenter presenter = new ContactPresenter(view);

    presenter.init();
    return view;
  }
}

class _ContactListState extends State<ContactList> implements View {

  List<Contact> contacts = [];

  ContactPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter.loadContacts();
  }

  Widget buildListTile(BuildContext context, Contact contact) {
    return new MergeSemantics(
      child: new ListTile(
        isThreeLine: true,
        dense: false,
        leading: new ExcludeSemantics(child: new CircleAvatar(
            child: new Text(contact.fullName.substring(0, 1)))),
        title: new Text(contact.fullName),
        subtitle: new Text(contact.email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    widget =
    new ListView.builder(padding: new EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (BuildContext context, int index) {
        return buildListTile(context, contacts[index]);
      },
      itemCount: contacts.length,
    );
    return widget;
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {
    setState(() {
      contacts = items;
      print("  contacts size  ${contacts.length}");
    });
  }

  @override
  void onLoadContactsError() {
    print('获取实体类失败咯,哈哈哈');
  }

  @override
  setPresenter(Presenter presenter) {
    _presenter = presenter;
  }
}
