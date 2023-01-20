import 'package:flutter/material.dart';

const CircleAvatar listCircleAvatar = CircleAvatar(
  radius: 32.0,
  backgroundColor: Colors.white,
  child: Icon(
    Icons.list,
    size: 32.0,
    color: Colors.lightBlue,
  ),
);

const TextStyle textStyle = TextStyle(color: Colors.white);

const BoxDecoration boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(32.0),
    topRight: Radius.circular(32.0),
  ),
  color: Colors.white,
  boxShadow: boxShadowList,
);

const List<BoxShadow> boxShadowList = [
  BoxShadow(
    color: Colors.grey,
    blurRadius: 4,
  ),
];

const InputDecoration inputDecoration = InputDecoration(
  fillColor: Colors.lightBlue,
);

const ButtonStyle buttonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Colors.lightBlue),
);
