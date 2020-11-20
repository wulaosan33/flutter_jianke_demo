import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/controller/router/router_util.dart';
import 'package:untitled/pages/home/theme/theme_page.dart';

/// 用户头像组件
class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('916746049@qq.com',textAlign: TextAlign.right,style: TextStyle(color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/touxiang.jpg'),
            ),
            accountName: Text('秦川剑客',textAlign: TextAlign.right,style: TextStyle(color: Colors.black),),
            decoration: BoxDecoration(
              color: Colors.cyanAccent,
              image: DecorationImage(
                  image: AssetImage('assets/images/cebianbeijing.jpg'),
                  /*填充方式*/
                  fit: BoxFit.cover,
                  /*磨砂效果*/
                  colorFilter: ColorFilter.mode(
                    Colors.red[50].withOpacity(0.6),
                    BlendMode.hardLight,
                  )),
            ),
          ),
          ListTile(
            title: Text(
              '消息历史',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black,fontSize: 14),
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.black,
              size: 25.0,
            ),
            onTap: () {

            },
          ),
          ListTile(
            title: Text(
              '个人收藏',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black,fontSize: 14),
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black,
              size: 25.0,
            ),
            onTap: () {

            },
          ),
          ListTile(
            title: Text(
              '主题切换',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black,fontSize: 14),
            ),
            trailing: Icon(
              Icons.settings_input_svideo,
              color: Colors.black,
              size: 25.0,
            ),
            onTap: () {
              RouterUtil.navigateTo(context, THEME_PAGE);
             /* 无路由跳转
              Navigator.of(context, rootNavigator: true)
                  .push(CupertinoPageRoute(builder: (BuildContext context) {
                return ThemePage();
              }));*/
            },
          ),
          ListTile(
            title: Text(
              '基本设置',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black,fontSize: 14),
            ),
            trailing: Icon(
              Icons.settings,
              color: Colors.black,
              size: 25.0,
            ),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
