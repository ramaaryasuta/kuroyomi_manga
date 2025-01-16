import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/home/cubit/home_cubit.dart';
import 'locale_cubit.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()), // handle language
  BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
];
