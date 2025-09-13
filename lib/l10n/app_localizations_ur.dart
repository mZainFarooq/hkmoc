// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get loginScreenScreenTitle => 'لاگ ان';

  @override
  String get loginScreenWelcome => 'واپس خوش آمدید 👋';

  @override
  String get loginScreenLoginDesc => 'اپنے اکاؤنٹ میں لاگ ان کریں تاکہ اپنی صفائی کی ملازمتیں منظم کریں۔';

  @override
  String get loginScreenEmailLabel => 'ای میل';

  @override
  String get loginScreenPasswordLabel => 'پاس ورڈ';

  @override
  String get loginScreenForgotPassword => 'پاس ورڈ بھول گئے؟';

  @override
  String get loginScreenResetMethodTitle => 'پاس ورڈ ری سیٹ کرنے کا طریقہ منتخب کریں';

  @override
  String get loginScreenResetMethodDescription => 'منتخب کریں کہ آپ پاس ورڈ خود ری سیٹ کرنا چاہتے ہیں یا ایڈمن سے تبدیلی کروانا چاہتے ہیں۔';

  @override
  String get loginScreenResetMyself => 'خود ری سیٹ کریں';

  @override
  String get loginScreenResetByAdmin => 'کیا آپ ایڈمن سے تبدیل کروانا چاہتے ہیں؟';

  @override
  String get loginScreenLoginButton => 'لاگ ان کریں اور کام شروع کریں';

  @override
  String get dashboardScreenScreenTitle => 'ڈیش بورڈ';

  @override
  String get dashboardScreenGreeting => 'ہیلو';

  @override
  String get dashboardScreenAssignedHotels => 'تفویض شدہ ہوٹل';

  @override
  String get dashboardScreenNoHotelsAssigned => 'کوئی ہوٹل تفویض نہیں ہوا!';

  @override
  String get dashboardScreenSeeDetails => 'تفصیلات دیکھیں';

  @override
  String get dashboardScreenCheckIn => 'چیک اِن';

  @override
  String get historyScreenScreenTitle => 'ہسٹری';

  @override
  String get historyScreenSearchPlaceholder => 'ہوٹل کا نام تلاش کریں';

  @override
  String get historyScreenFilterByDate => 'تاریخ کے حساب سے فلٹر کریں';

  @override
  String get historyScreenTodayCompleted => 'آج مکمل ہوا';

  @override
  String get historyScreenFrom => 'سے';

  @override
  String get historyScreenTo => 'تک';

  @override
  String get historyScreenNoResults => 'کوئی نتیجہ نہیں ملا';

  @override
  String historyScreenCompletedRooms(Object completed, Object total) {
    return '$total میں سے $completed کمرے مکمل کیے گئے';
  }

  @override
  String get settingScreenScreenTitle => 'سیٹنگز';

  @override
  String get settingScreenAccountSection => 'اکاؤنٹ';

  @override
  String get settingScreenPreferencesSection => 'ترجیحات';

  @override
  String get settingScreenEditProfile => 'پروفائل ایڈٹ کریں';

  @override
  String get settingScreenNotifications => 'اطلاعات';

  @override
  String get settingScreenSickLeave => 'بیماری کی چھٹی';

  @override
  String get settingScreenHelpSupport => 'مدد اور معاونت';

  @override
  String get settingScreenAboutApp => 'ایپ کے بارے میں';

  @override
  String get editProfileScreenScreenTitle => 'پروفائل ایڈٹ کریں';

  @override
  String get editProfileScreenLabelsFirstName => 'پہلا نام';

  @override
  String get editProfileScreenLabelsLastName => 'آخری نام';

  @override
  String get editProfileScreenLabelsEmail => 'ای میل';

  @override
  String get editProfileScreenLabelsPhoneNumber => 'فون نمبر';

  @override
  String get editProfileScreenLabelsAddress => 'پتہ';

  @override
  String get editProfileScreenHintsFirstName => 'جنید';

  @override
  String get editProfileScreenHintsLastName => 'احمد';

  @override
  String get editProfileScreenHintsEmail => 'ahmadjunaid791@gmail.com';

  @override
  String get editProfileScreenHintsPhoneNumber => '+92 3023434506';

  @override
  String get editProfileScreenHintsAddress => '5 میپل ایونیو، رچمنڈ، لندن، TW10 6JR، UK';

  @override
  String get editProfileScreenButton => 'اپڈیٹ کریں';

  @override
  String get languagePopupTitle => 'زبان منتخب کریں';

  @override
  String get languagePopupButtonsCancel => 'منسوخ کریں';

  @override
  String get languagePopupButtonsSelect => 'منتخب کریں';

  @override
  String get bottomNavigatorDashboard => 'ڈیش بورڈ';

  @override
  String get bottomNavigatorHistory => 'ہسٹری';

  @override
  String get bottomNavigatorSetting => 'سیٹنگز';

  @override
  String get notificationScreenScreenTitle => 'اطلاعات';

  @override
  String get leaveScreenScreenTitle => 'بیماری کی چھٹی';

  @override
  String get leaveScreenTabsApply => 'چھٹی کے لیے درخواست دیں';

  @override
  String get leaveScreenTabsHistory => 'چھٹی کی ہسٹری';

  @override
  String get leaveScreenFormApplyTitle => 'بیماری کی چھٹی کے لیے درخواست دیں';

  @override
  String get leaveScreenFormTitle => 'عنوان';

  @override
  String get leaveScreenFormFromDate => 'سے تاریخ';

  @override
  String get leaveScreenFormToDate => 'تک تاریخ';

  @override
  String get leaveScreenFormDetails => 'تفصیلات';

  @override
  String get leaveScreenFormSubmit => 'چھٹی جمع کروائیں';

  @override
  String get leaveScreenHistoryStatusApproved => 'منظور شدہ';

  @override
  String get leaveScreenHistoryStatusCancelled => 'منسوخ شدہ';

  @override
  String get helpNSupportScreenScreenTitle => 'مدد اور معاونت';

  @override
  String get helpNSupportScreenNeedHelpTitle => 'مدد چاہیے؟';

  @override
  String get helpNSupportScreenNeedHelpDescription => 'اگر آپ کو ایپ کے ساتھ کسی مسئلے کا سامنا ہے، تو براہ کرم ہماری سپورٹ ٹیم سے رابطہ کریں...';

  @override
  String get helpNSupportScreenContactUsTitle => 'ہم سے رابطہ کریں';

  @override
  String get helpNSupportScreenContactUsDescription => 'آپ کسی بھی وقت ای میل، فون، یا لائیو چیٹ کے ذریعے ہماری سپورٹ ٹیم سے رابطہ کر سکتے ہیں...';

  @override
  String get helpNSupportScreenEmail => '📧 ای میل: support@hotelapp.com';

  @override
  String get helpNSupportScreenPhone => '📞 فون: +92 300 1234567';

  @override
  String get helpNSupportScreenChat => '💬 لائیو چیٹ: ایپ میں 24/7 دستیاب';

  @override
  String get helpNSupportScreenAdditionalTipsTitle => 'اضافی مشورے';

  @override
  String get helpNSupportScreenAdditionalTips => '• ہمیشہ اپنی ایپ کو تازہ ترین ورژن پر اپڈیٹ رکھیں۔\n• ایپ کی رفتار کم ہونے سے بچنے کے لیے کیشے باقاعدگی سے صاف کریں۔';

  @override
  String get aboutAppScreenScreenTitle => 'ایپ کے بارے میں';

  @override
  String get aboutAppScreenAppName => 'ہوٹل کلیننگ سروس ایپ';

  @override
  String get aboutAppScreenDescription => 'ہمارے ہوٹل کلیننگ سروس ایپ میں خوش آمدید! ...';

  @override
  String get aboutAppScreenFeaturesTitle => 'اہم خصوصیات';

  @override
  String get aboutAppScreenFeature0Title => 'کمرہ صفائی کی درخواستیں';

  @override
  String get aboutAppScreenFeature0Description => 'مہمان اپنی پسند کے وقت پر کمرہ صفائی کی درخواست دے سکتے ہیں۔';

  @override
  String get aboutAppScreenFeature1Title => 'لانڈری سروسز';

  @override
  String get aboutAppScreenFeature1Description => 'لانڈری اکٹھا کرنے اور ڈیلیوری کی درخواست براہ راست ایپ کے ذریعے کریں۔';

  @override
  String get aboutAppScreenFeature2Title => 'اسٹاف ٹاسک مینجمنٹ';

  @override
  String get aboutAppScreenFeature2Description => 'اسٹاف مؤثر طریقے سے تفویض شدہ کاموں کو منظم اور ٹریک کر سکتا ہے۔';

  @override
  String get aboutAppScreenFeature3Title => 'اطلاعات';

  @override
  String get aboutAppScreenFeature3Description => 'سروس اپڈیٹس اور شیڈولز کے لیے بروقت اطلاعات موصول کریں۔';

  @override
  String get aboutAppScreenFeature4Title => 'کثیر لسانی معاونت';

  @override
  String get aboutAppScreenFeature4Description => 'متنوع صارفین کے لیے متعدد زبانوں کی معاونت۔';

  @override
  String get aboutAppScreenVersion => 'ورژن 1.0.0';

  @override
  String get aboutAppScreenDevelopedBy => 'محبت کے ساتھ تیار کردہ...';

  @override
  String get termsNConditionsScreenTitle => 'شرائط و ضوابط';

  @override
  String get termsNConditionsIntro => 'ہمارے ایپ میں خوش آمدید! ...';

  @override
  String get termsNConditionsSection1Title => '1. سروس کا استعمال';

  @override
  String get termsNConditionsSection1Content => 'آپ ایپ کا استعمال صرف قانونی مقاصد کے لیے کریں گے...';

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
  String get termsNConditionsAcceptButton => 'قبول کریں';

  @override
  String get privacyPolicyScreenTitle => 'پرائیویسی پالیسی';

  @override
  String get privacyPolicyScreenData => '1. تعارف\nہم آپ کی پرائیویسی کو اہمیت دیتے ہیں...';

  @override
  String get privacyPolicyScreenAcceptButton => 'قبول کریں';

  @override
  String get appPermissionsScreenTitle => 'ایپ اجازتیں';

  @override
  String get appPermissionsScreenNotifications => 'اطلاعات';

  @override
  String get appPermissionsScreenCamera => 'کیمرہ';

  @override
  String get appPermissionsScreenLocation => 'لوکیشن';

  @override
  String get appPermissionsScreenMicrophone => 'مائیکروفون';

  @override
  String get appPermissionsScreenContacts => 'رابطے';

  @override
  String get appPermissionsScreenStorage => 'اسٹوریج';

  @override
  String get profileScreenScreenTitle => 'پروفائل';

  @override
  String get profileScreenJoinedDatePrefix => 'شامل ہونے کی تاریخ:';

  @override
  String get profileScreenLogoutButton => 'لاگ آؤٹ';

  @override
  String get profileScreenRoleLabel => 'ملازم';

  @override
  String get salaryScreenScreenTitle => 'تنخواہ کی تفصیلات';

  @override
  String get salaryScreenTotalDays => 'کل دن';

  @override
  String get salaryScreenLeavesTaken => 'لی گئی چھٹیاں';

  @override
  String get salaryScreenBasicSalary => 'بنیادی تنخواہ';

  @override
  String get salaryScreenDeductions => 'کٹوتیاں';

  @override
  String get salaryScreenNetSalary => 'نیٹ تنخواہ';

  @override
  String get salaryScreenReason => 'وجہ';

  @override
  String get salaryScreenCurrencySymbol => '₨';

  @override
  String get hotelRoomScreenRoomsToClean => 'صفائی کے کمرے';

  @override
  String get appBarWidgetCheckout => 'چیک آؤٹ';

  @override
  String get appBarWidgetCheckin => 'چیک اِن';

  @override
  String get checkinPopupConfirmationMessage => 'کیا آپ واقعی چیک اِن کرنا چاہتے ہیں؟';

  @override
  String get checkinPopupYes => 'جی ہاں';

  @override
  String get checkinPopupNo => 'نہیں';

  @override
  String get checkoutPopupConfirmationMessage => 'کیا آپ واقعی چیک آؤٹ کرنا چاہتے ہیں؟';

  @override
  String get checkoutPopupYes => 'جی ہاں';

  @override
  String get checkoutPopupNo => 'نہیں';

  @override
  String get greetCardHotelsAssigned => 'Hotels Assigned';

  @override
  String get greetCardCompleteHotels => 'Complete Hotels';

  @override
  String get greetCardPendingHotels => 'Pending Hotels';

  @override
  String get sidebarOptionsAccountSection => 'اکاؤنٹ';

  @override
  String get sidebarOptionsProfile => 'پروفائل';

  @override
  String get sidebarOptionsSalary => 'تنخواہ';

  @override
  String get sidebarOptionsInformationSection => 'معلومات';

  @override
  String get sidebarOptionsAboutApp => 'ایپ کے بارے میں';

  @override
  String get sidebarOptionsTermsAndConditions => 'شرائط و ضوابط';

  @override
  String get sidebarOptionsPrivacyPolicy => 'پرائیویسی پالیسی';

  @override
  String get sidebarOptionsPermissions => 'اجازتیں';

  @override
  String get sidebarOptionsLogout => 'لاگ آؤٹ';
}
