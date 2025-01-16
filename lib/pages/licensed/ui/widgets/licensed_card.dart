import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kuroyomi_manga/pages/licensed/data/licensed_manga_model.dart';

import '../../../../core/router/app_router.gr.dart';

class LicensedMangaCard extends StatelessWidget {
  const LicensedMangaCard({
    super.key,
    required this.manga,
  });

  final LicensedMangaModel manga;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router
          .push(DetailRoute(isLicensed: true, licensedManga: manga)),
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withAlpha(50),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Column(
          spacing: 5,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        manga.image ?? '',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        )),
                    child: Text(
                      manga.tier ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.amber),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                manga.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
