import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storiesrshb/GlobalVar.dart';

// Ты написал функцию, которая возвращает виджет, но не виджет, это уместно делать внутри виджетов, для упрощения кода верстки, но создавать отдельные функции для отдачи виджета - не стоит
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

// Тоже самое, только ты тут решил написать название с большой буквы - это неправильно!
// Классы - PascalCase
// Функции - camelCase
// Переменные, методы, геттеры, сеттеры - camelCase
// Константы - camelCase / SNAKE_CASE (капсом)
// Файлы - snake_case
Widget Status(Color color) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
      child: Container(
        height: 5,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2)), color: color),
      ),
    ),
  );
}

// -_-
class stories {
  String _imageUrl;
  String _title;
  String _text;
  // Зачем тебе тут эти переменные, если ты их не используешь??
  int _colorLeft;
  // ??
  int _colorRight;
  List<Color> _gradient;
  String _buttonUrl;
  String _buttonText;

  stories(String imageUrl, String buttonUrl, String buttonText, String title, String text, int colorLeft, int colorRight) {
    _imageUrl = imageUrl;
    _buttonUrl = buttonUrl;
    _buttonText = buttonText;
    _title = title;
    _text = text;
    _colorLeft = colorLeft;
    _colorRight = colorRight;
    _gradient = [Color(_colorLeft), Color(_colorRight)];
  }

  // У тебя должен быть виджет, который принимает в себя данные и отображает их
  // А ты сделал data-класс, который умеет отображать себя в виде виджетов - переделай
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
      // Если у тебя выше по коду есть if, который ВОЗВРАЩАЕТ что-то, то код после этого if не исполнится никогда, покуда if истинный
      // Проще говоря тут else не нужен
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

  // -_-
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

  // -_-
  Widget _imageWidget() {
    if (_imageUrl != null) {
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(45, 80, 30, 56),
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

  // -_-
  Widget _titleWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(45, 80, 45, 5),
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

  // -_-
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

  // -_-
  Widget _buttonWidget() {
    if (_buttonUrl != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 60),
        child: SizedBox(
          height: 74.0,
          width: 500,
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500.0)),
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
      // Это вообще */$@%$^!$#
      // Во первых если вместо виджета в дереве окажется null - будет ошибка, а во вторых else не нужен - перепеши логику, при которой твой _buttonWidget должен или не должен отображаться
    } else {
      return null;
    }
  }
}
