import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/locale_cubit.dart';

void openLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Change Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildLanguageTile(context, language: 'English', languageCode: 'en'),
            buildLanguageTile(context,
                language: 'Indonesia', languageCode: 'id'),
            buildLanguageTile(context, language: '日本語', languageCode: 'ja'),
          ],
        ),
      );
    },
  );
}

ListTile buildLanguageTile(BuildContext context,
    {required String language, required String languageCode}) {
  return ListTile(
    title: Text(language),
    trailing: context.read<LocaleCubit>().state == Locale(languageCode)
        ? const Icon(Icons.check, color: Colors.white)
        : null,
    onTap: () {
      Navigator.pop(context);
      context.read<LocaleCubit>().changeLocale(languageCode);
    },
  );
}
