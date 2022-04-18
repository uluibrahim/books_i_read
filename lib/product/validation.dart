import 'package:books_i_read/core/extension/string_extension.dart';
import 'package:books_i_read/core/init/language/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

mixin Validation {
  static String? validationNullCheck(String? value) {
    return value!.isEmpty ? LocaleKeys.cannotBeEmpty.tr() : null;
  }

  static String? validationNumberIsEmpty(String? value) {
    return value!.isValidNumber() ? null : LocaleKeys.mustContainOnlyNumbers.tr();
  }
}
