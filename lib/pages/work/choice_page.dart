
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';


class ChoicePage extends StatefulWidget {
  @override
  _ChoicePageState createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {

  bool _checkbox_value = false;
  var _checkboxListTile_value = false;
  int _Radio_value = 0;
  var _RadioListTile_value = 0;
  var _Switch_value = false;
  var _Switch_value_lite = false;
  double _Slider_value = 0.0;

  DateTime selectDateTime = DateTime.now();
  TimeOfDay selectTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text('比例视图'),
              Container(
                color: Colors.red,
                height: 50.0,
                child: AspectRatio(
                  aspectRatio: 3, //横纵比 长宽比
                  child: SizedBox(
                    width: 10,
                    height: 10,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              blankBox(),
              Checkbox(
              //tristate: true,
                  value: _checkbox_value,
                  activeColor: Colors.red,
                  checkColor: Colors.orange,
                  focusColor: Colors.red,
                  hoverColor: Colors.red,
                  onChanged: (value) {
                    _checkbox_value = value;
                    setState(() {});
                  }),
              blankBox(),
              CheckboxListTile(
                title: Text("A"),
                subtitle: Text("a-subtitle"),
                secondary: Icon(Icons.home),
                activeColor: Colors.purple,
                checkColor: Colors.purple,
                selected: _checkboxListTile_value,
                value: _checkboxListTile_value,
                onChanged: (value) {
                  setState(() {
                    _checkboxListTile_value = value;
                  });
                },
              ),
              blankBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("单选"),
                  /// 单选
                  Radio(
                    value: 0,
                    groupValue: _Radio_value,
                    activeColor: Colors.red,
                    onChanged: (int value) {
                      setState(() {
                        _Radio_value = value;
                      });
                    },
                  ),

                  Radio(
                    value: 1,
                    groupValue: _Radio_value,
                    activeColor: Colors.red,
                    onChanged: (int value) {
                      setState(() {
                        _Radio_value = value;
                      });
                    },
                  ),
                ],
              ),
              blankBox(),
              Column(
                children: <Widget>[
                  /// 单选
                  RadioListTile(
                    title: Text("男"),
                    subtitle: Text("男-sub"),
                    selected: _RadioListTile_value == 0,
                    secondary: Icon(Icons.filter_1),
                    value: 0,
                    groupValue: _RadioListTile_value,
                    activeColor: Colors.red,
                    onChanged: (int value) {
                      setState(() {
                        _RadioListTile_value = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("女"),
                    subtitle: Text("女-sub"),
                    secondary: Icon(Icons.filter_2),
                    selected: _RadioListTile_value == 1,
                    value: 1,
                    groupValue: _RadioListTile_value,
                    activeColor: Colors.red,
                    onChanged: (int value) {
                      setState(() {
                        _RadioListTile_value = value;
                      });
                    },
                  ),
                ],
              ),
              blankBox(),
              Switch(
                value: _Switch_value,
                onChanged: (value) {
                  setState(() {
                    _Switch_value = value;
                  });
                  debugPrint(value.toString());
                },
              ),
              blankBox(),
              SwitchListTile(
                title: Text("SwitchListTile"),
                subtitle: Text("SwitchListTile-sub"),
                secondary: Icon(Icons.remove_red_eye),
                selected: _Switch_value_lite,
                value: _Switch_value_lite,
                onChanged: (value) {
                  setState(() {
                    _Switch_value_lite = value;
                  });
                  debugPrint(value.toString());
                },
              ),
              blankBox(),
              Slider(
                value: _Slider_value,
                activeColor: Colors.red,
                inactiveColor: Colors.grey,
                min: 0.0,
                max: 10.0,
                divisions: 10,
                ///  divisions 才能有值
                label: _Slider_value.toString(),
                onChanged: (value) {
                  setState(() {
                    _Slider_value = value;
                  });
                  debugPrint(value.toString());
                },
              ),
              blankBox(),
              FlatButton(
                child: Text("日期选择"),
                onPressed: () {
                  _selectDateFunc();
                },
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
              ),
              Text(
//              DateFormat.yMMMd().format(selectDateTime),
//              DateFormat("yyyy-MM-dd").format(selectDateTime),
                formatDate(selectDateTime, [yyyy, '-', mm, '-', dd]),
//           DateTime.fromMillisecondsSinceEpoch(selectDateTime.millisecondsSinceEpoch).toString(),
              ),
              FlatButton(
                child: Text("时间选择"),
                onPressed: () {
                  _selectTimeFunc();
                },
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
              ),
              Text(
                selectTime.format(context),
//           DateTime.fromMillisecondsSinceEpoch(selectDateTime.millisecondsSinceEpoch).toString(),
              ),
              Text(
                formatTimeOfDayalUse24Hour(selectTime, context),
//           DateTime.fromMillisecondsSinceEpoch(selectDateTime.millisecondsSinceEpoch).toString(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget blankBox(){
    return Container(
      height: 20,
    );
  }

  _selectDateFunc() async {
    DateTime dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: selectDateTime,
      lastDate: DateTime(2100),
    );
    if (dateTime == null) {
      return;
    }
//    MaterialLocalizations localizations = MaterialLocalizations.of(context);
//    String formattedTime = localizations.formatFullDate(dateTime);
//    print("formattedTime");
//    print("formattedTime = $formattedTime");
    setState(() {
      selectDateTime = dateTime;
    });
  }

  _selectTimeFunc() async {
    TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );
    if (timeOfDay == null) {
      return;
    }

    setState(() {
      debugPrint("timeOfDay = $timeOfDay");
      selectTime = timeOfDay;
    });
  }

  static String formatTimeOfDayalUse24Hour(TimeOfDay timeOfDay, context) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    String formattedTime =
    localizations.formatTimeOfDay(timeOfDay, alwaysUse24HourFormat: true);
    return formattedTime;
  }
}