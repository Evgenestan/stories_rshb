import 'package:flutter/material.dart';
import 'package:storiesrshb/getArray.dart';
import 'package:storiesrshb/showStories.dart';
import 'package:storiesrshb/stories.dart';

import 'GlobalVar.dart';

void main() {
  addStories('var1 ');
  addStories('var2 ');
  addStories('var3 ');
  addStories('var4 ');
  addStories('var5 ');

  statusList.add(closeIcon());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            //physics: const NeverScrollableScrollPhysics(),

            itemCount: storiesList.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Hero(
                  tag: '$index',
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: storiesList[index].Icon(),
                  ),
                ),
                onTap: () => showStories(index),
              );
            },
          ),
        ),
      ),
    );
  }

  void showStories(int i) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => storiesPage(text: i)),
    );
  }
}
