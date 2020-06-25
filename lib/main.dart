import 'package:flutter/material.dart';
import 'package:storiesrshb/add_stories.dart';
import 'package:storiesrshb/stories.dart';
import 'package:storiesrshb/stories_page.dart';

import 'global_var.dart';

void main() {
  addStories(howManyStories);
  generateRoute(howManyStories);
  runApp(MyApp());
}

void generateRoute(int j) {
  if (routes != null) {
    routes.clear();
  }
  routes = {
    '/': (context) => MyHomePage(),
  };
  for (var i = 0; i < j; i++) {
    routes['/stories/id$i'] = ((context) => StoriesPage(
          text: i,
        ));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: routes,
      theme: ThemeData.light(),
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
    Widget showIcon(Stories stories) {
      if (stories.imageUrl == null) {
        return Material(
          type: MaterialType.transparency,
          child: FittedBox(
            child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                      LinearGradient(colors: stories.gradient, stops: [0, 1]),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  //color: Colors.black,
                  child: FittedBox(
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${stories.title}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      }
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
                image: NetworkImage(stories.imageUrl),
              ),
            ),
          ),
        ),
      );
    }

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
                    child: showIcon(storiesList[index]),
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
    Navigator.pushNamed(context, '/stories/id$i');
  }
}
