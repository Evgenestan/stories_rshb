import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Close extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void closeStories() {
      print('pressed');
      Navigator.pop(context);
    }

    return Material(
      color: Colors.transparent,
      child: Container(
        height: 30,
        width: 30,
        child: FittedBox(
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: closeStories,
          ),
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

class StoriesView extends StatelessWidget {
  final Stories stories;

  const StoriesView({Key key, this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget() {
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
                image: NetworkImage(stories.imageUrl),
              ),
            ),
          ),
        ),
      );
    }

    Widget titleWidget() {
      return Padding(
        padding: EdgeInsets.fromLTRB(45, 80, 45, 5),
        child: Container(
          width: 450,
          child: Text(
            '${stories.title}',
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

    Widget textWidget() {
      return Padding(
        padding: EdgeInsets.fromLTRB(45, 53, 45, 94),
        child: Container(
          width: 450,
          child: Text(
            '${stories.text}',
            textScaleFactor: 2,
            style: TextStyle(
              color: Color(0xFF9eb19d),
            ),
          ),
        ),
      );
    }

    Widget buttonWidget() {
      return FittedBox(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 60),
          child: SizedBox(
            height: 74.0,
            width: 500,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(500.0)),
              color: Colors.green,
              child: Text(
                stories.buttonText,
                style: TextStyle(
                  color: Colors.white,
                ),
                textScaleFactor: 1.5,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      );
    }

    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: stories.gradient, stops: [0, 1]),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: FittedBox(
                alignment: Alignment(0, -1),
                child: Column(
                  children: <Widget>[
                    if (stories.imageUrl != null) imageWidget(),
                    titleWidget(),
                    textWidget(),
                  ],
                ),
              )),
              if (stories.buttonUrl != null) buttonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {}
}
