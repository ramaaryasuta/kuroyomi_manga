// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:kuroyomi_manga/pages/details_manga/ui/detail_page.dart' as _i1;
import 'package:kuroyomi_manga/pages/home/data/manga_model.dart' as _i7;
import 'package:kuroyomi_manga/pages/home/ui/home_page.dart' as _i2;
import 'package:kuroyomi_manga/pages/licensed/data/licensed_manga_model.dart'
    as _i8;
import 'package:kuroyomi_manga/pages/licensed/ui/licensed_page.dart' as _i3;
import 'package:kuroyomi_manga/pages/web_inapp/web_inapp.dart' as _i4;

/// generated route for
/// [_i1.DetailPage]
class DetailRoute extends _i5.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i6.Key? key,
    _i7.MangaModel? manga,
    _i8.LicensedMangaModel? licensedManga,
    bool isLicensed = false,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         DetailRoute.name,
         args: DetailRouteArgs(
           key: key,
           manga: manga,
           licensedManga: licensedManga,
           isLicensed: isLicensed,
         ),
         initialChildren: children,
       );

  static const String name = 'DetailRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailRouteArgs>(
        orElse: () => const DetailRouteArgs(),
      );
      return _i1.DetailPage(
        key: args.key,
        manga: args.manga,
        licensedManga: args.licensedManga,
        isLicensed: args.isLicensed,
      );
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    this.manga,
    this.licensedManga,
    this.isLicensed = false,
  });

  final _i6.Key? key;

  final _i7.MangaModel? manga;

  final _i8.LicensedMangaModel? licensedManga;

  final bool isLicensed;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, manga: $manga, licensedManga: $licensedManga, isLicensed: $isLicensed}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LicensedPage]
class LicensedRoute extends _i5.PageRouteInfo<void> {
  const LicensedRoute({List<_i5.PageRouteInfo>? children})
    : super(LicensedRoute.name, initialChildren: children);

  static const String name = 'LicensedRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LicensedPage();
    },
  );
}

/// generated route for
/// [_i4.WebViewPage]
class WebViewRoute extends _i5.PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    _i6.Key? key,
    required String url,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         WebViewRoute.name,
         args: WebViewRouteArgs(key: key, url: url),
         initialChildren: children,
       );

  static const String name = 'WebViewRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebViewRouteArgs>();
      return _i4.WebViewPage(key: args.key, url: args.url);
    },
  );
}

class WebViewRouteArgs {
  const WebViewRouteArgs({this.key, required this.url});

  final _i6.Key? key;

  final String url;

  @override
  String toString() {
    return 'WebViewRouteArgs{key: $key, url: $url}';
  }
}
