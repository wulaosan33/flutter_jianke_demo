import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AsyncPage extends StatefulWidget {
  @override
  _AsyncPageState createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AsyncPage'),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
