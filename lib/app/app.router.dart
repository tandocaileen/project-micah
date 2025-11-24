// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:stacked/stacked.dart' as _i6;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../ui/views/categories/categories_view.dart' as _i3;
import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/search/search_view.dart' as _i4;
import '../ui/views/startup/startup_view.dart' as _i1;

final stackedRouter = StackedRouterWeb(
  navigatorKey: _i5.StackedService.navigatorKey,
);

class StackedRouterWeb extends _i6.RootStackRouter {
  StackedRouterWeb({_i7.GlobalKey<_i7.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      final args = routeData.argsAs<StartupViewArgs>(
        orElse: () => const StartupViewArgs(),
      );
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.StartupView(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeViewArgs>(
        orElse: () => const HomeViewArgs(),
      );
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.HomeView(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CategoriesViewRoute.name: (routeData) {
      final args = routeData.argsAs<CategoriesViewArgs>(
        orElse: () => const CategoriesViewArgs(),
      );
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.CategoriesView(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchViewRoute.name: (routeData) {
      final args = routeData.argsAs<SearchViewArgs>(
        orElse: () => const SearchViewArgs(),
      );
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.SearchView(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(StartupViewRoute.name, path: '/'),
        _i6.RouteConfig(HomeViewRoute.name, path: '/home-view'),
        _i6.RouteConfig(CategoriesViewRoute.name, path: '/categories-view'),
        _i6.RouteConfig(SearchViewRoute.name, path: '/search-view'),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i6.PageRouteInfo<StartupViewArgs> {
  StartupViewRoute({_i7.Key? key})
      : super(
          StartupViewRoute.name,
          path: '/',
          args: StartupViewArgs(key: key),
        );

  static const String name = 'StartupView';
}

class StartupViewArgs {
  const StartupViewArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'StartupViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i6.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({_i7.Key? key})
      : super(
          HomeViewRoute.name,
          path: '/home-view',
          args: HomeViewArgs(key: key),
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CategoriesView]
class CategoriesViewRoute extends _i6.PageRouteInfo<CategoriesViewArgs> {
  CategoriesViewRoute({_i7.Key? key})
      : super(
          CategoriesViewRoute.name,
          path: '/categories-view',
          args: CategoriesViewArgs(key: key),
        );

  static const String name = 'CategoriesView';
}

class CategoriesViewArgs {
  const CategoriesViewArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'CategoriesViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SearchView]
class SearchViewRoute extends _i6.PageRouteInfo<SearchViewArgs> {
  SearchViewRoute({_i7.Key? key})
      : super(
          SearchViewRoute.name,
          path: '/search-view',
          args: SearchViewArgs(key: key),
        );

  static const String name = 'SearchView';
}

class SearchViewArgs {
  const SearchViewArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'SearchViewArgs{key: $key}';
  }
}

extension RouterStateExtension on _i5.RouterService {
  Future<dynamic> navigateToStartupView({
    _i7.Key? key,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(StartupViewRoute(key: key), onFailure: onFailure);
  }

  Future<dynamic> navigateToHomeView({
    _i7.Key? key,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(HomeViewRoute(key: key), onFailure: onFailure);
  }

  Future<dynamic> navigateToCategoriesView({
    _i7.Key? key,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(CategoriesViewRoute(key: key), onFailure: onFailure);
  }

  Future<dynamic> navigateToSearchView({
    _i7.Key? key,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(SearchViewRoute(key: key), onFailure: onFailure);
  }

  Future<dynamic> replaceWithStartupView({
    _i7.Key? key,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(StartupViewRoute(key: key), onFailure: onFailure);
  }

  Future<dynamic> replaceWithHomeView({
    _i7.Key? key,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(HomeViewRoute(key: key), onFailure: onFailure);
  }

  Future<dynamic> replaceWithCategoriesView({
    _i7.Key? key,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(CategoriesViewRoute(key: key), onFailure: onFailure);
  }

  Future<dynamic> replaceWithSearchView({
    _i7.Key? key,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(SearchViewRoute(key: key), onFailure: onFailure);
  }
}
