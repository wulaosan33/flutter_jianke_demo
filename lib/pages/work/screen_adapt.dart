
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utils/screen_adapter_util.dart';


class ScreenAdaptPage extends StatefulWidget {
  @override
  _ScreenAdaptPageState createState() => _ScreenAdaptPageState();
}

class _ScreenAdaptPageState extends State<ScreenAdaptPage> {

  @override
  Widget build(BuildContext context) {
    ScreenAdapterUtil.init(context);
    return Container(
              color: Colors.white,
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              child:Column(
                children: [
                  Container(
                    width: 301 ,
                    height: 276,
                    child:Image.asset(
                      "assets/images/pinkPic.jpg",
                      fit: BoxFit.fill,
                    ),
                    margin: EdgeInsets.only(left:(ScreenUtil().screenWidth-301) * 0.1 ,
                        top:(ScreenUtil().screenHeight - 384) * 0.45),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:(ScreenUtil().screenHeight - 384) * 0.45),
                    width: 60 ,
                    height: 72,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage(
                          "assets/images/headIcon.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                    ),
                  ),
                  Container(
                    width: 198 ,
                    height: 36,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage(
                          'assets/images/Icon_Mac.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              )
          );
  }
}