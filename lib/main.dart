import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/models/current_track.dart';
import 'package:spotify_ui/screens/screen_playlist.dart';
import 'package:spotify_ui/widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) => CurrentTrack(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          scaffoldBackgroundColor: const Color(0xFF121212),
          backgroundColor: const Color(0xFF121212),
          primaryColor: Colors.black,
          accentColor: const Color(0xFF1DB954),
          iconTheme: const IconThemeData().copyWith(color: Colors.white),
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            headline2: const TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[300],
              fontWeight: FontWeight.w500,
              letterSpacing: 2.0,
            ),
            bodyText1: TextStyle(
              color: Colors.grey[300],
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
            bodyText2: TextStyle(
              color: Colors.grey[300],
              letterSpacing: 1.0,
            ),
          ),
        ),
        home: DashBoard());
  }
}

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              if (MediaQuery.of(context).size.width > 800) SideMenu(),
              Expanded(
                child: PlaylistScreen(
                  playlist: lofihiphopPlaylist,
                ),
              ),
            ]),
          ),
          NowPlaying()
        ],
      ),
    );
  }
}
