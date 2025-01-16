import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
