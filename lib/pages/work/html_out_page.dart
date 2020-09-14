
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/push.dart';
import 'package:untitled/widgets/zero_html_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlOutPage extends StatefulWidget {
  @override
  _HtmlOutPageState createState() => _HtmlOutPageState();
}

class _HtmlOutPageState extends State<HtmlOutPage> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("外接html"),
     ),
     body:ListView(
       children: [
         GestureDetector(
           onTap: (){
             push(context: context,widget: ZeroHtmlWidget('https://www.biquge.com/'));
           },
             child:Container(
               margin: EdgeInsets.all(20),
               height: 40,
               width: 20,
               color: Colors.red,
             )
         ),
         GestureDetector(
             onTap: (){
               push(context: context,widget: ZeroHtmlWidget('https://www.toutiao.com/'));
             },
             child:Container(
               margin: EdgeInsets.all(20),
               height: 40,
               width: 20,
               color: Colors.red,
             )
         ),
         GestureDetector(
             onTap: (){
               push(context: context,widget: ZeroHtmlWidget('https://www.zhihu.com/'));
             },
             child:Container(
               margin: EdgeInsets.all(20),
               height: 40,
               width: 20,
               color: Colors.red,
             )
         ),
         GestureDetector(
             onTap: (){
               push(context: context,widget: ZeroHtmlWidget('https://www.jianshu.com/'));
             },
             child:Container(
               margin: EdgeInsets.all(20),
               height: 40,
               width: 20,
               color: Colors.red,
             )
         ),
         GestureDetector(
             onTap: (){
               push(context: context,widget: ZeroHtmlWidget('https://www.huxiu.com/'));
             },
             child:Container(
               margin: EdgeInsets.all(20),
               height: 40,
               width: 20,
               color: Colors.red,
             )
         ),
       ],
     )
   );
  }



}

