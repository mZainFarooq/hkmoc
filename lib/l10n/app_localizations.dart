import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('ur')
  ];

  /// No description provided for @loginScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginScreenScreenTitle;

  /// No description provided for @loginScreenWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome back 👋'**
  String get loginScreenWelcome;

  /// No description provided for @loginScreenLoginDesc.
  ///
  /// In en, this message translates to:
  /// **'Login to your account to manage your cleaning jobs.'**
  String get loginScreenLoginDesc;

  /// No description provided for @loginScreenEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginScreenEmailLabel;

  /// No description provided for @loginScreenPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginScreenPasswordLabel;

  /// No description provided for @loginScreenForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password ?'**
  String get loginScreenForgotPassword;

  /// No description provided for @loginScreenResetMethodTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Password Reset Method'**
  String get loginScreenResetMethodTitle;

  /// No description provided for @loginScreenResetMethodDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose how you want to reset your password. You can do it yourself or ask an admin to change.'**
  String get loginScreenResetMethodDescription;

  /// No description provided for @loginScreenResetMyself.
  ///
  /// In en, this message translates to:
  /// **'Reset Myself'**
  String get loginScreenResetMyself;

  /// No description provided for @loginScreenResetByAdmin.
  ///
  /// In en, this message translates to:
  /// **'You want to change by Admin?'**
  String get loginScreenResetByAdmin;

  /// No description provided for @loginScreenLoginButton.
  ///
  /// In en, this message translates to:
  /// **'Login & Start Work'**
  String get loginScreenLoginButton;

  /// No description provided for @dashboardScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardScreenScreenTitle;

  /// No description provided for @dashboardScreenGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get dashboardScreenGreeting;

  /// No description provided for @dashboardScreenAssignedHotels.
  ///
  /// In en, this message translates to:
  /// **'Assigned Hotels'**
  String get dashboardScreenAssignedHotels;

  /// No description provided for @dashboardScreenNoHotelsAssigned.
  ///
  /// In en, this message translates to:
  /// **'No hotels assigned!'**
  String get dashboardScreenNoHotelsAssigned;

  /// No description provided for @dashboardScreenSeeDetails.
  ///
  /// In en, this message translates to:
  /// **'See Details'**
  String get dashboardScreenSeeDetails;

  /// No description provided for @dashboardScreenCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Check In'**
  String get dashboardScreenCheckIn;

  /// No description provided for @historyScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyScreenScreenTitle;

  /// No description provided for @historyScreenSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search hotels by name'**
  String get historyScreenSearchPlaceholder;

  /// No description provided for @historyScreenFilterByDate.
  ///
  /// In en, this message translates to:
  /// **'Filter by date'**
  String get historyScreenFilterByDate;

  /// No description provided for @historyScreenTodayCompleted.
  ///
  /// In en, this message translates to:
  /// **'Today Completed'**
  String get historyScreenTodayCompleted;

  /// No description provided for @historyScreenFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get historyScreenFrom;

  /// No description provided for @historyScreenTo.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get historyScreenTo;

  /// No description provided for @historyScreenNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get historyScreenNoResults;

  /// No description provided for @historyScreenCompletedRooms.
  ///
  /// In en, this message translates to:
  /// **'Completed {completed} of {total} rooms'**
  String historyScreenCompletedRooms(Object completed, Object total);

  /// No description provided for @settingScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingScreenScreenTitle;

  /// No description provided for @settingScreenAccountSection.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingScreenAccountSection;

  /// No description provided for @settingScreenPreferencesSection.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get settingScreenPreferencesSection;

  /// No description provided for @settingScreenEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get settingScreenEditProfile;

  /// No description provided for @settingScreenNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingScreenNotifications;

  /// No description provided for @settingScreenSickLeave.
  ///
  /// In en, this message translates to:
  /// **'Sick Leave'**
  String get settingScreenSickLeave;

  /// No description provided for @settingScreenHelpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get settingScreenHelpSupport;

  /// No description provided for @settingScreenAboutApp.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get settingScreenAboutApp;

  /// No description provided for @editProfileScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfileScreenScreenTitle;

  /// No description provided for @editProfileScreenLabelsFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get editProfileScreenLabelsFirstName;

  /// No description provided for @editProfileScreenLabelsLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get editProfileScreenLabelsLastName;

  /// No description provided for @editProfileScreenLabelsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get editProfileScreenLabelsEmail;

  /// No description provided for @editProfileScreenLabelsPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get editProfileScreenLabelsPhoneNumber;

  /// No description provided for @editProfileScreenLabelsAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get editProfileScreenLabelsAddress;

  /// No description provided for @editProfileScreenHintsFirstName.
  ///
  /// In en, this message translates to:
  /// **'Junaid'**
  String get editProfileScreenHintsFirstName;

  /// No description provided for @editProfileScreenHintsLastName.
  ///
  /// In en, this message translates to:
  /// **'Ahmad'**
  String get editProfileScreenHintsLastName;

  /// No description provided for @editProfileScreenHintsEmail.
  ///
  /// In en, this message translates to:
  /// **'ahmadjunaid791@gmail.com'**
  String get editProfileScreenHintsEmail;

  /// No description provided for @editProfileScreenHintsPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'+92 3023434506'**
  String get editProfileScreenHintsPhoneNumber;

  /// No description provided for @editProfileScreenHintsAddress.
  ///
  /// In en, this message translates to:
  /// **'5 Maple Avenue, Richmond, London, TW10 6JR, UK'**
  String get editProfileScreenHintsAddress;

  /// No description provided for @editProfileScreenButton.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get editProfileScreenButton;

  /// No description provided for @languagePopupTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get languagePopupTitle;

  /// No description provided for @languagePopupButtonsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get languagePopupButtonsCancel;

  /// No description provided for @languagePopupButtonsSelect.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get languagePopupButtonsSelect;

  /// No description provided for @bottomNavigatorDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get bottomNavigatorDashboard;

  /// No description provided for @bottomNavigatorHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get bottomNavigatorHistory;

  /// No description provided for @bottomNavigatorSetting.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get bottomNavigatorSetting;

  /// No description provided for @notificationScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationScreenScreenTitle;

  /// No description provided for @leaveScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Sick Leave'**
  String get leaveScreenScreenTitle;

  /// No description provided for @leaveScreenTabsApply.
  ///
  /// In en, this message translates to:
  /// **'Apply Leave'**
  String get leaveScreenTabsApply;

  /// No description provided for @leaveScreenTabsHistory.
  ///
  /// In en, this message translates to:
  /// **'Leave History'**
  String get leaveScreenTabsHistory;

  /// No description provided for @leaveScreenFormApplyTitle.
  ///
  /// In en, this message translates to:
  /// **'Apply for Sick Leave'**
  String get leaveScreenFormApplyTitle;

  /// No description provided for @leaveScreenFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get leaveScreenFormTitle;

  /// No description provided for @leaveScreenFormFromDate.
  ///
  /// In en, this message translates to:
  /// **'From Date'**
  String get leaveScreenFormFromDate;

  /// No description provided for @leaveScreenFormToDate.
  ///
  /// In en, this message translates to:
  /// **'To Date'**
  String get leaveScreenFormToDate;

  /// No description provided for @leaveScreenFormDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get leaveScreenFormDetails;

  /// No description provided for @leaveScreenFormSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit Leave'**
  String get leaveScreenFormSubmit;

  /// No description provided for @leaveScreenHistoryStatusApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get leaveScreenHistoryStatusApproved;

  /// No description provided for @leaveScreenHistoryStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get leaveScreenHistoryStatusCancelled;

  /// No description provided for @helpNSupportScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpNSupportScreenScreenTitle;

  /// No description provided for @helpNSupportScreenNeedHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Need Help?'**
  String get helpNSupportScreenNeedHelpTitle;

  /// No description provided for @helpNSupportScreenNeedHelpDescription.
  ///
  /// In en, this message translates to:
  /// **'If you are facing any issues with the app, please contact our support team. We are here to help you 24/7 and ensure your experience is smooth and hassle-free.'**
  String get helpNSupportScreenNeedHelpDescription;

  /// No description provided for @helpNSupportScreenContactUsTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get helpNSupportScreenContactUsTitle;

  /// No description provided for @helpNSupportScreenContactUsDescription.
  ///
  /// In en, this message translates to:
  /// **'You can reach out to our support team anytime via email, phone, or live chat. We are committed to resolving your issues promptly.'**
  String get helpNSupportScreenContactUsDescription;

  /// No description provided for @helpNSupportScreenEmail.
  ///
  /// In en, this message translates to:
  /// **'📧 Email: support@hotelapp.com'**
  String get helpNSupportScreenEmail;

  /// No description provided for @helpNSupportScreenPhone.
  ///
  /// In en, this message translates to:
  /// **'📞 Phone: +92 300 1234567'**
  String get helpNSupportScreenPhone;

  /// No description provided for @helpNSupportScreenChat.
  ///
  /// In en, this message translates to:
  /// **'💬 Live Chat: Available 24/7 in the app'**
  String get helpNSupportScreenChat;

  /// No description provided for @helpNSupportScreenAdditionalTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Additional Tips'**
  String get helpNSupportScreenAdditionalTipsTitle;

  /// No description provided for @helpNSupportScreenAdditionalTips.
  ///
  /// In en, this message translates to:
  /// **'• Always keep your app updated to the latest version.\n• Clear cache regularly to avoid app slowdowns.\n• Make sure you have a stable internet connection.\n• Report any bugs or issues immediately so we can fix them.'**
  String get helpNSupportScreenAdditionalTips;

  /// No description provided for @aboutAppScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutAppScreenScreenTitle;

  /// No description provided for @aboutAppScreenAppName.
  ///
  /// In en, this message translates to:
  /// **'Hotel Cleaning Service App'**
  String get aboutAppScreenAppName;

  /// No description provided for @aboutAppScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome to our Hotel Cleaning Service App! ...'**
  String get aboutAppScreenDescription;

  /// No description provided for @aboutAppScreenFeaturesTitle.
  ///
  /// In en, this message translates to:
  /// **'Key Features'**
  String get aboutAppScreenFeaturesTitle;

  /// No description provided for @aboutAppScreenFeature0Title.
  ///
  /// In en, this message translates to:
  /// **'Room Cleaning Requests'**
  String get aboutAppScreenFeature0Title;

  /// No description provided for @aboutAppScreenFeature0Description.
  ///
  /// In en, this message translates to:
  /// **'Guests can request room cleaning at their preferred time slots.'**
  String get aboutAppScreenFeature0Description;

  /// No description provided for @aboutAppScreenFeature1Title.
  ///
  /// In en, this message translates to:
  /// **'Laundry Services'**
  String get aboutAppScreenFeature1Title;

  /// No description provided for @aboutAppScreenFeature1Description.
  ///
  /// In en, this message translates to:
  /// **'Request laundry collection and delivery directly through the app.'**
  String get aboutAppScreenFeature1Description;

  /// No description provided for @aboutAppScreenFeature2Title.
  ///
  /// In en, this message translates to:
  /// **'Staff Task Management'**
  String get aboutAppScreenFeature2Title;

  /// No description provided for @aboutAppScreenFeature2Description.
  ///
  /// In en, this message translates to:
  /// **'Staff can manage and track assigned tasks efficiently.'**
  String get aboutAppScreenFeature2Description;

  /// No description provided for @aboutAppScreenFeature3Title.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get aboutAppScreenFeature3Title;

  /// No description provided for @aboutAppScreenFeature3Description.
  ///
  /// In en, this message translates to:
  /// **'Receive timely notifications for service updates and schedules.'**
  String get aboutAppScreenFeature3Description;

  /// No description provided for @aboutAppScreenFeature4Title.
  ///
  /// In en, this message translates to:
  /// **'Multi-Language Support'**
  String get aboutAppScreenFeature4Title;

  /// No description provided for @aboutAppScreenFeature4Description.
  ///
  /// In en, this message translates to:
  /// **'Supports multiple languages for diverse users.'**
  String get aboutAppScreenFeature4Description;

  /// No description provided for @aboutAppScreenVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get aboutAppScreenVersion;

  /// No description provided for @aboutAppScreenDevelopedBy.
  ///
  /// In en, this message translates to:
  /// **'Developed with ❤️...'**
  String get aboutAppScreenDevelopedBy;

  /// No description provided for @termsNConditionsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsNConditionsScreenTitle;

  /// No description provided for @termsNConditionsIntro.
  ///
  /// In en, this message translates to:
  /// **'Welcome to our app! Please read these Terms and Conditions carefully before using our services. By accessing or using our app, you agree to be bound by these terms. If you do not agree with any part of these terms, please do not use our app.'**
  String get termsNConditionsIntro;

  /// No description provided for @termsNConditionsSection1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Use of Service'**
  String get termsNConditionsSection1Title;

  /// No description provided for @termsNConditionsSection1Content.
  ///
  /// In en, this message translates to:
  /// **'You agree to use the app only for lawful purposes and in a way that does not infringe the rights of others. You must not use the app for any fraudulent or harmful activity, including but not limited to hacking, spamming, or distributing malicious content.'**
  String get termsNConditionsSection1Content;

  /// No description provided for @termsNConditionsSection2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Account Responsibility'**
  String get termsNConditionsSection2Title;

  /// No description provided for @termsNConditionsSection2Content.
  ///
  /// In en, this message translates to:
  /// **'You are responsible for maintaining the confidentiality of your account information and password. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.'**
  String get termsNConditionsSection2Content;

  /// No description provided for @termsNConditionsSection3Title.
  ///
  /// In en, this message translates to:
  /// **'3. Privacy'**
  String get termsNConditionsSection3Title;

  /// No description provided for @termsNConditionsSection3Content.
  ///
  /// In en, this message translates to:
  /// **'We respect your privacy. All personal information collected will be handled according to our privacy policy. By using the app, you consent to the collection, use, and sharing of your information as described in the privacy policy.'**
  String get termsNConditionsSection3Content;

  /// No description provided for @termsNConditionsSection4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Intellectual Property'**
  String get termsNConditionsSection4Title;

  /// No description provided for @termsNConditionsSection4Content.
  ///
  /// In en, this message translates to:
  /// **'All content, features, and functionality on the app are the intellectual property of the company and are protected by copyright, trademark, and other laws. You may not reproduce, distribute, or create derivative works without our express written permission.'**
  String get termsNConditionsSection4Content;

  /// No description provided for @termsNConditionsSection5Title.
  ///
  /// In en, this message translates to:
  /// **'5. Limitation of Liability'**
  String get termsNConditionsSection5Title;

  /// No description provided for @termsNConditionsSection5Content.
  ///
  /// In en, this message translates to:
  /// **'We are not responsible for any damages, losses, or costs arising from the use or inability to use our app. The app is provided on an \'as-is\' basis without warranties of any kind, either express or implied.'**
  String get termsNConditionsSection5Content;

  /// No description provided for @termsNConditionsSection6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Termination'**
  String get termsNConditionsSection6Title;

  /// No description provided for @termsNConditionsSection6Content.
  ///
  /// In en, this message translates to:
  /// **'We may suspend or terminate your access to the app at our sole discretion, without notice or liability, for conduct that violates these terms or is harmful to the app, other users, or third parties.'**
  String get termsNConditionsSection6Content;

  /// No description provided for @termsNConditionsSection7Title.
  ///
  /// In en, this message translates to:
  /// **'7. Changes to Terms'**
  String get termsNConditionsSection7Title;

  /// No description provided for @termsNConditionsSection7Content.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right to modify these terms at any time. Continued use of the app constitutes acceptance of the updated terms. We recommend reviewing the terms regularly to stay informed about any changes.'**
  String get termsNConditionsSection7Content;

  /// No description provided for @termsNConditionsAcceptButton.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get termsNConditionsAcceptButton;

  /// No description provided for @privacyPolicyScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyScreenTitle;

  /// No description provided for @privacyPolicyScreenData.
  ///
  /// In en, this message translates to:
  /// **'1. Introduction\nWe value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data when you use our services.\n\n2. Information Collection\nWe may collect information such as your name, email address, usage data, and device information to improve our services and provide personalized experiences.\n\n3. Use of Information\nYour data may be used to:\n- Provide and improve our services\n- Communicate with you\n- Personalize your experience\n- Comply with legal obligations\n\n4. Data Sharing\nWe do not sell your personal information. However, we may share data with:\n- Service providers\n- Legal authorities if required by law\n- Business partners for limited purposes\n\n5. Security\nWe implement appropriate technical and organizational measures to protect your data from unauthorized access, loss, or misuse.\n\n6. Cookies & Tracking\nWe use cookies and similar technologies to enhance user experience, analyze trends, and monitor site usage.\n\n7. User Rights\nYou have the right to:\n- Access and request a copy of your data\n- Rectify inaccurate information\n- Request deletion of your personal data\n- Withdraw consent where applicable\n\n8. Changes to Policy\nWe may update this Privacy Policy from time to time. Any changes will be communicated through the app or website.\n\n9. Contact Us\nIf you have any questions or concerns regarding this Privacy Policy, please contact us at privacy@example.com.\n\nThank you for trusting our services!'**
  String get privacyPolicyScreenData;

  /// No description provided for @privacyPolicyScreenAcceptButton.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get privacyPolicyScreenAcceptButton;

  /// No description provided for @appPermissionsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'App Permissions'**
  String get appPermissionsScreenTitle;

  /// No description provided for @appPermissionsScreenNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get appPermissionsScreenNotifications;

  /// No description provided for @appPermissionsScreenCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get appPermissionsScreenCamera;

  /// No description provided for @appPermissionsScreenLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get appPermissionsScreenLocation;

  /// No description provided for @appPermissionsScreenMicrophone.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get appPermissionsScreenMicrophone;

  /// No description provided for @appPermissionsScreenContacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get appPermissionsScreenContacts;

  /// No description provided for @appPermissionsScreenStorage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get appPermissionsScreenStorage;

  /// No description provided for @profileScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileScreenScreenTitle;

  /// No description provided for @profileScreenJoinedDatePrefix.
  ///
  /// In en, this message translates to:
  /// **'Joined:'**
  String get profileScreenJoinedDatePrefix;

  /// No description provided for @profileScreenLogoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileScreenLogoutButton;

  /// No description provided for @profileScreenRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Employ'**
  String get profileScreenRoleLabel;

  /// No description provided for @salaryScreenScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Salary Details'**
  String get salaryScreenScreenTitle;

  /// No description provided for @salaryScreenTotalDays.
  ///
  /// In en, this message translates to:
  /// **'Total Days'**
  String get salaryScreenTotalDays;

  /// No description provided for @salaryScreenLeavesTaken.
  ///
  /// In en, this message translates to:
  /// **'Leaves Taken'**
  String get salaryScreenLeavesTaken;

  /// No description provided for @salaryScreenBasicSalary.
  ///
  /// In en, this message translates to:
  /// **'Basic Salary'**
  String get salaryScreenBasicSalary;

  /// No description provided for @salaryScreenDeductions.
  ///
  /// In en, this message translates to:
  /// **'Deductions'**
  String get salaryScreenDeductions;

  /// No description provided for @salaryScreenNetSalary.
  ///
  /// In en, this message translates to:
  /// **'Net Salary'**
  String get salaryScreenNetSalary;

  /// No description provided for @salaryScreenReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get salaryScreenReason;

  /// No description provided for @salaryScreenCurrencySymbol.
  ///
  /// In en, this message translates to:
  /// **'\$'**
  String get salaryScreenCurrencySymbol;

  /// No description provided for @hotelRoomScreenRoomsToClean.
  ///
  /// In en, this message translates to:
  /// **'Rooms to clean'**
  String get hotelRoomScreenRoomsToClean;

  /// No description provided for @appBarWidgetCheckout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get appBarWidgetCheckout;

  /// No description provided for @appBarWidgetCheckin.
  ///
  /// In en, this message translates to:
  /// **'Checkin'**
  String get appBarWidgetCheckin;

  /// No description provided for @checkinPopupConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to check in?'**
  String get checkinPopupConfirmationMessage;

  /// No description provided for @checkinPopupYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get checkinPopupYes;

  /// No description provided for @checkinPopupNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get checkinPopupNo;

  /// No description provided for @checkoutPopupConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to check out?'**
  String get checkoutPopupConfirmationMessage;

  /// No description provided for @checkoutPopupYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get checkoutPopupYes;

  /// No description provided for @checkoutPopupNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get checkoutPopupNo;

  /// No description provided for @greetCardHotelsAssigned.
  ///
  /// In en, this message translates to:
  /// **'Hotels Assigned'**
  String get greetCardHotelsAssigned;

  /// No description provided for @greetCardCompleteHotels.
  ///
  /// In en, this message translates to:
  /// **'Complete Hotels'**
  String get greetCardCompleteHotels;

  /// No description provided for @greetCardPendingHotels.
  ///
  /// In en, this message translates to:
  /// **'Pending Hotels'**
  String get greetCardPendingHotels;

  /// No description provided for @sidebarOptionsAccountSection.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get sidebarOptionsAccountSection;

  /// No description provided for @sidebarOptionsProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get sidebarOptionsProfile;

  /// No description provided for @sidebarOptionsSalary.
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get sidebarOptionsSalary;

  /// No description provided for @sidebarOptionsInformationSection.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get sidebarOptionsInformationSection;

  /// No description provided for @sidebarOptionsAboutApp.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get sidebarOptionsAboutApp;

  /// No description provided for @sidebarOptionsTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get sidebarOptionsTermsAndConditions;

  /// No description provided for @sidebarOptionsPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get sidebarOptionsPrivacyPolicy;

  /// No description provided for @sidebarOptionsPermissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get sidebarOptionsPermissions;

  /// No description provided for @sidebarOptionsLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get sidebarOptionsLogout;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'ur': return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
