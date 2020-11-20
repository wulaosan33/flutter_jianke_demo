import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/controller/event/global_const.dart';
import 'package:untitled/controller/event/login_success_event.dart';
import 'package:untitled/controller/event/update_user_info_event.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    EVENT_BUS.on<UpdateUserInfoEvent>().listen((event) {
      print('UpdateUserInfoEvent =监听== ' + event.name);
//      EVENT_BUS.destroy();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventPage'),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FlatButton(
                        child: Text("发送事件1"),
                        onPressed: () {
                          print(EVENT_BUS);

                          EVENT_BUS.fire(UpdateUserInfoEvent(name: "jim"));
                        },
                      ),
                      FlatButton(
                        child: Text("发送事件2"),
                        onPressed: () {
                          EVENT_BUS.fire(LoginSuccessEvent(name: "tom"));
                        },
                      ),
                      FlatButton(
                        child: Text("监听事件2"),
                        onPressed: () {
                          EVENT_BUS.on<LoginSuccessEvent>().listen((event) {
                            print("LoginSuccessEvent =监听= " + event.name);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
