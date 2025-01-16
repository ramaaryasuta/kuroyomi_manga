import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuroyomi_manga/core/utils/api_path.dart';
import 'package:kuroyomi_manga/core/utils/dio_client.dart';
import 'package:kuroyomi_manga/pages/home/data/manga_model.dart';

import '../router/app_router.gr.dart';
import 'change_language_dialog.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                if (context.router.current.name == HomeRoute.name) {
                  Navigator.pop(context);
                } else {
                  context.router.pushAndPopUntil(const HomeRoute(),
                      predicate: (_) => false);
                }
              },
              leading: const Icon(
                Icons.home,
              ),
              title: Text(AppLocalizations.of(context)!.home),
            ),
            ListTile(
              onTap: () {
                if (context.router.current.name == LicensedRoute.name) {
                  Navigator.pop(context);
                } else {
                  context.router.pushAndPopUntil(const LicensedRoute(),
                      predicate: (_) => false);
                }
              },
              leading: const Icon(
                Icons.check_circle_outlined,
              ),
              title: Text(AppLocalizations.of(context)!.licensed),
            ),
            ListTile(
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
                var response =
                    await DioClient().apiGetRequest(path: APiPath.random);
                if (response.statusCode == 200) {
                  var data = MangaModel.fromJson(response.data['entry']);
                  if (context.mounted) {
                    Navigator.pop(context);
                    context.router.push(DetailRoute(manga: data));
                  }
                }
              },
              leading: const Icon(
                Icons.sports_esports_outlined,
              ),
              title: Text(AppLocalizations.of(context)!.gacha),
            ),
            ListTile(
              onTap: () => openLanguageDialog(context),
              leading: const Icon(
                Icons.language,
              ),
              title: Text(AppLocalizations.of(context)!.changeLanguage),
            )
          ],
        ),
      ),
    );
  }
}
