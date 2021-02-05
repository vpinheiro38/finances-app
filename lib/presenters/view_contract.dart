import 'package:flutter/material.dart';

abstract class View<T> {
  //Widget buildContent();

  set properties(T value);
}