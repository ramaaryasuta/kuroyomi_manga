import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuroyomi_manga/pages/home/data/manga_repository.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getMangaList() async {
    emit(HomeLoading());
    try {
      final response = await MangaRepository().fetchMangaList();
      emit(HomeLoaded(mangaList: response));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
