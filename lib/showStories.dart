import 'package:flutter/material.dart';

import 'GlobalVar.dart';
import 'stories.dart';

// Название класса - с большой буквы, в стиле PascalCase
// StoriesPage
// Название этого файла в snack_case
// stories_page.dart
class storiesPage extends StatefulWidget {
  final int text;

  const storiesPage({Key key, this.text}) : super(key: key);

  @override
  _storiesPageState createState() => _storiesPageState();
}

class _storiesPageState extends State<storiesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: '${widget.text}',
          // -_-
          child: storiesList[widget.text].Show(),
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

  void onTap() {}

  void setColor(Color color) {
    statusList[widget.text] = Status(color);
  }
}
