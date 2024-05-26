
import 'package:flutter/cupertino.dart';
import 'package:mirror_wall_pr_2/web/provider/web_provider.dart';
import 'package:mirror_wall_pr_2/web/view/web_view_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'bookmark/view/bookmark_screen.dart';
import 'history/view/history_screen.dart';


void main() {
  runApp(MirrorWall());
}

class MirrorWall extends StatelessWidget {
  const MirrorWall({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WebProvider(),
        )
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => WebViewScreen(),
          '/bookmark': (context) => BookMarks(),
          '/history': (context) => HistoryScreen(),
        },
      ),
    );
  }
}
