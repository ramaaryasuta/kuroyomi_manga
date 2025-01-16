import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/licensed_repository.dart';
import 'licensed_state.dart';

class LicensedCubit extends Cubit<LicensedState> {
  LicensedCubit() : super(LicensedInitial());

  Future<void> getLicensedMangaList() async {
    emit(LicensedLoading());
    try {
      final response = await LicensedRepository().fetchLicensedMangaList();
      emit(LicensedLoaded(licensedMangaList: response));
    } catch (e) {
      emit(LicensedError(errorMessage: e.toString()));
    }
  }
}
