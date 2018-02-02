#国际化讲解


1. 在 pubspec.yaml 中添加如下依赖
    Here is an example of AppleScript:

    <p>flutter_localizations:</p>
      <p>  sdk: flutter </p> 
        
2. 运行 <p> flutter packages get</p> 

3.当上面两部完成后在 main.dart 中 import 如下：
<p>import 'package:flutter_localizations/flutter_localizations.dart';</p>

4.然后在 MaterialApp 的构造方法中给 localizationsDelegates 和 supportedLocales 两个可选参数赋值：

  return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      //此处
      localizationsDelegates: [ 
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      //此处
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
    
[详情参考](http://flutter-dev.com/bbs/topic/52/flutter-%E4%B8%AD%E7%9A%84%E5%9B%BD%E9%99%85%E5%8C%96)