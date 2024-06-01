import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

import 'package:ohana_webapp_flutter/presentation/routers/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = AppRouter();
    return MaterialApp(
      title: "OHana Entreprise",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme)),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
