import 'package:flutter/material.dart';

bool isDesktop(BuildContext context){

  if (MediaQuery.of(context).size.width > 600) {
    return true;
  } else {
    return false;
  }

}