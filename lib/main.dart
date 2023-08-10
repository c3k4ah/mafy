import 'package:flutter/material.dart';

import 'app.dart';
import 'dependency_injection/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initInjection();
  runApp(const MyApp());
}
