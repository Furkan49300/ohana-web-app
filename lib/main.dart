import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/routers/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return BlocProvider<DropdownMenuBloc>(
      create: (context) => DropdownMenuBloc(),
      child: MaterialApp(
        title: "OHana Entreprise",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme)),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
