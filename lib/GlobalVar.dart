import 'package:flutter/widgets.dart';
import 'package:storiesrshb/stories.dart';

// Перепеши на какой-угодно стейт и прокидывай в дерево виджетов через DI, а не глобальными переменными
List<stories> storiesList = [];
List<Widget> statusList = [];
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
