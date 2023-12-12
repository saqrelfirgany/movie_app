import 'package:bnoud/l10n/l10n.dart';
import 'package:bnoud/repositories/initial_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'core/constatnts/router.dart';
import 'core/controllers/language_cubit.dart';
import 'core/dependencies/dependencies.dart';
import 'core/dependencies/dependencies.dart' as dep;
import 'core/helper/dio_helper.dart';
import 'core/helper/helper.dart';
import 'core/theme/theme_helper.dart';
import 'l10n/app_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  await Future.wait(
    [
      DioHelper.init(),
      dep.setup(),
    ],
  );

  // runApp(
  //   DevicePreview(
  //     builder: (context) => const MyApp(),
  //   ),
  // );

  runApp(
    const MyApp(),
  );
}

Future<void> init() async {
  Helper.token = await Helper.getUserToken();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final InitialRepository initialRepository = serviceLocator<InitialRepository>();
  final LanguageCubit languageCubit = LanguageCubit();

  @override
  void initState() {
    DioHelper.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>.value(value: languageCubit),
      ],
      child: BlocBuilder<LanguageCubit, Language>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Movie',
            debugShowCheckedModeBanner: false,
            theme: theme,
            supportedLocales: L10n.all,
            locale: languageCubit.currentLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            builder: FlutterSmartDialog.init(),
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
