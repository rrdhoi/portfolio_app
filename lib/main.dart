import 'package:flutter/material.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:web_responsive/screens/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
          const Breakpoint(start: 361, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: child!,
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return BouncingScrollWrapper.builder(
              context, buildPage(settings.name ?? ''),
              dragWithMouse: true);
        });
      },
    );
  }

  Widget buildPage(String name) {
    switch (name) {
      case '/': return const DashboardScreen();
      default:
        return const SizedBox.shrink();
    }
  }
}