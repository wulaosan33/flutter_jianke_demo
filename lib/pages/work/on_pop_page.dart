import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnPopPage extends StatefulWidget {
  @override
  _OnPopPageState createState() => _OnPopPageState();
}

class _OnPopPageState extends State<OnPopPage> {
  Color _selectedColor;
  List<Color> _colors = [Colors.red, Colors.green, Colors.blue];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 2.0'),
      ),
      body: Navigator(
        // you can see and decide on every page in this list
        pages: [
          MaterialPage(
            child: ColorListScreen(
              colors: _colors,
              onTapped: (color) => setState(() => _selectedColor = color),
            ),
          ),
          if (_selectedColor != null)
            MaterialPage(child: ColorScreen(color: _selectedColor)),
        ],
        onPopPage: (route, result) {
          print('result = $result');
          if (!route.didPop(result)) return false;
          setState(() => _selectedColor = result as Color);
          return true;
//        if(result is Color){
//          setState(() => _selectedColor = result);
//          return true;
//        }
//        return false;
        },
      ),
    );
  }
}

class ColorListScreen extends StatelessWidget {
  final List<Color> colors;
  final void Function(Color color) onTapped;
  ColorListScreen({this.colors, this.onTapped});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Colors')),
        body: Column(
          children: [
            // you can see and decide on every color in this list
            for (final color in colors)
              Expanded(
                child: GestureDetector(
                  child: Container(color: color),
                  onTap: () => onTapped(color),
                ),
              )
          ],
        ),
      );
}

class ColorScreen extends StatelessWidget {
  final Color color;
  const ColorScreen({this.color});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Color')),
        body: Container(
            color: color,
            child: FlatButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context, Colors.amber);
              },
            )),
      );
}
