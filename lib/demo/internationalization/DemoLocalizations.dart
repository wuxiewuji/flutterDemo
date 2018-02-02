import 'package:flutter/material.dart';

//自定义语言适配文件
class DemoLocalizations {

  final Locale locale;

  DemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'internal title': 'internal language Demo',
      'task title': 'Flutter Demo',
      'titlebar title': 'Flutter Demo Home Page',
      'click tip': 'You have pushed the button this many times:',
      'inc': 'Increment'
    },
    'zh': {
      'internal title': '国际化语言演示 示例',
      'task title': 'Flutter 示例',
      'titlebar title': 'Flutter 示例主页面',
      'click tip': '你一共点击了这么多次按钮：',
      'inc': '增加'
    }
  };

  get internalTitle {
    return _localizedValues[locale.languageCode]['internal title'];
  }

  get taskTitle {
    return _localizedValues[locale.languageCode]['task title'];
  }

  get titleBarTitle {
    return _localizedValues[locale.languageCode]['titlebar title'];
  }

  get clickTop {
    return _localizedValues[locale.languageCode]['click tip'];
  }

  get inc {
    return _localizedValues[locale.languageCode]['inc'];
  }

  //此处
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }
}