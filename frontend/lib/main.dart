import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/providers/user_provider.dart';
import 'src/services/api_service.dart';
import 'src/config.dart';
import 'src/utils/theme/theme.dart';
import 'src/providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(ApiService(Config.apiUrl)),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(AppTheme.lightTheme, 0),
          child: MyApp(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
