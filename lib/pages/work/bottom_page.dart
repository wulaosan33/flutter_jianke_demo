import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/utils/pic_config.dart';

class BottomPage extends StatefulWidget {
  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  bool isOffstage = false;
  bool isVisibility = false;
  bool _isShow = true;
  String dateChoice = 'flutter日期选择';
  StreamController<bool> _streamController = new StreamController<bool>();
  ValueNotifier<bool> isAbsorbPointer = ValueNotifier(true);

  @override
  void dispose() {
    super.dispose();
    _streamController?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮页面"),
      ),
      body: ListView(
        children: [
          FlatButton(
            child: Text('控制底部bar'),
            splashColor: Colors.red,
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () async {
              _isShow = !_isShow;
              _streamController.sink.add(!_isShow);
            },
          ),
          blankBox(),
          FlatButton(
            color: Colors.red,
            child: Text('showModalBottomSheet 圆角'),
            onPressed: () {
              //底边的容器装饰
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                        margin: EdgeInsets.only(left: 30),
                        height: 100, //对话框高度就是此高度
                        child: ListView(
                          children: List.generate(20, (index) {
                            return Text('title - $index');
                          }).toList(),
                        ));
                  });
            },
          ),
          blankBox(),
          Image.asset(
            assetsOfImagePath('A171.jpg'),
            fit: BoxFit.fill,
          ),
          blankBox(),
          Column(
            children: [
              Text('Expanded 等比分布,撑满剩余空间'),

              ///expand
              Row(
                children: <Widget>[
                  Text('头'),
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Text(
                        'aa',
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Text('尾部'),
                  //Text('尾部'),
                ],
              ),

              ///expand---1:1:1等分
              Row(children: <Widget>[
                Container(
                  width: 20,
                  height: 100,
                  color: Colors.orange,
                ),
                new Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      print('===========');
                    },
                    child: Container(
                      child: new Text('Text1', textAlign: TextAlign.center),
                      height: 100,
                      alignment: AlignmentDirectional.center,
                      color: Colors.grey,
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Container(
                    child: new Text('Text2', textAlign: TextAlign.center),
                    height: 100,
                    alignment: AlignmentDirectional.center,
                    color: Colors.blue,
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Container(
                    child: new Text('Text3', textAlign: TextAlign.center),
                    height: 100,
                    alignment: AlignmentDirectional.center,
                    color: Colors.cyan,
                  ),
                ),
              ]),

              ///expand为string,过长会截取.
              Row(
                children: <Widget>[
                  Text('头'),
                  Expanded(
                    child: Text(
                      //'A=============================================================A',
                      'A==============================A',
                      maxLines: 1,
                    ),
                  ),
                  Text('尾部'),
                ],
              ),
            ],
          ),
          blankBox(),
          Column(
            children: [
              FlatButton(
                child: Text('显示隐藏-Visibility'),
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
              ),
              FlatButton(
                child: Text('显示隐藏-Offstage'),
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    isOffstage = !isOffstage;
                  });
                },
              ),
              Visibility(
                visible: isVisibility,
                child: Container(
                  color: Colors.indigo,
                  height: 50,
                ),
              ),
              Offstage(
                offstage: isOffstage,
                child: Container(
                  color: Colors.blue,
                  height: 50,
                ),
              ),
            ],
          ),
          blankBox(),
          CupertinoButton(
            color: Colors.orange,
            child: Text('ios DatePicker'),
            onPressed: () {
              _showCupertinoDatePicker(context);
            },
          ),
          blankBox(),
          FlatButton(
            child: Text(dateChoice),
            onPressed: () {
              _selectDateFunc().then((value) => dateChoice =
                  value != null ? value.toString() : 'flutter日期选择');
              setState(() {});
            },
            splashColor: Colors.red,
            color: Colors.green,
            textColor: Colors.white,
          ),
          blankBox(),
          CupertinoButton(
            color: Colors.orange,
            child: Text('ios TimerPicker'),
            onPressed: () {
              _showCupertinoTimerPicker(context);
            },
          ),
          blankBox(),
          Column(
            children: [
              Text('iOS文本框'),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: CupertinoTextField(
                  placeholder: '请输入姓名',
                  prefix: Text(' 姓名 '),
                  suffix: Text(' 结尾 '),
                  //keyboardType: TextInputType.numberWithOptions(decimal: true),
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          blankBox(),
          Column(
            children: [
              Text('flutter文本框'),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          /// 输入的文字
                          onChanged: (value) {},

                          ///输入完成后指向
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          maxLength: 11,

                          ///键盘类型
                          keyboardType: TextInputType.number,

                          /// 右下角 键盘类型
                          textInputAction: TextInputAction.send,
                          onSubmitted: (value) {
                            print('提交手机号' + value);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly, //只输入数字
                            //  PhoneTextInputFormatter.digitsOnly,
                          ],

                          ///输入文本的样式
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            /// 头部的图标
                            icon: Icon(
                              Icons.phone,
                            ),
                            hintText: '请输入手机号',
                            labelText: '手机号',
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.red,
                            ),

                            ///输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                            contentPadding: EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                                //  borderRadius: BorderRadius.circular(15),
                                //  borderSide: BorderSide.none,
                                ),

                            /// right 小组件
                            //suffixIcon:
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text(
                        '获取验证码',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      textColor: Colors.black,
                      disabledTextColor: Colors.grey,
                      onPressed: () {
                        ///
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
          blankBox(),
          DropdownButton(
            hint: new Text('下拉选择你想要的数据'),
            items: [
              DropdownMenuItem(
                child: new Text('1'),
                value: '1',
              ),
              DropdownMenuItem(
                child: new Text('2'),
                value: '2',
              ),
            ],
            onChanged: (T) {
              //下拉菜单item点击之后的回调
            },
          ),
          blankBox(),
          Column(
            children: [
              Text('长按预览'),
              Container(
                color: Colors.greenAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CupertinoContextMenu(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 100,
                        child: Image.asset(
                          assetsOfImagePath('headIcon.png'),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      previewBuilder: (context, animation, child) {
                        return Container(
                          color: Colors.greenAccent,
                          child: Image.asset(
                            assetsOfImagePath('A171.jpg'),
                          ),
                        );
                      },
                      actions: <Widget>[
                        CupertinoContextMenuAction(
                          child: const Text('返回'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          blankBox(),
          Column(
            children: [
              FlatButton(
                child: Text('控制AbsorbPointer'),
                onPressed: () {
                  isAbsorbPointer.value = !isAbsorbPointer.value;
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: isAbsorbPointer,
                builder: (BuildContext context, value, Widget child) {
                  return AbsorbPointer(
                    absorbing: value,
                    child: FlatButton(
                      color: Colors.greenAccent,
                      disabledColor: Colors.orange,
                      child: Text('AbsorbPointer'),
                      onPressed: value ? null : () {},
                    ),
                  );
                },
              ),
            ],
          ),
          blankBox(),
          Column(
            children: [
              Text('ButtonBar 可以默认实现一个按钮组，通过 children 属性可以传入多个 Button'),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    child: Text('FlatButton'),
                    onPressed: () {},
                    splashColor: Colors.red,
                    color: Colors.green,
                    textColor: Colors.white,
                  ),

                  /// 描边
                  OutlineButton(
                    child: Text('OutlineButton'),
                    onPressed: () {},

                    /// 点击高亮颜色
                    splashColor: Colors.orange,
                    color: Colors.red,
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),

                  /// 描边
                  OutlineButton.icon(
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    label: Text(
                      'OutlineButton.icon',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},

                    /// 点击高亮颜色
                    color: Colors.red,
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          blankBox(),
          Column(
            children: [
              Text('PopupMenuButton'),
              PopupMenuButton(
                icon: Icon(Icons.add),
                onSelected: (value) {
                  print('value = $value');
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text('1'),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text('2'),
                  ),
                ],
              ),
            ],
          ),
          blankBox(),
          Column(
            children: [
              Text('自动换行的row--Wrap'),
              Wrap(children: <Widget>[for (String item in tags) TagItem(item)]),
            ],
          ),
        ],
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget blankBox() {
    return Container(
      height: 20,
    );
  }

  Widget bottomBar() {
    return StreamBuilder<bool>(
        // 监听Stream，每次值改变的时候，更新Text中的内容
        stream: _streamController.stream,

        /// 第一次监听值
        initialData: _isShow,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          print('snapshot.data = ${snapshot?.data}');
          return BottomAppBar(
            color: Colors.red,

            /// 直接用_isShow 方便控制,比snapshot?.data 不知道为什么
            child: (!_isShow)
                ? null
                : Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,

                      ///交叉轴的布局方式，对于column来说就是水平方向的布局方式
                      crossAxisAlignment: CrossAxisAlignment.end,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            /// 充满 容器
                            alignment: Alignment.center,
                            color: Colors.orange,
                            child: FlatButton(
                              child: Text('底部按钮1'),
                              onPressed: () async {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            /// 充满 容器
                            alignment: Alignment.center,
                            color: Colors.orange,
                            child: FlatButton(
                              onPressed: () {},
                              child: Text('底部按钮2'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

            /// 切形状 自动根据被 重叠部分
            shape: CircularNotchedRectangle(),
          );
        });
  }

  void _showCupertinoDatePicker(BuildContext cxt) async {
    /// 假如中文环境报错,配置GlobalCupertinoLocalizations.delegate,

    final picker = CupertinoDatePicker(
      //初始年
//      initialDateTime: DateTime(1995),
      initialDateTime: DateTime.now(),
      use24hFormat: true,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (date) {
        print('the date is ${date.toString()}');
      },
    );

    showCupertinoModalPopup(
        context: cxt,
        builder: (cxt) {
          return Container(
            color: Colors.white,
            height: 180,
            child: picker,
          );
        });
  }

  Future<DateTime> _selectDateFunc() async {
    DateTime dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime(2100),
      helpText: '选择日期',
      errorFormatText: 'errorFormatText',
      errorInvalidText: 'errorInvalidText',
      fieldHintText: 'fieldHintText',
      fieldLabelText: 'fieldLabelText',
    );
    return dateTime;
  }

  void _showCupertinoTimerPicker(BuildContext cxt) {
    final picker = CupertinoTimerPicker(
      onTimerDurationChanged: (duration) {
        print('the time is $duration');
      },
    );

    showCupertinoModalPopup(
        context: cxt,
        builder: (cxt) {
          return Container(
            color: Colors.white,
            height: 200,
            child: picker,
          );
        });
  }
}

class TagItem extends StatelessWidget {
  final String text;

  TagItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Text(text),
      ),
    );
  }
}

const List<String> tags = [
  '噫吁嚱',
  '危乎高哉',
  '小姐姐好漂亮啊',
  '这个东西是啥',
  '哈哈哈',
  '好困啊',
  '今天好运',
  '明天好运来',
  '今年快结束了',
  '我累啊',
  '你写的什么代码',
  '多多多'
];
