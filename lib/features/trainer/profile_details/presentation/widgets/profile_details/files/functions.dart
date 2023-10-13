import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';

String getImageName(String url) => url.split('/').last;
void openFileInNewScreen(BuildContext context, String url) {
  NavigationHelper.goto(
      screen: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Image.network(url),
          )),
      context: context);
}
