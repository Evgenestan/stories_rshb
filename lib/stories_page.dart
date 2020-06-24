import 'package:flutter/material.dart';

import 'global_var.dart';
import 'stories.dart';

class StoriesPage extends StatefulWidget {
  final int text;

  const StoriesPage({Key key, this.text}) : super(key: key);

  @override
  _StoriesPageState createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  @override
  Widget build(BuildContext context) {
    Widget showStories(Stories stories) {
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

    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: '${widget.text}',
          // -_-
          child: showStories(storiesList[widget.text]),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    setColor(Color(0xFFcbd6c6));
    super.deactivate();
  }

  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    setColor(Color(0xFF07a626));
    super.initState();
  }

  void onPressed() {}

  void onTap() {}

  void setColor(Color color0) {
    statusList[widget.text] = Status(color: color0);
  }
}
