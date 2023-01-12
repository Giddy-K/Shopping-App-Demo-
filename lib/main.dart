import 'package:app4/common/widget/bottom_bar.dart';
import 'package:app4/features/admin/screens/admin_screens.dart';
import 'package:app4/features/auth/providers/user_provider.dart';
import 'package:app4/features/auth/screens/login_screen.dart';
import 'package:app4/features/auth/services/auth_services.dart';
import 'package:app4/features/onboarding/onboarding_screen.dart';
import 'package:app4/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/global_variables.dart';

late final int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = ( prefs.getInt("initScreen"));
  await prefs.setInt("initScreen", 1);
  //print('initScreen $initScreen');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        useMaterial3: true,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) =>
            Provider.of<UserProvider>(context).user.token.isNotEmpty
                ? Provider.of<UserProvider>(context).user.type == 'user'
                    ? const BottomBar()
                    : const AdminScreen()
                : const LoginScreen(),
        "first": (context) => const OnboardingScreen(),
      },
      onGenerateRoute: ((settings) => generateRoute(settings)),
    );
  }
}
