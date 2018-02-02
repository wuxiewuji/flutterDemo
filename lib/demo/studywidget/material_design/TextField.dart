import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///文本输入框 --TextField

class TextFieldDemo extends StatefulWidget {
  static const String routeName = '/text_field';

  @override
  _TextFieldDemo createState() => new _TextFieldDemo();
}
class _TextFieldDemo extends State<TextFieldDemo> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchQuery = new TextEditingController();
    _searchQuery.addListener((){});
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('表单输入')
        ),
        // Form：用于将多个表单控件组合在一起的容器
        body: new Form(
            key: _formKey,
            child: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Column(
                  children: <Widget>[
                    // TextFieldd：包含输入的表单控件，每个表单字段都应该在FormField控件中
                    new TextField(
                      controller: _searchQuery,//相关控制,每一个输入框要都不能混用,否则输入的字符串会串在一起
                      autofocus: true, //获取焦点进入这个页面就获取焦点
                        //描述
                      decoration: const InputDecoration(
                        hintText: 'Search stocks',

                      ),
                    ),
                    new Divider(),//分割线
                    new TextField(
                      //控制器
                      controller: _searchQuery,
                      //获取焦点进入这个页面就获取焦点
                      autofocus: true,
                      //创建一个文本输入框的装饰
                      decoration: const InputDecoration(
                        hintText: 'Search stocks',
//                        counterText: '0/10',//这个一般是计数文本,记录自己输入的文字长度.系统已经实现了计数功能可以不用写
//                        counterStyle: ,//计数Text文本字体的样式
//                        errorText: '走错地方了',//错误的提示文本
//                        errorStyle: ,//错误提示文本的样式
//                        helperStyle: ,//帮助文本样式
                        helperText: 'asdsadasdas',//帮助文本
                        hideDivider: false,
//                        hintStyle: ,
                        icon:const Icon(Icons.map) ,//输入框之前的控件
//                        isDense: false,
//                        labelStyle: ,
                        labelText: 'nhao',//提示标签,当没有文字没被选中的时候显示在文本框中,当有文字的时候或者被选中的时候显示在输入框的上面
//                        prefixStyle: ,
                        prefixText: '你好:',//再输入文本后再文本前面显示的文字,eg:你输入1234----实际上是---你好1234,但是这个文字不会被读取出来
//                        suffixStyle: ,
                        suffixText: '哈哈哈哈',//文本输入框的末尾显示的文字,同prefixText差不多
                      ),
                      //开始编译时候的回调
                      onChanged:(String value){
                        print('xxf_onChanged:'+value);
                      },
                      //用户数据完成时候的回调,一般是点回车或者换行的时候使用
                      onSubmitted: (String value){
                        print('xxf_onSubmitted:'+value);
                      },
                        //是否隐藏正在编译的文本
                      obscureText: false,
                        //输入文本的样式,文本? 数字?....
                      keyboardType: TextInputType.text,
                        //焦点,键盘控制的,
//                      focusNode: new FocusNode(),
                      //是否自动校正
                      autocorrect: false,
                        //文本输入文字的位置
                      textAlign: TextAlign.start,
//                      style: ,//文字的样式
                      /**
                       * 格式化程序
                       * 黑名单
                       * 匹配自己写的正则表达式,将输入的复合正则表达的文字进行替换
                       */
                      inputFormatters:<TextInputFormatter>[
                        new BlacklistingTextInputFormatter(
                            new RegExp('123'),replacementString: "11"
                        ),
                        /**
                         * 白名单
                         * 只有符合匹配的文字才能被输入进来
                         */
//                        new WhitelistingTextInputFormatter(
//                            new RegExp('1')
//                        )//白名单
                      ] ,
                      //最大字体长度
                      maxLength: 10,
                      //否限制超过最大限制字体长度,如果限制,当输入到最大长度就输入不进来了
                      maxLengthEnforced: false,
                        //允许输入的最大行数
                      maxLines: 1,
                    ),
                    //与上面的表单类似
                    new TextFormField(
                    ),

                  ]
              ),
            )
        )
    );
  }
}
