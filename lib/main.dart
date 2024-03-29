import 'package:firebase_auth/firebase_auth.dart';
import 'package:fishersc/view/checkschemes.dart';
import 'package:fishersc/view/findagencies.dart';
import 'package:fishersc/view_model/auth_provider.dart';
import 'package:fishersc/view/profile_screen.dart';
import 'package:fishersc/view/welcome_screen.dart';
import 'package:fishersc/view/sortagencies.dart';
import 'package:fishersc/view/splashscreen.dart';
import 'package:fishersc/view/welcomepwd.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "fisharoo",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffFFF3E9),
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          'findagencies': (context) => const FindAgencies(),
          'checkschemes': (context) => const CheckSchemes(),
          'sortagencies': (context) => const SortAgencies(),
          'profile': (context) => const ProfileScreen(),
          'home': (context) => const WelcomePWD(),
        },
      ),
    );
  }
}
