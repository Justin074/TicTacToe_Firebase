import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/router/router.dart';
import 'package:tic_tac_toe/core/utilities/dependency_injection.dart';
import 'package:tic_tac_toe/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await DI.init();

  runApp(
    const RootRestorationScope(
      restorationId: 'root',
      child: MyApp(),
    ),
  );
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'root',
      title: 'Tic Tac Toe',
      routerConfig: GoRouting.initRouter(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Prompt',
      ),
    );
  }
}
