import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chatting/firebase_options.dart';
import 'package:flutter_chatting/ui/chat_page/view/chat_page_view.dart';
import 'package:flutter_chatting/ui/root_page.dart';
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
      title: '헬스메이트',
      home: RootPage(), // ✅ 여기서 프로필 유무 보고 분기
    );
  }
}
