import 'package:flutter/material.dart';

/// 用户头像组件
class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("916746049@qq.com",textAlign: TextAlign.right,style: TextStyle(color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/touxiang.jpg"),
            ),
            accountName: Text("秦川剑客",textAlign: TextAlign.right,style: TextStyle(color: Colors.black),),
            decoration: BoxDecoration(
              color: Colors.cyanAccent,
              image: DecorationImage(
                  image: AssetImage("assets/images/cebianbeijing.jpg"),
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
              "消息",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black,fontSize: 14),
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.black,
              size: 25.0,
            ),
//                  leading: Icon(Icons.message,color: Colors.orange,size: 22.0,),
            onTap: () {

            },
          ),
          ListTile(
            title: Text(
              "收藏",
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
              "设置",
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
