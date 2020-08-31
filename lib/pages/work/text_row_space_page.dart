import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextRowSpacePage extends StatelessWidget {

  final double leading = 2;

  final double fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("行间距")
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: new Text(
                "偏移前:"
                    "从小丘西行百二十步，隔篁竹，闻水声，如鸣珮环，心乐之。伐竹取道，下见小潭，水尤清冽。全石以为底，"
                    "近岸，卷石底以出，为坻，为屿，为嵁，为岩。青树翠蔓，蒙络摇缀，参差披拂。"
                    "潭中鱼可百许头，皆若空游无所依，日光下澈，影布石上。佁然不动，俶尔远逝，往来翕忽，似与游者相乐。"
                    "潭西南而望，斗折蛇行，明灭可见。其岸势犬牙差互，不可知其源。"
                    "坐潭上，四面竹树环合，寂寥无人，凄神寒骨，悄怆幽邃。以其境过清，不可久居，乃记之而去"
                    "同游者：吴武陵，龚古，余弟宗玄。隶而从者，崔氏二小生：曰恕己，曰奉壹。",
                style: TextStyle(fontSize: fontSize,color: Colors.blue),
              ),
            ),
            Container(
              height: 30,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.all(10),
              ///利用transfrom 偏移将对应部分位置
              child: Transform.translate(
                offset: Offset(0,-fontSize * leading / 2),
                child: new Text(
                  "偏移后:"
                      "从小丘西行百二十步，隔篁竹，闻水声，如鸣珮环，心乐之。伐竹取道，下见小潭，水尤清冽。全石以为底，"
                      "近岸，卷石底以出，为坻，为屿，为嵁，为岩。青树翠蔓，蒙络摇缀，参差披拂。"
                      "潭中鱼可百许头，皆若空游无所依，日光下澈，影布石上。佁然不动，俶尔远逝，往来翕忽，似与游者相乐。"
                      "潭西南而望，斗折蛇行，明灭可见。其岸势犬牙差互，不可知其源。"
                      "坐潭上，四面竹树环合，寂寥无人，凄神寒骨，悄怆幽邃。以其境过清，不可久居，乃记之而去"
                      "同游者：吴武陵，龚古，余弟宗玄。隶而从者，崔氏二小生：曰恕己，曰奉壹。",
                  strutStyle: StrutStyle(forceStrutHeight: true,height: 1,leading: leading),
                  style: TextStyle(fontSize: fontSize,color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
    );
  }
}