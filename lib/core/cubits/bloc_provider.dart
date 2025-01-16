import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuroyomi_manga/pages/licensed/cubit/licensed_cubit.dart';

import '../../pages/home/cubit/home_cubit.dart';
import 'locale_cubit.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()), // handle language
  BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
  BlocProvider<LicensedCubit>(create: (_) => LicensedCubit()),
];
