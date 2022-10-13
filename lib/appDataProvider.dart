import 'package:flutter/material.dart';

class AppDataProvider  extends InheritedWidget {
  final AppData appData;
  @override
  // ignore: overridden_fields
  final Widget child;

  const AppDataProvider({
    Key? key,
    required this.appData,
    required this.child,
  }) : super(key: key, child: child);

  static AppDataProvider? of (BuildContext context) => 
  context.dependOnInheritedWidgetOfExactType<AppDataProvider>();

  @override
  bool updateShouldNotify(covariant AppDataProvider oldWidget) {
    return oldWidget != this ;
  }
}

class AppData {
  bool isFavorited;
  AppData({required this.isFavorited});

  changeFavorite () {
     isFavorited = !isFavorited;
  }
}