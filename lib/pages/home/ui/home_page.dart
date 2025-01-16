import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/component/app_drawer.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'widgets/manga_card.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HomeCubit>().getMangaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.kuroyomiManga),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    return RefreshIndicator(
                      onRefresh: () => context.read<HomeCubit>().getMangaList(),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 2 / 3,
                        ),
                        shrinkWrap: true,
                        itemCount: state.mangaList.length,
                        itemBuilder: (context, index) {
                          final manga = state.mangaList[index];
                          return MangaCard(manga: manga);
                        },
                      ),
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Center(child: Text('Something went wrong'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
