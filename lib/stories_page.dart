import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'global_var.dart';
import 'stories.dart';

class StoriesPage extends StatefulWidget {
  final int text;

  const StoriesPage({Key key, this.text}) : super(key: key);

  @override
  _StoriesPageState createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  var prevIndex;
  PageController controller;

  @override
  Widget build(BuildContext context) {
    prevIndex ??= widget.text;

    return Container(
      color: Colors.white,
      child: GestureDetector(
        //onTap: onTap,
        onTapDown: onTapDown,
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Hero(
              tag: '${widget.text}',
              child: PageView(
                controller: controller,
                children: storiesList1,
                onPageChanged: onPageChanged,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 7),
              child: Row(
                children: statusList,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    setColor(Color(0xFFcbd6c6), prevIndex);
    controller.dispose();
    super.deactivate();
  }

  @override
  void initState() {
    controller = PageController(initialPage: widget.text);
    SystemChrome.setEnabledSystemUIOverlays([]);
    setColor(Color(0xFF07a626), widget.text);
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      print(prevIndex);
      setColor(Color(0xFFcbd6c6), prevIndex);
      setColor(Color(0xFF07a626), index);
      prevIndex = index;
      print(index);
    });
  }

  void onPressed() {}

  void onTapDown(TapDownDetails details) {
    if ((MediaQuery.of(context).size.width / 2) < details.globalPosition.dx) {
      setState(() {
        controller.nextPage(
            duration: Duration(milliseconds: 400),
            curve: Curves.linearToEaseOut);
      });
    } else {
      setState(() {
        controller.previousPage(
            duration: Duration(milliseconds: 400),
            curve: Curves.linearToEaseOut);
      });
    }
  }

  void setColor(Color color0, int index) {
    statusList[index] = Status(color: color0);
  }
}
