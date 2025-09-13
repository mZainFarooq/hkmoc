// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginScreenScreenTitle => 'Login';

  @override
  String get loginScreenWelcome => 'Welcome back 👋';

  @override
  String get loginScreenLoginDesc => 'Login to your account to manage your cleaning jobs.';

  @override
  String get loginScreenEmailLabel => 'Email';

  @override
  String get loginScreenPasswordLabel => 'Password';

  @override
  String get loginScreenForgotPassword => 'Forgot your password ?';

  @override
  String get loginScreenResetMethodTitle => 'Select Password Reset Method';

  @override
  String get loginScreenResetMethodDescription => 'Choose how you want to reset your password. You can do it yourself or ask an admin to change.';

  @override
  String get loginScreenResetMyself => 'Reset Myself';

  @override
  String get loginScreenResetByAdmin => 'You want to change by Admin?';

  @override
  String get loginScreenLoginButton => 'Login & Start Work';

  @override
  String get dashboardScreenScreenTitle => 'Dashboard';

  @override
  String get dashboardScreenGreeting => 'Hello';

  @override
  String get dashboardScreenAssignedHotels => 'Assigned Hotels';

  @override
  String get dashboardScreenNoHotelsAssigned => 'No hotels assigned!';

  @override
  String get dashboardScreenSeeDetails => 'See Details';

  @override
  String get dashboardScreenCheckIn => 'Check In';

  @override
  String get historyScreenScreenTitle => 'History';

  @override
  String get historyScreenSearchPlaceholder => 'Search hotels by name';

  @override
  String get historyScreenFilterByDate => 'Filter by date';

  @override
  String get historyScreenTodayCompleted => 'Today Completed';

  @override
  String get historyScreenFrom => 'From';

  @override
  String get historyScreenTo => 'To';

  @override
  String get historyScreenNoResults => 'No results found';

  @override
  String historyScreenCompletedRooms(Object completed, Object total) {
    return 'Completed $completed of $total rooms';
  }

  @override
  String get settingScreenScreenTitle => 'Settings';

  @override
  String get settingScreenAccountSection => 'Account';

  @override
  String get settingScreenPreferencesSection => 'Preferences';

  @override
  String get settingScreenEditProfile => 'Edit Profile';

  @override
  String get settingScreenNotifications => 'Notifications';

  @override
  String get settingScreenSickLeave => 'Sick Leave';

  @override
  String get settingScreenHelpSupport => 'Help & Support';

  @override
  String get settingScreenAboutApp => 'About App';

  @override
  String get editProfileScreenScreenTitle => 'Edit Profile';

  @override
  String get editProfileScreenLabelsFirstName => 'First Name';

  @override
  String get editProfileScreenLabelsLastName => 'Last Name';

  @override
  String get editProfileScreenLabelsEmail => 'Email';

  @override
  String get editProfileScreenLabelsPhoneNumber => 'Phone Number';

  @override
  String get editProfileScreenLabelsAddress => 'Address';

  @override
  String get editProfileScreenHintsFirstName => 'Junaid';

  @override
  String get editProfileScreenHintsLastName => 'Ahmad';

  @override
  String get editProfileScreenHintsEmail => 'ahmadjunaid791@gmail.com';

  @override
  String get editProfileScreenHintsPhoneNumber => '+92 3023434506';

  @override
  String get editProfileScreenHintsAddress => '5 Maple Avenue, Richmond, London, TW10 6JR, UK';

  @override
  String get editProfileScreenButton => 'Update';

  @override
  String get languagePopupTitle => 'Select Language';

  @override
  String get languagePopupButtonsCancel => 'Cancel';

  @override
  String get languagePopupButtonsSelect => 'Select';

  @override
  String get bottomNavigatorDashboard => 'Dashboard';

  @override
  String get bottomNavigatorHistory => 'History';

  @override
  String get bottomNavigatorSetting => 'Settings';

  @override
  String get notificationScreenScreenTitle => 'Notifications';

  @override
  String get leaveScreenScreenTitle => 'Sick Leave';

  @override
  String get leaveScreenTabsApply => 'Apply Leave';

  @override
  String get leaveScreenTabsHistory => 'Leave History';

  @override
  String get leaveScreenFormApplyTitle => 'Apply for Sick Leave';

  @override
  String get leaveScreenFormTitle => 'Title';

  @override
  String get leaveScreenFormFromDate => 'From Date';

  @override
  String get leaveScreenFormToDate => 'To Date';

  @override
  String get leaveScreenFormDetails => 'Details';

  @override
  String get leaveScreenFormSubmit => 'Submit Leave';

  @override
  String get leaveScreenHistoryStatusApproved => 'Approved';

  @override
  String get leaveScreenHistoryStatusCancelled => 'Cancelled';

  @override
  String get helpNSupportScreenScreenTitle => 'Help & Support';

  @override
  String get helpNSupportScreenNeedHelpTitle => 'Need Help?';

  @override
  String get helpNSupportScreenNeedHelpDescription => 'If you are facing any issues with the app, please contact our support team. We are here to help you 24/7 and ensure your experience is smooth and hassle-free.';

  @override
  String get helpNSupportScreenContactUsTitle => 'Contact Us';

  @override
  String get helpNSupportScreenContactUsDescription => 'You can reach out to our support team anytime via email, phone, or live chat. We are committed to resolving your issues promptly.';

  @override
  String get helpNSupportScreenEmail => '📧 Email: support@hotelapp.com';

  @override
  String get helpNSupportScreenPhone => '📞 Phone: +92 300 1234567';

  @override
  String get helpNSupportScreenChat => '💬 Live Chat: Available 24/7 in the app';

  @override
  String get helpNSupportScreenAdditionalTipsTitle => 'Additional Tips';

  @override
  String get helpNSupportScreenAdditionalTips => '• Always keep your app updated to the latest version.\n• Clear cache regularly to avoid app slowdowns.\n• Make sure you have a stable internet connection.\n• Report any bugs or issues immediately so we can fix them.';

  @override
  String get aboutAppScreenScreenTitle => 'About App';

  @override
  String get aboutAppScreenAppName => 'Hotel Cleaning Service App';

  @override
  String get aboutAppScreenDescription => 'Welcome to our Hotel Cleaning Service App! ...';

  @override
  String get aboutAppScreenFeaturesTitle => 'Key Features';

  @override
  String get aboutAppScreenFeature0Title => 'Room Cleaning Requests';

  @override
  String get aboutAppScreenFeature0Description => 'Guests can request room cleaning at their preferred time slots.';

  @override
  String get aboutAppScreenFeature1Title => 'Laundry Services';

  @override
  String get aboutAppScreenFeature1Description => 'Request laundry collection and delivery directly through the app.';

  @override
  String get aboutAppScreenFeature2Title => 'Staff Task Management';

  @override
  String get aboutAppScreenFeature2Description => 'Staff can manage and track assigned tasks efficiently.';

  @override
  String get aboutAppScreenFeature3Title => 'Notifications';

  @override
  String get aboutAppScreenFeature3Description => 'Receive timely notifications for service updates and schedules.';

  @override
  String get aboutAppScreenFeature4Title => 'Multi-Language Support';

  @override
  String get aboutAppScreenFeature4Description => 'Supports multiple languages for diverse users.';

  @override
  String get aboutAppScreenVersion => 'Version 1.0.0';

  @override
  String get aboutAppScreenDevelopedBy => 'Developed with ❤️...';

  @override
  String get termsNConditionsScreenTitle => 'Terms & Conditions';

  @override
  String get termsNConditionsIntro => 'Welcome to our app! Please read these Terms and Conditions carefully before using our services. By accessing or using our app, you agree to be bound by these terms. If you do not agree with any part of these terms, please do not use our app.';

  @override
  String get termsNConditionsSection1Title => '1. Use of Service';

  @override
  String get termsNConditionsSection1Content => 'You agree to use the app only for lawful purposes and in a way that does not infringe the rights of others. You must not use the app for any fraudulent or harmful activity, including but not limited to hacking, spamming, or distributing malicious content.';

  @override
  String get termsNConditionsSection2Title => '2. Account Responsibility';

  @override
  String get termsNConditionsSection2Content => 'You are responsible for maintaining the confidentiality of your account information and password. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.';

  @override
  String get termsNConditionsSection3Title => '3. Privacy';

  @override
  String get termsNConditionsSection3Content => 'We respect your privacy. All personal information collected will be handled according to our privacy policy. By using the app, you consent to the collection, use, and sharing of your information as described in the privacy policy.';

  @override
  String get termsNConditionsSection4Title => '4. Intellectual Property';

  @override
  String get termsNConditionsSection4Content => 'All content, features, and functionality on the app are the intellectual property of the company and are protected by copyright, trademark, and other laws. You may not reproduce, distribute, or create derivative works without our express written permission.';

  @override
  String get termsNConditionsSection5Title => '5. Limitation of Liability';

  @override
  String get termsNConditionsSection5Content => 'We are not responsible for any damages, losses, or costs arising from the use or inability to use our app. The app is provided on an \'as-is\' basis without warranties of any kind, either express or implied.';

  @override
  String get termsNConditionsSection6Title => '6. Termination';

  @override
  String get termsNConditionsSection6Content => 'We may suspend or terminate your access to the app at our sole discretion, without notice or liability, for conduct that violates these terms or is harmful to the app, other users, or third parties.';

  @override
  String get termsNConditionsSection7Title => '7. Changes to Terms';

  @override
  String get termsNConditionsSection7Content => 'We reserve the right to modify these terms at any time. Continued use of the app constitutes acceptance of the updated terms. We recommend reviewing the terms regularly to stay informed about any changes.';

  @override
  String get termsNConditionsAcceptButton => 'Accept';

  @override
  String get privacyPolicyScreenTitle => 'Privacy Policy';

  @override
  String get privacyPolicyScreenData => '1. Introduction\nWe value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data when you use our services.\n\n2. Information Collection\nWe may collect information such as your name, email address, usage data, and device information to improve our services and provide personalized experiences.\n\n3. Use of Information\nYour data may be used to:\n- Provide and improve our services\n- Communicate with you\n- Personalize your experience\n- Comply with legal obligations\n\n4. Data Sharing\nWe do not sell your personal information. However, we may share data with:\n- Service providers\n- Legal authorities if required by law\n- Business partners for limited purposes\n\n5. Security\nWe implement appropriate technical and organizational measures to protect your data from unauthorized access, loss, or misuse.\n\n6. Cookies & Tracking\nWe use cookies and similar technologies to enhance user experience, analyze trends, and monitor site usage.\n\n7. User Rights\nYou have the right to:\n- Access and request a copy of your data\n- Rectify inaccurate information\n- Request deletion of your personal data\n- Withdraw consent where applicable\n\n8. Changes to Policy\nWe may update this Privacy Policy from time to time. Any changes will be communicated through the app or website.\n\n9. Contact Us\nIf you have any questions or concerns regarding this Privacy Policy, please contact us at privacy@example.com.\n\nThank you for trusting our services!';

  @override
  String get privacyPolicyScreenAcceptButton => 'Accept';

  @override
  String get appPermissionsScreenTitle => 'App Permissions';

  @override
  String get appPermissionsScreenNotifications => 'Notifications';

  @override
  String get appPermissionsScreenCamera => 'Camera';

  @override
  String get appPermissionsScreenLocation => 'Location';

  @override
  String get appPermissionsScreenMicrophone => 'Microphone';

  @override
  String get appPermissionsScreenContacts => 'Contacts';

  @override
  String get appPermissionsScreenStorage => 'Storage';

  @override
  String get profileScreenScreenTitle => 'Profile';

  @override
  String get profileScreenJoinedDatePrefix => 'Joined:';

  @override
  String get profileScreenLogoutButton => 'Logout';

  @override
  String get profileScreenRoleLabel => 'Employ';

  @override
  String get salaryScreenScreenTitle => 'Salary Details';

  @override
  String get salaryScreenTotalDays => 'Total Days';

  @override
  String get salaryScreenLeavesTaken => 'Leaves Taken';

  @override
  String get salaryScreenBasicSalary => 'Basic Salary';

  @override
  String get salaryScreenDeductions => 'Deductions';

  @override
  String get salaryScreenNetSalary => 'Net Salary';

  @override
  String get salaryScreenReason => 'Reason';

  @override
  String get salaryScreenCurrencySymbol => '\$';

  @override
  String get hotelRoomScreenRoomsToClean => 'Rooms to clean';

  @override
  String get appBarWidgetCheckout => 'Checkout';

  @override
  String get appBarWidgetCheckin => 'Checkin';

  @override
  String get checkinPopupConfirmationMessage => 'Are you sure to check in?';

  @override
  String get checkinPopupYes => 'Yes';

  @override
  String get checkinPopupNo => 'No';

  @override
  String get checkoutPopupConfirmationMessage => 'Are you sure to check out?';

  @override
  String get checkoutPopupYes => 'Yes';

  @override
  String get checkoutPopupNo => 'No';

  @override
  String get greetCardHotelsAssigned => 'Hotels Assigned';

  @override
  String get greetCardCompleteHotels => 'Complete Hotels';

  @override
  String get greetCardPendingHotels => 'Pending Hotels';

  @override
  String get sidebarOptionsAccountSection => 'Account';

  @override
  String get sidebarOptionsProfile => 'Profile';

  @override
  String get sidebarOptionsSalary => 'Salary';

  @override
  String get sidebarOptionsInformationSection => 'Information';

  @override
  String get sidebarOptionsAboutApp => 'About App';

  @override
  String get sidebarOptionsTermsAndConditions => 'Terms and Conditions';

  @override
  String get sidebarOptionsPrivacyPolicy => 'Privacy Policy';

  @override
  String get sidebarOptionsPermissions => 'Permissions';

  @override
  String get sidebarOptionsLogout => 'Logout';
}
