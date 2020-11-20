import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ZeroHtmlWidget extends StatefulWidget {
  final String param;
  ZeroHtmlWidget(this.param);
  @override
  _ZeroHtmlWidgetState createState() => _ZeroHtmlWidgetState();
}

/// 加载网络的
class _ZeroHtmlWidgetState extends State<ZeroHtmlWidget> {
  WebViewController _controller;
  String _title = 'webview';
  @override
  Widget build(BuildContext context) {
    var url = widget.param;
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: url,
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onPageFinished: (url) {
            _controller.evaluateJavascript('document.title').then((result) {
              setState(() {
                _title = result;
              });
            });
          },
          navigationDelegate: (NavigationRequest request) {
            print('request.url = ${request.url}');

            if (request.url.startsWith('myapp://')) {
              print('即将打开 ${request.url}');

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          javascriptChannels: <JavascriptChannel>{
            JavascriptChannel(
                name: 'share',
                onMessageReceived: (JavascriptMessage message) {
                  print('参数： ${message.message}');
                }),
          },
        ),
      ),
    );
  }
}
