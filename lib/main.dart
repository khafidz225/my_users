import 'package:flutter/material.dart';
import 'package:my_users/app.dart';
import 'package:my_users/core/di/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MainApp());
}
