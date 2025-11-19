import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chatting/app_theme.dart';
import 'package:flutter_chatting/firebase_options.dart';
import 'package:flutter_chatting/ui/chat_page/view/chat_page_view.dart';
import 'package:flutter_chatting/ui/root_page.dart';
import 'package:flutter_chatting/ui/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: '헬스메이트',
      home: SplashPage(),
    );
  }
}
