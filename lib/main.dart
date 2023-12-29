/// This is a basic template app to begin a Solid POD project.
//
// Time-stamp: <Saturday 2023-12-30 07:51:05 +1100 Graham Williams>
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

import 'package:flutter/material.dart';

import 'package:solid/solid.dart';
import 'package:window_manager/window_manager.dart';

import 'utils/is_desktop.dart';

void main() async {
  // Remove [debugPrint] messages from production code.

  debugPrint = (String? message, {int? wrapWidth}) {
    null;
  };

  // Suport window size and top placement for desktop apps.

  if (isDesktop) {
    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
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

    windowManager.waitUntilReadyToShow(windowOptions, () async {
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          const SolidLogin(child: Scaffold(body: Text('ToMyPod Placeholder'))),
    );
  }
}
