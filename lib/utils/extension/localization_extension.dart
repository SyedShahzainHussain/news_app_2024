import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

extension LocalizaionExtension on BuildContext {
  AppLocalizations? get localization => AppLocalizations.of(this);
}