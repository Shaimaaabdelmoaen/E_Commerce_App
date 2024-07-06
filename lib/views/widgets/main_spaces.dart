import 'package:flutter/cupertino.dart';

class MainSpaces extends StatelessWidget {
  const MainSpaces._();

  static SizedBox height(double height) {
    return SizedBox(height: height);
  }

  static SizedBox width(double width) {
    return SizedBox(width: width);
  }

  static SizedBox small() {
    return SizedBox(height: 8);
  }

  static SizedBox medium() {
    return SizedBox(height: 16);
  }

  static SizedBox large() {
    return SizedBox(height: 24);
  }

  static SizedBox extraLarge() {
    return SizedBox(height: 32);
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // This widget is not meant to be used as an instance
  }
}
