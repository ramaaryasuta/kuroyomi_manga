import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/component/app_drawer.dart';
import '../cubit/licensed_cubit.dart';
import '../cubit/licensed_state.dart';
import 'widgets/licensed_card.dart';

@RoutePage()
class LicensedPage extends StatefulWidget {
  const LicensedPage({super.key});

  @override
  State<LicensedPage> createState() => _LicensedPageState();
}

class _LicensedPageState extends State<LicensedPage> {
  @override
  void initState() {
    super.initState();
    context.read<LicensedCubit>().getLicensedMangaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.licensed),
          centerTitle: true),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<LicensedCubit, LicensedState>(
                builder: (context, state) {
                  if (state is LicensedLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LicensedLoaded) {
                    return RefreshIndicator(
                      onRefresh: () =>
                          context.read<LicensedCubit>().getLicensedMangaList(),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 2 / 3,
                        ),
                        shrinkWrap: true,
                        itemCount: state.licensedMangaList.length,
                        itemBuilder: (context, index) {
                          final manga = state.licensedMangaList[index];
                          return LicensedMangaCard(manga: manga);
                        },
                      ),
                    );
                  } else if (state is LicensedError) {
                    return Center(child: Text(state.errorMessage));
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
