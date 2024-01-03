import 'package:flutter/material.dart';

import 'ui/screens/main_navigation_screen/main_navigation_screen.dart';
import 'ui/theme/my_theme.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SNKRS',
      theme: MyTheme.theme,
      home: const MainNavigationScreen(),
    );
  }
}
