import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Close extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void closeStories() {
      print('pressed');
      Navigator.pop(context);
    }

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
}

class Status extends StatelessWidget {
  final Color color;

  const Status({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

// Тоже самое, только ты тут решил написать название с большой буквы - это неправильно!
// Классы - PascalCase
// Функции - camelCase
// Переменные, методы, геттеры, сеттеры - camelCase
// Константы - camelCase / SNAKE_CASE (капсом)
// Файлы - snake_case

class Stories {
  String imageUrl;
  String title;
  String text;
  List<Color> gradient;
  String buttonUrl;
  String buttonText;

  Stories(String imageUrl0, String buttonUrl0, String buttonText0,
      String title0, String text0, int colorLeft0, int colorRight0) {
    imageUrl = imageUrl0;
    buttonUrl = buttonUrl0;
    buttonText = buttonText0;
    title = title0;
    text = text0;
    colorRight0 ??= 0xFF000000;
    colorLeft0 ??= 0xFF000000;
    gradient = [Color(colorLeft0), Color(colorRight0)];
  }
}
