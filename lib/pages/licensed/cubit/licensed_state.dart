import '../data/licensed_manga_model.dart';

abstract class LicensedState {}

class LicensedInitial extends LicensedState {}

class LicensedLoading extends LicensedState {}

class LicensedLoaded extends LicensedState {
  List<LicensedMangaModel> licensedMangaList;
  LicensedLoaded({required this.licensedMangaList});
}

class LicensedError extends LicensedState {
  String errorMessage;
  LicensedError({required this.errorMessage});
}
