import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_theme/flutter_custom_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:innim_lib/innim_lib.dart';
import 'package:innim_ui/innim_ui.dart';
import 'package:tennis_stat/application/routes.dart';
import 'package:tennis_stat/blocs/application/app/app_bloc.dart';
import 'package:tennis_stat/screens/launch/launch_screen.dart';

import 'config.dart';
import 'di_initializer.dart';
import 'localization.dart';
import 'theme.dart';

class TennisStatApp extends StatelessWidget {
  static final List<LocalizationsDelegate<dynamic>> _localizationsDelegates = [
    AppLocalizations.delegate,
    InnimLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  TennisStatApp(AppConfig config, {Key key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    Bloc.observer = _ApplicationBlocObserver();

    DependencyInjectionInitializer.initialize(config);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(TennisStatTheme.systemUIOverlayStyle);

    // final di = GetIt.I;
    return _buildRepositories(
      context: context,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc()..add(const AppShown()),
          ),
        ],
        child: BlocBuilder<AppBloc, AppState>(
          buildWhen: (prev, cur) => cur is! AppReadySuccess && cur is! AppReady,
          builder: (context, state) {
            if (state is AppInitial || state is AppLoadInProgress) {
              return _buildLaunchApp();
            }

            if (state is AppLoadSuccess) {
              return _buildMainApp(state);
            }

            debugAssertUnknownState(state);
            return const LoadingWidget();
          },
        ),
      ),
    );
  }

  Widget _buildLaunchApp() {
    return _buildApp(
      home: const LaunchScreen(),
    );
  }

  Widget _buildMainApp(AppLoadSuccess state) {
    // final di = GetIt.instance;
    return _buildApp(
      builder: (context, child) {
        return _buildGlobalBlocs(
          localizations: AppLocalizations.of(context),
          builder: (context) => _buildHierarchy(
            context: context,
            builders: const [],
            child: child,
          ),
          state: state,
        );
      },
      initialRoute: AppRoutes.home,
      navigatorKey: _navigatorKey,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Widget _buildHierarchy(
      {BuildContext context, List<TransitionBuilder> builders, Widget child}) {
    var res = child;

    while (builders.isNotEmpty) {
      res = builders.removeLast().call(context, res);
    }

    return res;
  }

  Widget _buildApp({
    Widget home,
    String initialRoute,
    TransitionBuilder builder,
    GlobalKey<NavigatorState> navigatorKey,
    RouteFactory onGenerateRoute,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
  }) {
    return CustomThemes(
      data: const [],
      child: MaterialApp(
        theme: TennisStatTheme.theme,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: _localizationsDelegates,
        navigatorKey: navigatorKey,
        navigatorObservers: navigatorObservers,
        onGenerateRoute: onGenerateRoute,
        builder: builder,
        initialRoute: initialRoute,
        home: home,
      ),
    );
  }

  Widget _buildRepositories(
      {@required Widget child, @required BuildContext context}) {
    assert(context != null);
    assert(child != null);

    // final config = AppConfig.of(context);
    // final di = GetIt.instance;
    return MultiRepositoryProvider(
      providers: const [],
      child: child,
    );
  }

  Widget _buildGlobalBlocs(
      {@required WidgetBuilder builder,
      @required AppLocalizations localizations,
      @required AppLoadSuccess state}) {
    assert(localizations != null);
    assert(builder != null);
    assert(state != null);

    // final di = GetIt.instance;

    return MultiBlocProvider(
      providers: const [],
      child: Builder(
        builder: builder,
      ),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    return AppRoutes.createRoute(settings.name, settings: settings);
  }
}

class _ApplicationBlocObserver extends BlocObserver {
  final bool logEnabled;

  _ApplicationBlocObserver({this.logEnabled = false});

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (logEnabled) {
      debugLog('$bloc: $transition');
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stacktrace) {
    super.onError(cubit, error, stacktrace);
    debugError('️Error:\n$error. Stacktrace: $stacktrace');
  }
}
