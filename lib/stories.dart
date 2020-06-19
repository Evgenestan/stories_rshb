import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storiesrshb/GlobalVar.dart';

Widget closeIcon() {
  return Container(
    height: 30,
    width: 30,
    child: FittedBox(
      child: IconButton(
        icon: Icon(Icons.close),
        onPressed: closeStories,
      ),
    ),
  );
}

void closeStories() {
  print('pressed');
  navigatorKey.currentState.pop();
}

Widget Status(Color color) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
      child: Container(
        height: 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2)), color: color),
      ),
    ),
  );
}


class stories {
  String _imageUrl;
  String _title;
  String _text;
  int _colorLeft;
  int _colorRight;
  List<Color> _gradient;
  String _buttonUrl;
  String _buttonText;

  stories(String imageUrl, String buttonUrl, String buttonText, String title,
      String text, int colorLeft, int colorRight) {
    _imageUrl = imageUrl;
    _buttonUrl = buttonUrl;
    _buttonText = buttonText;
    _title = title;
    _text = text;
    _colorLeft = colorLeft;
    _colorRight = colorRight;
    _gradient = [Color(_colorLeft), Color(_colorRight)];
  }

  Widget Icon() {
    if (_imageUrl == null) {
      return Material(
        type: MaterialType.transparency,
        child: FittedBox(
          child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: _gradient, stops: [0, 1]),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                //color: Colors.black,
                child: FittedBox(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '$_title',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      );
    } else {
      return Material(
        type: MaterialType.transparency,
        child: FittedBox(
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(_imageUrl),
              ),
            ),
          ),
        ),
      );
    }
  }

  void onPressed() {
    print('Pressed');
  }

  Widget Show() {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: _gradient, stops: [0, 1]),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 45, 20, 7),
                child: Row(
                  children: statusList,
                ),
              ),
              Expanded(
                  child: FittedBox(
                alignment: Alignment(0, -1),
                child: Column(
                  //fit: StackFit.loose,
                  children: <Widget>[
                    _imageWidget(),
                    _titleWidget(),
                    _textWidget(),
                  ],
                ),
              )),
              FittedBox(
                child: _buttonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonWidget() {
    if (_buttonUrl != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 60),
        child: SizedBox(
          height: 74.0,
          width: 500,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500.0)),
            color: Colors.green,
            child: Text(
              _buttonText,
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.5,
            ),
            onPressed: onPressed,
          ),
        ),
      );
    } else {
      return null;
    }
  }

  Widget _imageWidget() {
    if (_imageUrl != null) {
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(45, 88, 30, 45),
          child: Container(
            width: 450.0,
            height: 450.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(_imageUrl),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 1,
        height: 1,
      );
    }
  }

  Widget _textWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(45, 53, 45, 94),
      child: Container(
        width: 450,
        child: Text(
          '$_text',
          textScaleFactor: 2,
          style: TextStyle(
            color: Color(0xFF9eb19d),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(45, 136, 45, 5),
      child: Container(
        width: 450,
        child: Text(
          '$_title',
          textScaleFactor: 3,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
