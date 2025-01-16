import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/cubits/bloc_provider.dart';
import 'core/cubits/locale_cubit.dart';
import 'core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: blocProviders,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(builder: (context, locale) {
      return MaterialApp.router(
        title: 'Kuroyomi Manga',
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
    });
  }
}
