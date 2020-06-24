import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storiesrshb/stories.dart';

import 'global_var.dart';

void addStories(int j) {
  for (var i = 1; i < j + 1; i++) {
    var imageUrl;
    // Сделай одну картинку для каждой 3й, еще одну для каждой 3й + 1 и без картинки для каждой 3й + 2
    if (i % 3 == 0) {
      imageUrl =
          'https://vignette.wikia.nocookie.net/percyjackson/images/0/0a/9265fcf6c2be.jpg/revision/latest/scale-to-width-down/340?cb=20160530171549&path-prefix=ru';
    }
    if ((i - 1) % 3 == 0) {
      imageUrl =
          'https://avatars.mds.yandex.net/get-zen_doc/241236/pub_5d8ce28e0ce57b00ade9d0a0_5d8ce37ae6e8ef00b29eb5d5/scale_1200';
    }
    var buttonUrl =
        'https://avatars.mds.yandex.net/get-zen_doc/241236/pub_5d8ce28e0ce57b00ade9d0a0_5d8ce37ae6e8ef00b29eb5d5/scale_1200';
    var buttonText;
    buttonText = 'Оформить заказ';

    var title = 'Молочный рай';
    var text =
        'Подарим вам 10 литровую бочку домашнего молока, при покупке от 10 000 Р';
    var colorLeft = 0xFFdcfeaa;
    var colorRight = 0xFFd2f3c6;
    var tempStories = Stories(
        imageUrl, buttonUrl, buttonText, title, text, colorLeft, colorRight);
    storiesList.add(tempStories);
    statusList.add(Status(color: Color(0xFFcbd6c6)));
  }
  statusList.add(Close());
}
