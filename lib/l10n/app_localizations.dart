import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
  static const List<Locale> supportedLocales = <Locale>[Locale('ar'), Locale('en')];

  /// No description provided for @bnoud.
  ///
  /// In en, this message translates to:
  /// **'Bnoud'**
  String get bnoud;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @activeProjects.
  ///
  /// In en, this message translates to:
  /// **'Active Projects'**
  String get activeProjects;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'View more'**
  String get viewMore;

  /// No description provided for @addNewProject.
  ///
  /// In en, this message translates to:
  /// **'Add New Project'**
  String get addNewProject;

  /// No description provided for @projectName.
  ///
  /// In en, this message translates to:
  /// **'Project Name'**
  String get projectName;

  /// No description provided for @projectAddress.
  ///
  /// In en, this message translates to:
  /// **'Project Address'**
  String get projectAddress;

  /// No description provided for @contactNumber.
  ///
  /// In en, this message translates to:
  /// **'Contact Number'**
  String get contactNumber;

  /// No description provided for @accountSystem.
  ///
  /// In en, this message translates to:
  /// **'Account System'**
  String get accountSystem;

  /// No description provided for @percentageOrAmount.
  ///
  /// In en, this message translates to:
  /// **'Percentage or amount'**
  String get percentageOrAmount;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'The amount'**
  String get amount;

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentage;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @contract.
  ///
  /// In en, this message translates to:
  /// **'Contract'**
  String get contract;

  /// No description provided for @finishProject.
  ///
  /// In en, this message translates to:
  /// **'Finish project'**
  String get finishProject;

  /// No description provided for @finishProjectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm the completion of the project'**
  String get finishProjectConfirm;

  /// No description provided for @deleteProject.
  ///
  /// In en, this message translates to:
  /// **'Delete project'**
  String get deleteProject;

  /// No description provided for @deleteProjectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm deletion of the project'**
  String get deleteProjectConfirm;

  /// No description provided for @activeEdit.
  ///
  /// In en, this message translates to:
  /// **'Please activate the modification first from the settings above'**
  String get activeEdit;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm deletion'**
  String get deleteConfirm;

  /// No description provided for @projectExport.
  ///
  /// In en, this message translates to:
  /// **'Project export'**
  String get projectExport;

  /// No description provided for @projectExportConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please confirm the project export'**
  String get projectExportConfirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @myTransactions.
  ///
  /// In en, this message translates to:
  /// **'My Transactions'**
  String get myTransactions;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @duePayments.
  ///
  /// In en, this message translates to:
  /// **'Due payments'**
  String get duePayments;

  /// No description provided for @supervisorPledge.
  ///
  /// In en, this message translates to:
  /// **'Supervisor \'s pledge'**
  String get supervisorPledge;

  /// No description provided for @expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// No description provided for @actualRevenue.
  ///
  /// In en, this message translates to:
  /// **'Actual revenue'**
  String get actualRevenue;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @addPayments.
  ///
  /// In en, this message translates to:
  /// **'Add payments'**
  String get addPayments;

  /// No description provided for @addExpenses.
  ///
  /// In en, this message translates to:
  /// **'Add expenses'**
  String get addExpenses;

  /// No description provided for @addBatches.
  ///
  /// In en, this message translates to:
  /// **'Add batches'**
  String get addBatches;

  /// No description provided for @mainItem.
  ///
  /// In en, this message translates to:
  /// **'Main item'**
  String get mainItem;

  /// No description provided for @subItem.
  ///
  /// In en, this message translates to:
  /// **'Sub item'**
  String get subItem;

  /// No description provided for @batchesNo.
  ///
  /// In en, this message translates to:
  /// **'Batch Number'**
  String get batchesNo;

  /// No description provided for @paymentNumber.
  ///
  /// In en, this message translates to:
  /// **'Payment number'**
  String get paymentNumber;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'The date'**
  String get date;

  /// No description provided for @project.
  ///
  /// In en, this message translates to:
  /// **'The project'**
  String get project;

  /// No description provided for @moreDetails.
  ///
  /// In en, this message translates to:
  /// **'More details'**
  String get moreDetails;

  /// No description provided for @addImageCheck.
  ///
  /// In en, this message translates to:
  /// **'Add an image of a check or bank transfer'**
  String get addImageCheck;

  /// No description provided for @selectOption.
  ///
  /// In en, this message translates to:
  /// **'Select an option'**
  String get selectOption;

  /// No description provided for @cameraGallery.
  ///
  /// In en, this message translates to:
  /// **'Do you want to pick an image from camera or gallery?'**
  String get cameraGallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @noImageSelected.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get noImageSelected;

  /// No description provided for @viewImage.
  ///
  /// In en, this message translates to:
  /// **'View the image'**
  String get viewImage;

  /// No description provided for @allProjects.
  ///
  /// In en, this message translates to:
  /// **'All Projects'**
  String get allProjects;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @projectDetails.
  ///
  /// In en, this message translates to:
  /// **'Project Details'**
  String get projectDetails;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @clause.
  ///
  /// In en, this message translates to:
  /// **'Clause'**
  String get clause;

  /// No description provided for @subclause.
  ///
  /// In en, this message translates to:
  /// **'Subclause'**
  String get subclause;

  /// No description provided for @expensesDetails.
  ///
  /// In en, this message translates to:
  /// **'Expenses details'**
  String get expensesDetails;

  /// No description provided for @batchDetails.
  ///
  /// In en, this message translates to:
  /// **'Batch Details'**
  String get batchDetails;

  /// No description provided for @batchNumber.
  ///
  /// In en, this message translates to:
  /// **'Batch Number'**
  String get batchNumber;

  /// No description provided for @batchesValue.
  ///
  /// In en, this message translates to:
  /// **'Batch Value'**
  String get batchesValue;

  /// No description provided for @batchImage.
  ///
  /// In en, this message translates to:
  /// **'Batch image'**
  String get batchImage;

  /// No description provided for @bill.
  ///
  /// In en, this message translates to:
  /// **'Bill'**
  String get bill;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'change'**
  String get change;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'phone'**
  String get phone;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get birthDate;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @logInNow.
  ///
  /// In en, this message translates to:
  /// **'Log in now'**
  String get logInNow;

  /// No description provided for @phoneOrEmail.
  ///
  /// In en, this message translates to:
  /// **'Phone number / email'**
  String get phoneOrEmail;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forgetPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @haveNoAcc.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account with us?'**
  String get haveNoAcc;

  /// No description provided for @registerNow.
  ///
  /// In en, this message translates to:
  /// **'Register now'**
  String get registerNow;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @registerAccount.
  ///
  /// In en, this message translates to:
  /// **'Register a new account'**
  String get registerAccount;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you have an account? '**
  String get haveAccount;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the code'**
  String get enterCode;

  /// No description provided for @codeSent.
  ///
  /// In en, this message translates to:
  /// **'A 6-digit code was sent to \nYour email '**
  String get codeSent;

  /// No description provided for @digitCode.
  ///
  /// In en, this message translates to:
  /// **'6-digit code'**
  String get digitCode;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New password'**
  String get confirmNewPassword;

  /// No description provided for @passwordError.
  ///
  /// In en, this message translates to:
  /// **'Password required'**
  String get passwordError;

  /// No description provided for @phoneOrEmailError.
  ///
  /// In en, this message translates to:
  /// **'Phone number/email required'**
  String get phoneOrEmailError;

  /// No description provided for @nameError.
  ///
  /// In en, this message translates to:
  /// **'Name required'**
  String get nameError;

  /// No description provided for @conPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Confirm password required'**
  String get conPasswordError;

  /// No description provided for @matchPasswordError.
  ///
  /// In en, this message translates to:
  /// **'The password and confirmation password do not match'**
  String get matchPasswordError;

  /// No description provided for @emailError.
  ///
  /// In en, this message translates to:
  /// **'Email required'**
  String get emailError;

  /// No description provided for @phoneError.
  ///
  /// In en, this message translates to:
  /// **'Phone required'**
  String get phoneError;

  /// No description provided for @companyError.
  ///
  /// In en, this message translates to:
  /// **'Company required'**
  String get companyError;

  /// No description provided for @birthDateError.
  ///
  /// In en, this message translates to:
  /// **'BirthDate required'**
  String get birthDateError;

  /// No description provided for @genderError.
  ///
  /// In en, this message translates to:
  /// **'Gender required'**
  String get genderError;

  /// No description provided for @countryError.
  ///
  /// In en, this message translates to:
  /// **'Country required'**
  String get countryError;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @projectNameError.
  ///
  /// In en, this message translates to:
  /// **'Project name is required'**
  String get projectNameError;

  /// No description provided for @projectAddressError.
  ///
  /// In en, this message translates to:
  /// **'Project address is required'**
  String get projectAddressError;

  /// No description provided for @contactNumberError.
  ///
  /// In en, this message translates to:
  /// **'Contact number is required'**
  String get contactNumberError;

  /// No description provided for @accountSystemError.
  ///
  /// In en, this message translates to:
  /// **'Account System is required'**
  String get accountSystemError;

  /// No description provided for @percentageError.
  ///
  /// In en, this message translates to:
  /// **'Percentage or amount'**
  String get percentageError;

  /// No description provided for @amountError.
  ///
  /// In en, this message translates to:
  /// **'Amount is required'**
  String get amountError;

  /// No description provided for @dateError.
  ///
  /// In en, this message translates to:
  /// **'Date is required'**
  String get dateError;

  /// No description provided for @itemError.
  ///
  /// In en, this message translates to:
  /// **'Item is required'**
  String get itemError;

  /// No description provided for @batchNoError.
  ///
  /// In en, this message translates to:
  /// **'Batch Number is required'**
  String get batchNoError;

  /// No description provided for @dues.
  ///
  /// In en, this message translates to:
  /// **'Dues'**
  String get dues;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'test'**
  String get test;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError('AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
