import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/controller/router/router_util.dart';

Widget WorkItemWidget(BuildContext context,String pageName,String pageTitle){

  return GestureDetector(
    onTap: (){
      RouterUtil.navigateTo(context,pageName);
    },
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      height: 30,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: Text(pageTitle),
    ),
  );

}