import 'package:flutter/material.dart';

var inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.0),
    //borderSide: BorderSide(width: 3.0),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
      //<-- SEE HERE
      borderSide: BorderSide(width: 3, color: Colors.green.shade400),
      borderRadius: BorderRadius.circular(50.0)),

  // suffixIcon: Builder(builder: builder)
);

var containerDecoration = BoxDecoration(
  color: Colors.grey[200],
  border: Border.all(color: Colors.transparent),
  borderRadius: BorderRadius.circular(50.0),
);



var normalDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    //borderSide: BorderSide(width: 3.0),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
      //<-- SEE HERE
      borderSide: BorderSide(width: 1, color: Colors.lightBlue.shade400),
      borderRadius: BorderRadius.circular(20.0)),

  // suffixIcon: Builder(builder: builder)
);