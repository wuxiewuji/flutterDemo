# 路由学习 ---Route<T>

* MaterialPageRoute:
       <p> Android:上下进入退出页面  </p>
       <p> ios    :左右进入退出页面 </p>

* PopupRoute<T>--Dialog一般用于弹出框形式的布局使用




## Navigator

1、 跳转到新页面 必须要将路由Map集合先添加到路由集合表中
    
    Navigator.of(context).pushNamed(routeName)

2、 调转到新路由
    
    Navigator.of(context).push(route)

3、 点击返回的物理按钮 回调的返回值

        Navigator.of(context).maybePop(result)
 
4、 退出当前路由返回上一个页面：

        Navigator.of(context).pop(result) ==true 弹出成功

5、 重复调用直到成功为止
       
       Navigator.popUntil(context, ModalRoute.withName('/login'));
       
6、当前路由是否能被退出（弹出）

        Navigator.canPop(context);-->初始路由不能被弹出(第一个路由)
        
7、退出当前路由并且进入新路由
        
        Navigator.popAndPushNamed(context, '/nyc/1776',result);
        
8、替换当前路由当当前路由退出的时候使用替换的新路由

        Navigator.of(context).pushReplacementNamed('/jouett/1781'，{result});
  
9、替换当前路由当当前路由，然后处理当前路由
       
        Navigator.of(context).pushReplacement(route, result: result);
        
10、立即移除路由和路线然后处理它
        
        Navigator.of(context).removeRoute(route);
        
        
碰到的问题:
        如何抓取点击返回按钮时候的操作

