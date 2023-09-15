import 'package:flutter/material.dart';
import 'package:mume/src/app.dart';
import 'package:mume/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(), child: const App()));
}
