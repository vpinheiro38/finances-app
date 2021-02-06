import 'package:finances_app/services.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator().then((_) => runApp(Application()));
}