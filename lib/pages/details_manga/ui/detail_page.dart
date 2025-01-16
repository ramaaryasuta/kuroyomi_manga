import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../licensed/data/licensed_manga_model.dart';
import '../../../core/utils/media_query.dart';
import '../../home/data/manga_model.dart';
import '../../web_inapp/web_inapp.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key, this.manga, this.licensedManga, this.isLicensed = false});

  final MangaModel? manga;
  final LicensedMangaModel? licensedManga;
  final bool isLicensed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Visibility(
          visible: isLicensed,
          replacement:
              Text(manga?.title ?? '', overflow: TextOverflow.ellipsis),
          child: Row(
            spacing: 10,
            children: [
              Icon(Icons.check_circle_outlined),
              Container(
                constraints:
                    BoxConstraints(maxWidth: screenWidth(context) * 0.6),
                child: Text(
                  licensedManga?.title ?? '',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  manga?.image ?? licensedManga?.image ?? '',
                  width: double.infinity,
                  height: screenHeight(context) * 0.5,
                ),
              ),
              Center(
                child: Text(
                  manga?.title ?? licensedManga?.title ?? '',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                '${AppLocalizations.of(context)!.author} : ${manga?.author ?? licensedManga?.author ?? ''}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '${AppLocalizations.of(context)!.tier} : ${manga?.tier ?? licensedManga?.tier ?? ''}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '${AppLocalizations.of(context)!.pages} : ${manga?.pages ?? licensedManga?.pages ?? ''}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '${AppLocalizations.of(context)!.parody} : ${manga?.parody ?? licensedManga?.parody ?? '-'}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              buildTags(context),
              buildSiteTags(context),
              buildButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Column buildButton(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    url: manga?.link ?? licensedManga?.link ?? '',
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.read,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        ),
        if (!isLicensed)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewPage(
                      url: manga?.eh ??
                          manga?.im ??
                          manga?.hm ??
                          manga?.nh ??
                          'https://google.com',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.alternative,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
            ),
          )
      ],
    );
  }

  Column buildTags(BuildContext context) {
    return Column(
      children: [
        if (isLicensed && licensedManga?.tags != null) ...[
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  '${AppLocalizations.of(context)!.tags} :',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    for (var e in licensedManga!.tags!) Chip(label: Text(e))
                  ],
                ),
              ),
            ],
          )
        ],
        if (!isLicensed && manga?.tag != null)
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  '${AppLocalizations.of(context)!.tags}:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  children: [for (var e in manga!.tag!) Chip(label: Text(e))],
                ),
              ),
            ],
          )
      ],
    );
  }

  Column buildSiteTags(BuildContext context) {
    return Column(
      children: [
        if (isLicensed && licensedManga?.siteTag?.tags != null) ...[
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  '${AppLocalizations.of(context)!.siteTags} :',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    for (var e in licensedManga!.siteTag!.tags!)
                      Chip(label: Text(e))
                  ],
                ),
              ),
            ],
          )
        ],
        if (!isLicensed && manga?.siteTag?.tags != null)
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  '${AppLocalizations.of(context)!.siteTags}:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    for (var e in manga!.siteTag!.tags!) Chip(label: Text(e))
                  ],
                ),
              ),
            ],
          )
      ],
    );
  }
}
