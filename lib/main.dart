import 'package:firebase_auth/firebase_auth.dart';
import 'package:fishersc/checkschemes.dart';
import 'package:fishersc/findagencies.dart';
import 'package:fishersc/provider/auth_provider.dart';
import 'package:fishersc/screens/profile_screen.dart';
import 'package:fishersc/screens/welcome_screen.dart';
import 'package:fishersc/sortagencies.dart';
import 'package:fishersc/splashscreen.dart';
import 'package:fishersc/welcomepwd.dart';
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
