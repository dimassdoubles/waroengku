// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:waroengku/share/const/category_previx.dart';

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String removeCategoryPrevix() => replaceAll(
        RegExp(r'(' + categoryPrevix + ')'),
        '',
      );
}
