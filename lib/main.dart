/// This is a basic template app to begin a Solid POD project.
//
// Time-stamp: <Thursday 2024-02-01 13:33:22 +1100 Graham Williams>
//
/// Copyright (C) 2024, Graham.Williams@togaware.com
///
/// Licensed under the GNU General Public License, Version 3 (the "License");
///
/// License: https://www.gnu.org/licenses/gpl-3.0.en.html
//
// This program is free software: you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later
// version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program.  If not, see <https://www.gnu.org/licenses/>.
///
/// Authors: Graham Williams
library;

import 'package:flutter/material.dart';

import 'package:solid/solid.dart';
import 'package:window_manager/window_manager.dart';

import 'package:tomypod/utils/is_desktop.dart';

void main() async {
  // Remove [debugPrint] messages from production code.

  debugPrint = (message, {wrapWidth}) {};

  // Suport window size and top placement for desktop apps.

  if (isDesktop) {
    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();

    const windowOptions = WindowOptions(
      // Setting [alwaysOnTop] here will ensure the app starts on top of other
      // apps on the desktop so that it is visible. We later turn it of as we
      // don't want to force it always on top.

      alwaysOnTop: true,

      // The size is overridden in the first instance by linux/my_application.cc
      // but setting it here then does have effect when Restarting the app.

      // Windows has 1280x720 by default in windows/runner/main.cpp line 29 so
      // best not to override it here since under windows the 950x600 is too
      // small.

      //size: Size(750, 873),

      // The [title] is used for the window manager's window title.

      title: 'ToMy POD - Pipeline data to my POD',
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setAlwaysOnTop(false);
    });
  }

  // Ready to now run the app.

  runApp(const ToMyPod());
}

class ToMyPod extends StatelessWidget {
  const ToMyPod({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To My POD',
      theme: ThemeData(
        // Change the theme for the app here.

        cardTheme: const CardTheme(
          color: Color(0XFFA6DCC2),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: const Color(0XFF74A58D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              color: Colors.white, // TODO 20240105 gjw NOT WORKING.
            ),
          ),
        ),
      ),
      home: const SolidLogin(
        image: AssetImage('assets/images/image.jpg'),
        logo: AssetImage('assets/images/icon.png'),
        title: 'DATA PIPELINES TO YOUR POD',
        link: 'https://github.com/gjwgit/tomypod',
        child: Scaffold(body: Text('ToMyPod Placeholder')),
      ),
    );
  }
}
