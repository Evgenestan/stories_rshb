import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storiesrshb/stories.dart';

import 'GlobalVar.dart';

void addStories(String test) {
  var imageUrl;
  // Если будет 10 000 000 000 сторис - условие будет занимать 1000 строк кода?
  // Сделай одну картинку для каждой 3й, еще одну для каждой 3й + 1 и без картинки для каждой 3й + 2
  if (test != 'var2 ' && test != 'var5 ') {
    imageUrl = 'https://donpress.com/files/styles/xlwd/public/images/news/1903/imagen348g.jpg';
  }
  var buttonUrl;
  var buttonText;
  // -_-
  if (test == 'var2 ' || test == 'var4 ') {
    buttonUrl = 'https://donpress.com/files/styles/xlwd/public/images/news/1903/imagen348g.jpg';
    buttonText = 'Оформить заказ';
  }

  var title = 'Молочный рай';
  var text = 'Подарим вам 10 литровую бочку домашнего молока, при покупке от 10 000 Р';
  var colorLeft = 0xFFdcfeaa;
  var colorRight = 0xFFd2f3c6;
  var tempStories = stories(imageUrl, buttonUrl, buttonText, title, text, colorLeft, colorRight);
  storiesList.add(tempStories);
  statusList.add(Status(Color(0xFFcbd6c6)));
}
