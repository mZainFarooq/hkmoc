// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get loginScreenScreenTitle => 'Einloggen';

  @override
  String get loginScreenWelcome => 'Willkommen zurück 👋';

  @override
  String get loginScreenLoginDesc => 'Melden Sie sich an, um Ihre Reinigungsaufträge zu verwalten.';

  @override
  String get loginScreenEmailLabel => 'E-Mail';

  @override
  String get loginScreenPasswordLabel => 'Passwort';

  @override
  String get loginScreenForgotPassword => 'Passwort vergessen?';

  @override
  String get loginScreenResetMethodTitle => 'Passwort-Zurücksetzungsmethode auswählen';

  @override
  String get loginScreenResetMethodDescription => 'Wählen Sie, wie Sie Ihr Passwort zurücksetzen möchten. Sie können es selbst tun oder einen Admin bitten, es zu ändern.';

  @override
  String get loginScreenResetMyself => 'Selbst zurücksetzen';

  @override
  String get loginScreenResetByAdmin => 'Möchten Sie, dass ein Admin es ändert?';

  @override
  String get loginScreenLoginButton => 'Einloggen & Arbeit starten';

  @override
  String get dashboardScreenScreenTitle => 'Armaturenbrett';

  @override
  String get dashboardScreenGreeting => 'Hallo';

  @override
  String get dashboardScreenAssignedHotels => 'Zugewiesene Hotels';

  @override
  String get dashboardScreenNoHotelsAssigned => 'Keine Hotels zugewiesen!';

  @override
  String get dashboardScreenSeeDetails => 'Details anzeigen';

  @override
  String get dashboardScreenCheckIn => 'Einchecken';

  @override
  String get historyScreenScreenTitle => 'Verlauf';

  @override
  String get historyScreenSearchPlaceholder => 'Hotels nach Namen suchen';

  @override
  String get historyScreenFilterByDate => 'Nach Datum filtern';

  @override
  String get historyScreenTodayCompleted => 'Heute abgeschlossen';

  @override
  String get historyScreenFrom => 'Von';

  @override
  String get historyScreenTo => 'Bis';

  @override
  String get historyScreenNoResults => 'Keine Ergebnisse gefunden';

  @override
  String historyScreenCompletedRooms(Object completed, Object total) {
    return '$completed von $total Zimmern abgeschlossen';
  }

  @override
  String get settingScreenScreenTitle => 'Einstellungen';

  @override
  String get settingScreenAccountSection => 'Konto';

  @override
  String get settingScreenPreferencesSection => 'Einstellungen';

  @override
  String get settingScreenEditProfile => 'Profil bearbeiten';

  @override
  String get settingScreenNotifications => 'Benachrichtigungen';

  @override
  String get settingScreenSickLeave => 'Krankmeldung';

  @override
  String get settingScreenHelpSupport => 'Hilfe & Support';

  @override
  String get settingScreenAboutApp => 'Über die App';

  @override
  String get editProfileScreenScreenTitle => 'Profil bearbeiten';

  @override
  String get editProfileScreenLabelsFirstName => 'Vorname';

  @override
  String get editProfileScreenLabelsLastName => 'Nachname';

  @override
  String get editProfileScreenLabelsEmail => 'E-Mail';

  @override
  String get editProfileScreenLabelsPhoneNumber => 'Telefonnummer';

  @override
  String get editProfileScreenLabelsAddress => 'Adresse';

  @override
  String get editProfileScreenHintsFirstName => 'Junaid';

  @override
  String get editProfileScreenHintsLastName => 'Ahmad';

  @override
  String get editProfileScreenHintsEmail => 'ahmadjunaid791@gmail.com';

  @override
  String get editProfileScreenHintsPhoneNumber => '+92 3023434506';

  @override
  String get editProfileScreenHintsAddress => '5 Maple Avenue, Richmond, London, TW10 6JR, Deutschland';

  @override
  String get editProfileScreenButton => 'Aktualisieren';

  @override
  String get languagePopupTitle => 'Sprache wählen';

  @override
  String get languagePopupButtonsCancel => 'Abbrechen';

  @override
  String get languagePopupButtonsSelect => 'Auswählen';

  @override
  String get bottomNavigatorDashboard => 'Armaturenbrett';

  @override
  String get bottomNavigatorHistory => 'Verlauf';

  @override
  String get bottomNavigatorSetting => 'Einstellungen';

  @override
  String get notificationScreenScreenTitle => 'Benachrichtigungen';

  @override
  String get leaveScreenScreenTitle => 'Krankheitsurlaub';

  @override
  String get leaveScreenTabsApply => 'Urlaub beantragen';

  @override
  String get leaveScreenTabsHistory => 'Urlaubshistorie';

  @override
  String get leaveScreenFormApplyTitle => 'Krankheitsurlaub beantragen';

  @override
  String get leaveScreenFormTitle => 'Titel';

  @override
  String get leaveScreenFormFromDate => 'Von Datum';

  @override
  String get leaveScreenFormToDate => 'Bis Datum';

  @override
  String get leaveScreenFormDetails => 'Details';

  @override
  String get leaveScreenFormSubmit => 'Urlaub einreichen';

  @override
  String get leaveScreenHistoryStatusApproved => 'Genehmigt';

  @override
  String get leaveScreenHistoryStatusCancelled => 'Storniert';

  @override
  String get helpNSupportScreenScreenTitle => 'Hilfe & Support';

  @override
  String get helpNSupportScreenNeedHelpTitle => 'Brauchen Sie Hilfe?';

  @override
  String get helpNSupportScreenNeedHelpDescription => 'Wenn Sie Probleme mit der App haben, wenden Sie sich bitte an unser Support-Team. Wir sind 24/7 für Sie da und sorgen dafür, dass Ihre Erfahrung reibungslos und unkompliziert verläuft.';

  @override
  String get helpNSupportScreenContactUsTitle => 'Kontaktieren Sie uns';

  @override
  String get helpNSupportScreenContactUsDescription => 'Sie können unser Support-Team jederzeit per E-Mail, Telefon oder Live-Chat erreichen. Wir sind bestrebt, Ihre Probleme umgehend zu lösen.';

  @override
  String get helpNSupportScreenEmail => '📧 E-Mail: support@hotelapp.com';

  @override
  String get helpNSupportScreenPhone => '📞 Telefon: +92 300 1234567';

  @override
  String get helpNSupportScreenChat => '💬 Live-Chat: Rund um die Uhr in der App verfügbar';

  @override
  String get helpNSupportScreenAdditionalTipsTitle => 'Zusätzliche Tipps';

  @override
  String get helpNSupportScreenAdditionalTips => '• Halten Sie Ihre App immer auf dem neuesten Stand.\n• Leeren Sie regelmäßig den Cache, um App-Verlangsamungen zu vermeiden.\n• Stellen Sie sicher, dass Sie eine stabile Internetverbindung haben.\n• Melden Sie sofort alle Fehler oder Probleme, damit wir sie beheben können.';

  @override
  String get aboutAppScreenScreenTitle => 'Über die App';

  @override
  String get aboutAppScreenAppName => 'Hotelreinigungsservice App';

  @override
  String get aboutAppScreenDescription => 'Willkommen bei unserer Hotelreinigungsservice-App! Diese Anwendung wurde entwickelt, um den Hotelbetrieb zu optimieren und die Gästezufriedenheit zu verbessern. Das Personal kann Reinigungspläne, Wäscheanforderungen und andere Dienstleistungen effizient verwalten, während Gäste bequem direkt von ihren Zimmern oder über ihre mobilen Geräte Dienstleistungen anfordern können.';

  @override
  String get aboutAppScreenFeaturesTitle => 'Hauptfunktionen';

  @override
  String get aboutAppScreenFeature0Title => 'Zimmerreinigungsanfragen';

  @override
  String get aboutAppScreenFeature0Description => 'Gäste können die Zimmerreinigung zu ihren bevorzugten Zeiten anfordern.';

  @override
  String get aboutAppScreenFeature1Title => 'Wäscheservice';

  @override
  String get aboutAppScreenFeature1Description => 'Wäscheabholung und -lieferung direkt über die App anfordern.';

  @override
  String get aboutAppScreenFeature2Title => 'Aufgabenverwaltung für Mitarbeiter';

  @override
  String get aboutAppScreenFeature2Description => 'Mitarbeiter können zugewiesene Aufgaben effizient verwalten und verfolgen.';

  @override
  String get aboutAppScreenFeature3Title => 'Benachrichtigungen';

  @override
  String get aboutAppScreenFeature3Description => 'Rechtzeitige Benachrichtigungen zu Service-Updates und Zeitplänen erhalten.';

  @override
  String get aboutAppScreenFeature4Title => 'Mehrsprachige Unterstützung';

  @override
  String get aboutAppScreenFeature4Description => 'Unterstützt mehrere Sprachen für unterschiedliche Benutzer.';

  @override
  String get aboutAppScreenVersion => 'Version 1.0.0';

  @override
  String get aboutAppScreenDevelopedBy => 'Entwickelt mit ❤️ zur Verbesserung der Hotelexpizienz und Gästeerfahrung.';

  @override
  String get termsNConditionsScreenTitle => 'Allgemeine Geschäftsbedingungen';

  @override
  String get termsNConditionsIntro => 'Willkommen in unserer App! Bitte lesen Sie diese Allgemeinen Geschäftsbedingungen sorgfältig durch, bevor Sie unsere Dienste nutzen. Durch den Zugriff auf oder die Nutzung unserer App erklären Sie sich mit diesen Bedingungen einverstanden. Wenn Sie mit einem Teil dieser Bedingungen nicht einverstanden sind, verwenden Sie unsere App bitte nicht.';

  @override
  String get termsNConditionsSection1Title => '1. Nutzung des Dienstes';

  @override
  String get termsNConditionsSection1Content => 'Sie stimmen zu, die App nur für rechtmäßige Zwecke zu nutzen und in einer Weise, die die Rechte anderer nicht verletzt. Sie dürfen die App nicht für betrügerische oder schädliche Aktivitäten verwenden, einschließlich, aber nicht beschränkt auf Hacking, Spamming oder die Verbreitung von schädlichen Inhalten.';

  @override
  String get termsNConditionsSection2Title => '2. Kontoverantwortung';

  @override
  String get termsNConditionsSection2Content => 'Sie sind dafür verantwortlich, die Vertraulichkeit Ihrer Kontoinformationen und Ihres Passworts zu wahren. Sie erklären sich damit einverstanden, uns unverzüglich über jede unbefugte Nutzung Ihres Kontos oder jede andere Sicherheitsverletzung zu informieren.';

  @override
  String get termsNConditionsSection3Title => '3. Datenschutz';

  @override
  String get termsNConditionsSection3Content => 'Wir respektieren Ihre Privatsphäre. Alle erhobenen personenbezogenen Daten werden gemäß unserer Datenschutzrichtlinie behandelt. Durch die Nutzung der App stimmen Sie der Erfassung, Nutzung und Weitergabe Ihrer Daten gemäß der Datenschutzrichtlinie zu.';

  @override
  String get termsNConditionsSection4Title => '4. Geistiges Eigentum';

  @override
  String get termsNConditionsSection4Content => 'Alle Inhalte, Funktionen und Merkmale der App sind geistiges Eigentum des Unternehmens und durch Urheberrechte, Markenrechte und andere Gesetze geschützt. Sie dürfen diese ohne unsere ausdrückliche schriftliche Genehmigung nicht vervielfältigen, verbreiten oder abgeleitete Werke erstellen.';

  @override
  String get termsNConditionsSection5Title => '5. Haftungsbeschränkung';

  @override
  String get termsNConditionsSection5Content => 'Wir sind nicht verantwortlich für Schäden, Verluste oder Kosten, die sich aus der Nutzung oder der Unmöglichkeit der Nutzung unserer App ergeben. Die App wird ohne jegliche ausdrückliche oder stillschweigende Gewährleistungen \'wie besehen\' bereitgestellt.';

  @override
  String get termsNConditionsSection6Title => '6. Kündigung';

  @override
  String get termsNConditionsSection6Content => 'Wir können Ihren Zugriff auf die App nach eigenem Ermessen ohne Vorankündigung oder Haftung aussetzen oder beenden, wenn Ihr Verhalten gegen diese Bedingungen verstößt oder der App, anderen Nutzern oder Dritten schadet.';

  @override
  String get termsNConditionsSection7Title => '7. Änderungen der Bedingungen';

  @override
  String get termsNConditionsSection7Content => 'Wir behalten uns das Recht vor, diese Bedingungen jederzeit zu ändern. Die fortgesetzte Nutzung der App gilt als Zustimmung zu den aktualisierten Bedingungen. Wir empfehlen, die Bedingungen regelmäßig zu überprüfen, um über Änderungen informiert zu bleiben.';

  @override
  String get termsNConditionsAcceptButton => 'Akzeptieren';

  @override
  String get privacyPolicyScreenTitle => 'Datenschutzrichtlinie';

  @override
  String get privacyPolicyScreenData => '1. Einführung\nWir legen großen Wert auf Ihre Privatsphäre und verpflichten uns, Ihre persönlichen Daten zu schützen. Diese Datenschutzrichtlinie erklärt, wie wir Ihre Daten erfassen, verwenden und schützen, wenn Sie unsere Dienste nutzen.\n\n2. Datenerhebung\nWir können Informationen wie Ihren Namen, Ihre E-Mail-Adresse, Nutzungsdaten und Geräteinformationen erfassen, um unsere Dienste zu verbessern und personalisierte Erlebnisse zu bieten.\n\n3. Verwendung der Informationen\nIhre Daten können verwendet werden, um:\n- Unsere Dienste bereitzustellen und zu verbessern\n- Mit Ihnen zu kommunizieren\n- Ihr Erlebnis zu personalisieren\n- Gesetzlichen Verpflichtungen nachzukommen\n\n4. Datenweitergabe\nWir verkaufen Ihre persönlichen Daten nicht. Wir können Daten jedoch weitergeben an:\n- Dienstleister\n- Gesetzliche Behörden, wenn dies gesetzlich vorgeschrieben ist\n- Geschäftspartner für begrenzte Zwecke\n\n5. Sicherheit\nWir implementieren geeignete technische und organisatorische Maßnahmen, um Ihre Daten vor unbefugtem Zugriff, Verlust oder Missbrauch zu schützen.\n\n6. Cookies & Tracking\nWir verwenden Cookies und ähnliche Technologien, um das Benutzererlebnis zu verbessern, Trends zu analysieren und die Nutzung der Website zu überwachen.\n\n7. Rechte der Nutzer\nSie haben das Recht:\n- Auf Ihre Daten zuzugreifen und eine Kopie anzufordern\n- Unrichtige Informationen zu berichtigen\n- Die Löschung Ihrer persönlichen Daten zu verlangen\n- Ihre Einwilligung zurückzuziehen, soweit anwendbar\n\n8. Änderungen der Richtlinie\nWir können diese Datenschutzrichtlinie von Zeit zu Zeit aktualisieren. Änderungen werden über die App oder die Website kommuniziert.\n\n9. Kontaktieren Sie uns\nWenn Sie Fragen oder Bedenken zu dieser Datenschutzrichtlinie haben, kontaktieren Sie uns bitte unter privacy@example.com.\n\nVielen Dank, dass Sie unseren Diensten vertrauen!';

  @override
  String get privacyPolicyScreenAcceptButton => 'Akzeptieren';

  @override
  String get appPermissionsScreenTitle => 'App-Berechtigungen';

  @override
  String get appPermissionsScreenNotifications => 'Benachrichtigungen';

  @override
  String get appPermissionsScreenCamera => 'Kamera';

  @override
  String get appPermissionsScreenLocation => 'Standort';

  @override
  String get appPermissionsScreenMicrophone => 'Mikrofon';

  @override
  String get appPermissionsScreenContacts => 'Kontakte';

  @override
  String get appPermissionsScreenStorage => 'Speicher';

  @override
  String get profileScreenScreenTitle => 'Profil';

  @override
  String get profileScreenJoinedDatePrefix => 'Beigetreten am:';

  @override
  String get profileScreenLogoutButton => 'Abmelden';

  @override
  String get profileScreenRoleLabel => 'Angestellte';

  @override
  String get salaryScreenScreenTitle => 'Gehaltsdetails';

  @override
  String get salaryScreenTotalDays => 'Gesamttage';

  @override
  String get salaryScreenLeavesTaken => 'Genommene Urlaubstage';

  @override
  String get salaryScreenBasicSalary => 'Grundgehalt';

  @override
  String get salaryScreenDeductions => 'Abzüge';

  @override
  String get salaryScreenNetSalary => 'Nettogehalt';

  @override
  String get salaryScreenReason => 'Begründung';

  @override
  String get salaryScreenCurrencySymbol => '€';

  @override
  String get hotelRoomScreenRoomsToClean => 'Zimmer zum Reinigen';

  @override
  String get appBarWidgetCheckout => 'Auschecken';

  @override
  String get appBarWidgetCheckin => 'Einchecken';

  @override
  String get checkinPopupConfirmationMessage => 'Sind Sie sicher, dass Sie einchecken möchten?';

  @override
  String get checkinPopupYes => 'Ja';

  @override
  String get checkinPopupNo => 'Nein';

  @override
  String get checkoutPopupConfirmationMessage => 'Sind Sie sicher, dass Sie auschecken möchten?';

  @override
  String get checkoutPopupYes => 'Ja';

  @override
  String get checkoutPopupNo => 'Nein';

  @override
  String get greetCardHotelsAssigned => 'Zugewiesene Hotels';

  @override
  String get greetCardCompleteHotels => 'Abgeschlossene Hotels';

  @override
  String get greetCardPendingHotels => 'Ausstehende Hotels';

  @override
  String get sidebarOptionsAccountSection => 'Konto';

  @override
  String get sidebarOptionsProfile => 'Profil';

  @override
  String get sidebarOptionsSalary => 'Gehalt';

  @override
  String get sidebarOptionsInformationSection => 'Informationen';

  @override
  String get sidebarOptionsAboutApp => 'Über die App';

  @override
  String get sidebarOptionsTermsAndConditions => 'Allgemeine Geschäftsbedingungen';

  @override
  String get sidebarOptionsPrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get sidebarOptionsPermissions => 'Berechtigungen';

  @override
  String get sidebarOptionsLogout => 'Abmelden';
}
