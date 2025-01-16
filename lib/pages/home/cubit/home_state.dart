import '../data/manga_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

class HomeLoaded extends HomeState {
  List<MangaModel> mangaList;
  HomeLoaded({required this.mangaList});
}
