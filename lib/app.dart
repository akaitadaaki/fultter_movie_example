import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../foundation/extension/string.dart';

import 'ui/main/main_page.dart';
import 'ui/movie/chewie_movie_page.dart';
import 'ui/movie/movie_page.dart';
import 'ui/theme/app_theme.dart';

class App extends HookConsumerWidget {
  App({Key? key}) : super(key: key);

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'main',
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: MainPage(),
        ),
      ),
      GoRoute(
        name: 'movie',
        path: '/movie/:url',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: MoviePage(
            url: state.params['url'] ?? "",
          ),
        ),
      ),
      GoRoute(
        name: 'chewie',
        path: '/chewie/:autoPlay/:looping/:url',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: ChewieMoviePage(
            autoPlay: (state.params['autoPlay'] ?? "true").parseBool(),
            looping: (state.params['looping'] ?? "true").parseBool(),
            url: state.params['url'] ?? "",
          ),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text("予期せぬエラーが発生しました\n" + state.error.toString()),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);

    const locale = Locale("ja", "JP");
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      theme: theme.data,
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
      ],
      darkTheme: AppTheme.dark().data,
      themeMode: themeMode,
      builder: (context, widget) {
        ScreenUtil.init(context);
        return MediaQuery(
          data: MediaQuery.of(context),
          //Setting font does not change with system font size
          // data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: SafeArea(child: widget!),
        );
      },
    );
  }
}
