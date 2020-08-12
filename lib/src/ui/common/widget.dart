import 'package:flutter/material.dart';

Widget buildViewNoDataWidget() {
  return Expanded(
    child: Center(
      child: Text("No Data Available"),
    ),
  );
}

Widget buildCircularProgressIndicatorWidget() {
  return Container(
    child: Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}
