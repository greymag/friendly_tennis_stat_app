import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:innim_lib/innim_lib.dart';
import 'package:intl/intl.dart';
import 'package:multiple_localization/multiple_localization.dart';

import 'l10n/messages_all.dart';

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      L10n.isSupported(locale, AppLocalizations.supportedLocales);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(
        initializeMessages, locale, (l) => AppLocalizations(l),
        setDefaultLocale: true);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

/// App localization.
class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// Supported languages.
  static final supportedLocales = L10n.support(['ru']);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  final String locale;

  AppLocalizations(this.locale) : assert(locale != null);

  String get applicationName {
    return Intl.message(
      'Tennis stat',
      name: 'applicationName',
    );
  }

  // PlayersScreen

  String get playersTitle {
    return Intl.message(
      'Игроки',
      name: 'playersTitle',
    );
  }
}

extension LocalizationContextExtension on BuildContext {
  AppLocalizations get l => AppLocalizations.of(this);
}
