import 'package:flutter_bloc/flutter_bloc.dart';

import 'locale_cubit.dart';

List<BlocProvider> blocProviders = [
  BlocProvider(create: (_) => LocaleCubit()),
];
