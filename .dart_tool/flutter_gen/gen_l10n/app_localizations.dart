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
/// import 'gen_l10n/app_localizations.dart';
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
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @my_booking.
  ///
  /// In en, this message translates to:
  /// **'My Booking'**
  String get my_booking;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @areYou.
  ///
  /// In en, this message translates to:
  /// **'Are You'**
  String get areYou;

  /// No description provided for @shopOwner.
  ///
  /// In en, this message translates to:
  /// **'Shop Owner'**
  String get shopOwner;

  /// No description provided for @restaurantOwner.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Owner'**
  String get restaurantOwner;

  /// No description provided for @trainer.
  ///
  /// In en, this message translates to:
  /// **'Trainer'**
  String get trainer;

  /// No description provided for @idNumber.
  ///
  /// In en, this message translates to:
  /// **'Id Number'**
  String get idNumber;

  /// No description provided for @cV.
  ///
  /// In en, this message translates to:
  /// **'CV'**
  String get cV;

  /// No description provided for @hourRate.
  ///
  /// In en, this message translates to:
  /// **'Hour Rate'**
  String get hourRate;

  /// No description provided for @restaurantName.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Name'**
  String get restaurantName;

  /// No description provided for @shopName.
  ///
  /// In en, this message translates to:
  /// **'Shop Name'**
  String get shopName;

  /// No description provided for @commericalNumber.
  ///
  /// In en, this message translates to:
  /// **'Commercial registration number'**
  String get commericalNumber;

  /// No description provided for @commericalFile.
  ///
  /// In en, this message translates to:
  /// **'Commercial registration file'**
  String get commericalFile;

  /// No description provided for @restaurantManagerName.
  ///
  /// In en, this message translates to:
  /// **'The name of the restaurant manager'**
  String get restaurantManagerName;

  /// No description provided for @shopManagerName.
  ///
  /// In en, this message translates to:
  /// **'The shop owner\'s name'**
  String get shopManagerName;

  /// No description provided for @restaurantPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Restaurant owner\'s phone'**
  String get restaurantPhoneNumber;

  /// No description provided for @shopPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Shop owner\'s mobile number'**
  String get shopPhoneNumber;

  /// No description provided for @cityName.
  ///
  /// In en, this message translates to:
  /// **'City Name'**
  String get cityName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @experienceCertification.
  ///
  /// In en, this message translates to:
  /// **'Experience Certification'**
  String get experienceCertification;

  /// No description provided for @myOrder.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrder;

  /// No description provided for @trainee.
  ///
  /// In en, this message translates to:
  /// **'Trainee'**
  String get trainee;

  /// No description provided for @bouquet.
  ///
  /// In en, this message translates to:
  /// **'Bouquet'**
  String get bouquet;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Error Occured 😢'**
  String get errorOccurred;

  /// No description provided for @reportError.
  ///
  /// In en, this message translates to:
  /// **'An error has been occurred, please click send to help us fixing the problem'**
  String get reportError;

  /// No description provided for @unauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get unauthorized;

  /// No description provided for @generalErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred. Please try again later'**
  String get generalErrorMessage;

  /// No description provided for @badRequest.
  ///
  /// In en, this message translates to:
  /// **'Bad Request'**
  String get badRequest;

  /// No description provided for @forbidden.
  ///
  /// In en, this message translates to:
  /// **'Forbidden'**
  String get forbidden;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'{url} not Found'**
  String notFound(Object url);

  /// No description provided for @conflictError.
  ///
  /// In en, this message translates to:
  /// **'Conflict Error'**
  String get conflictError;

  /// No description provided for @connectionTimeOut.
  ///
  /// In en, this message translates to:
  /// **'Connection time out'**
  String get connectionTimeOut;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error occurred, please try again'**
  String get unknownError;

  /// No description provided for @internalServerErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'The server encountered an internal error or misconfigurtion and was unable to complete your request.'**
  String get internalServerErrorMessage;

  /// No description provided for @connectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get connectionErrorMessage;

  /// No description provided for @oopsErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'OOPS !'**
  String get oopsErrorMessage;

  /// No description provided for @failedRefresher.
  ///
  /// In en, this message translates to:
  /// **'Failed to get data'**
  String get failedRefresher;

  /// No description provided for @noDataRefresher.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noDataRefresher;

  /// No description provided for @errorTxt.
  ///
  /// In en, this message translates to:
  /// **'This field can\'t be empty'**
  String get errorTxt;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logOut;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

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

  /// No description provided for @changeLangMessage.
  ///
  /// In en, this message translates to:
  /// **'Select a language, the application will restart'**
  String get changeLangMessage;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @pressTwiceToExit.
  ///
  /// In en, this message translates to:
  /// **'Press twice to exit'**
  String get pressTwiceToExit;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get userName;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number ex: 09xx-xxx-xxx'**
  String get invalidPhoneNumber;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Must be at least 5 characters long'**
  String get invalidPassword;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @closeApp.
  ///
  /// In en, this message translates to:
  /// **'Close App'**
  String get closeApp;

  /// No description provided for @updateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get updateTitle;

  /// No description provided for @updateMessage.
  ///
  /// In en, this message translates to:
  /// **'For the best experience, update to the latest version to get new features and improvements.'**
  String get updateMessage;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @pageEmpty.
  ///
  /// In en, this message translates to:
  /// **'The page has no content ..'**
  String get pageEmpty;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @responseError.
  ///
  /// In en, this message translates to:
  /// **'An error happened while connecting to server, please try again later'**
  String get responseError;

  /// No description provided for @errorCancelToken.
  ///
  /// In en, this message translates to:
  /// **'The connection has been interrupted'**
  String get errorCancelToken;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signUp;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @invalidConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Password and confirm password doesn\'t match'**
  String get invalidConfirmPassword;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @errorEmptyField.
  ///
  /// In en, this message translates to:
  /// **'This field mustn\'t be empty'**
  String get errorEmptyField;

  /// No description provided for @switchTheme.
  ///
  /// In en, this message translates to:
  /// **'Switch theme'**
  String get switchTheme;

  /// No description provided for @accountNotVerifiedErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Account Not Verified'**
  String get accountNotVerifiedErrorMessage;

  /// No description provided for @cancelErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Operation has been cancelled'**
  String get cancelErrorMessage;

  /// No description provided for @loginErrorRequired.
  ///
  /// In en, this message translates to:
  /// **'login Error Required'**
  String get loginErrorRequired;

  /// No description provided for @emptyScreen.
  ///
  /// In en, this message translates to:
  /// **'This page is empty'**
  String get emptyScreen;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @homePage.
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get homePage;

  /// No description provided for @translationTest.
  ///
  /// In en, this message translates to:
  /// **'Translation Test'**
  String get translationTest;

  /// No description provided for @justLog.
  ///
  /// In en, this message translates to:
  /// **'Just Log'**
  String get justLog;

  /// No description provided for @testSuccessRequest.
  ///
  /// In en, this message translates to:
  /// **'Test Success Request'**
  String get testSuccessRequest;

  /// No description provided for @testFailureRequest.
  ///
  /// In en, this message translates to:
  /// **'Test Failure Request'**
  String get testFailureRequest;

  /// No description provided for @testValidatorRequest.
  ///
  /// In en, this message translates to:
  /// **'Test Validator Request'**
  String get testValidatorRequest;

  /// No description provided for @getPeople.
  ///
  /// In en, this message translates to:
  /// **'Get People'**
  String get getPeople;

  /// No description provided for @getPokemons.
  ///
  /// In en, this message translates to:
  /// **'Get Pokemons'**
  String get getPokemons;

  /// No description provided for @testErrorScreen.
  ///
  /// In en, this message translates to:
  /// **'Test Error Handler'**
  String get testErrorScreen;

  /// No description provided for @keep_fitness.
  ///
  /// In en, this message translates to:
  /// **'Keep your fitness'**
  String get keep_fitness;

  /// No description provided for @intro1_text.
  ///
  /// In en, this message translates to:
  /// **'We are here to help you keep your fitness\neffectively and simply with suitable prices'**
  String get intro1_text;

  /// No description provided for @lookup_coach.
  ///
  /// In en, this message translates to:
  /// **'lookup your favorite coach'**
  String get lookup_coach;

  /// No description provided for @intro2_text.
  ///
  /// In en, this message translates to:
  /// **'we provide you with\nthe best coaches around the world'**
  String get intro2_text;

  /// No description provided for @training_daily.
  ///
  /// In en, this message translates to:
  /// **'Training daily'**
  String get training_daily;

  /// No description provided for @intro3_text.
  ///
  /// In en, this message translates to:
  /// **'loosing weight and building muscles\nthrough training and diet'**
  String get intro3_text;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password;

  /// No description provided for @no_account.
  ///
  /// In en, this message translates to:
  /// **'don\'t have an account?'**
  String get no_account;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @mail.
  ///
  /// In en, this message translates to:
  /// **'Mail'**
  String get mail;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @sport_coaches.
  ///
  /// In en, this message translates to:
  /// **'Sport Coaches'**
  String get sport_coaches;

  /// No description provided for @gyms.
  ///
  /// In en, this message translates to:
  /// **'Gyms'**
  String get gyms;

  /// No description provided for @restaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// No description provided for @healthy_restaurants.
  ///
  /// In en, this message translates to:
  /// **'Healthy\nRestaurants'**
  String get healthy_restaurants;

  /// No description provided for @stores.
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get stores;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get see_all;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @food_supplements.
  ///
  /// In en, this message translates to:
  /// **'Food Supplements'**
  String get food_supplements;

  /// No description provided for @most_rated_coaches.
  ///
  /// In en, this message translates to:
  /// **'Most Rated Coaches'**
  String get most_rated_coaches;

  /// No description provided for @account_exist.
  ///
  /// In en, this message translates to:
  /// **'you have an account'**
  String get account_exist;

  /// No description provided for @login2.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login2;

  /// No description provided for @signup2.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signup2;

  /// No description provided for @accept_on.
  ///
  /// In en, this message translates to:
  /// **'Accept on'**
  String get accept_on;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms of service'**
  String get terms;

  /// No description provided for @following.
  ///
  /// In en, this message translates to:
  /// **''**
  String get following;

  /// No description provided for @verification_code_sent.
  ///
  /// In en, this message translates to:
  /// **'Verification code has been sent to your mobile'**
  String get verification_code_sent;

  /// No description provided for @insert_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Please insert the Verification code to verify yout account'**
  String get insert_verification_code;

  /// No description provided for @account_verification.
  ///
  /// In en, this message translates to:
  /// **'verify account'**
  String get account_verification;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'verify'**
  String get verify;

  /// No description provided for @no_code_received.
  ///
  /// In en, this message translates to:
  /// **'didn\'t receive the code?'**
  String get no_code_received;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resend_code;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @men.
  ///
  /// In en, this message translates to:
  /// **'Men'**
  String get men;

  /// No description provided for @women.
  ///
  /// In en, this message translates to:
  /// **'Women'**
  String get women;

  /// No description provided for @under_16.
  ///
  /// In en, this message translates to:
  /// **'Under 16'**
  String get under_16;

  /// No description provided for @coaches.
  ///
  /// In en, this message translates to:
  /// **'Coaches'**
  String get coaches;

  /// No description provided for @search_coach.
  ///
  /// In en, this message translates to:
  /// **'Search for coach'**
  String get search_coach;

  /// No description provided for @courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get courses;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @notActive.
  ///
  /// In en, this message translates to:
  /// **'Not Active'**
  String get notActive;

  /// No description provided for @mostWantedCourses.
  ///
  /// In en, this message translates to:
  /// **'The most popular courses'**
  String get mostWantedCourses;

  /// No description provided for @book_now.
  ///
  /// In en, this message translates to:
  /// **'Book now'**
  String get book_now;

  /// No description provided for @saudi_riyal.
  ///
  /// In en, this message translates to:
  /// **'Saudi riyal'**
  String get saudi_riyal;

  /// No description provided for @coach_location.
  ///
  /// In en, this message translates to:
  /// **'Coach location'**
  String get coach_location;

  /// No description provided for @rating_average.
  ///
  /// In en, this message translates to:
  /// **'Rating Average'**
  String get rating_average;

  /// No description provided for @rate_now.
  ///
  /// In en, this message translates to:
  /// **'Rate now'**
  String get rate_now;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// No description provided for @course_subscription.
  ///
  /// In en, this message translates to:
  /// **'Course Subscription'**
  String get course_subscription;

  /// No description provided for @subscription_type.
  ///
  /// In en, this message translates to:
  /// **'Subscription type'**
  String get subscription_type;

  /// No description provided for @weekly_hours.
  ///
  /// In en, this message translates to:
  /// **'Weekly Hours'**
  String get weekly_hours;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'Hour'**
  String get hour;

  /// No description provided for @bill.
  ///
  /// In en, this message translates to:
  /// **'Bill'**
  String get bill;

  /// No description provided for @payment_way.
  ///
  /// In en, this message translates to:
  /// **'Way of Payment'**
  String get payment_way;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @whats_ur_rating.
  ///
  /// In en, this message translates to:
  /// **'What is your rating?'**
  String get whats_ur_rating;

  /// No description provided for @whats_ur_opinion.
  ///
  /// In en, this message translates to:
  /// **'What is your opinion?'**
  String get whats_ur_opinion;

  /// No description provided for @current_courses.
  ///
  /// In en, this message translates to:
  /// **'Current Courses'**
  String get current_courses;

  /// No description provided for @ended_courses.
  ///
  /// In en, this message translates to:
  /// **'Ended Courses'**
  String get ended_courses;

  /// No description provided for @payment_ways.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get payment_ways;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get edit_profile;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get full_name;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @date_of_birth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get date_of_birth;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @bmi.
  ///
  /// In en, this message translates to:
  /// **'BMI'**
  String get bmi;

  /// No description provided for @enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enter_phone_number;

  /// No description provided for @enter_valid_phone.
  ///
  /// In en, this message translates to:
  /// **'enter valid phone number'**
  String get enter_valid_phone;

  /// No description provided for @enter_password.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enter_password;

  /// No description provided for @enter_valid_password.
  ///
  /// In en, this message translates to:
  /// **'Enter password of 8 characters or more'**
  String get enter_valid_password;

  /// No description provided for @enter_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Enter confirm password'**
  String get enter_confirm_password;

  /// No description provided for @passwords_not_match.
  ///
  /// In en, this message translates to:
  /// **'passwords don\'t match'**
  String get passwords_not_match;

  /// No description provided for @enter_pin_code.
  ///
  /// In en, this message translates to:
  /// **'Enter pin code'**
  String get enter_pin_code;

  /// No description provided for @accept_terms_conditions.
  ///
  /// In en, this message translates to:
  /// **'Accept terms and conditions'**
  String get accept_terms_conditions;

  /// No description provided for @account_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Registered successfully'**
  String get account_created_successfully;

  /// No description provided for @password_changed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get password_changed_successfully;

  /// No description provided for @account_verified_successfully.
  ///
  /// In en, this message translates to:
  /// **'Account verified successfully'**
  String get account_verified_successfully;

  /// No description provided for @goto.
  ///
  /// In en, this message translates to:
  /// **'Go to'**
  String get goto;

  /// No description provided for @account_settings.
  ///
  /// In en, this message translates to:
  /// **'Account settings'**
  String get account_settings;

  /// No description provided for @app_settings.
  ///
  /// In en, this message translates to:
  /// **'App settings'**
  String get app_settings;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password;

  /// No description provided for @dishes.
  ///
  /// In en, this message translates to:
  /// **'Dishes'**
  String get dishes;

  /// No description provided for @supplements_shops.
  ///
  /// In en, this message translates to:
  /// **'Supplements Shops'**
  String get supplements_shops;

  /// No description provided for @supplements.
  ///
  /// In en, this message translates to:
  /// **'Supplements'**
  String get supplements;

  /// No description provided for @my_orders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get my_orders;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'language'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacy_policy;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @about_app.
  ///
  /// In en, this message translates to:
  /// **'About app'**
  String get about_app;

  /// No description provided for @enable_notifications.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications'**
  String get enable_notifications;

  /// No description provided for @insert_value.
  ///
  /// In en, this message translates to:
  /// **'Please insert a value'**
  String get insert_value;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @no_data_found.
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get no_data_found;

  /// No description provided for @filter_by.
  ///
  /// In en, this message translates to:
  /// **'Filter by'**
  String get filter_by;

  /// No description provided for @coach_rate.
  ///
  /// In en, this message translates to:
  /// **'Coach\'s Rate'**
  String get coach_rate;

  /// No description provided for @most_rated.
  ///
  /// In en, this message translates to:
  /// **'Most rated'**
  String get most_rated;

  /// No description provided for @least_rated.
  ///
  /// In en, this message translates to:
  /// **'Least rated'**
  String get least_rated;

  /// No description provided for @coach_address.
  ///
  /// In en, this message translates to:
  /// **'Coach address'**
  String get coach_address;

  /// No description provided for @nearest.
  ///
  /// In en, this message translates to:
  /// **'Nearest'**
  String get nearest;

  /// No description provided for @farthest.
  ///
  /// In en, this message translates to:
  /// **'Farthest'**
  String get farthest;

  /// No description provided for @coach_specialization.
  ///
  /// In en, this message translates to:
  /// **'Coach Specialization'**
  String get coach_specialization;

  /// No description provided for @apply_filter.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get apply_filter;

  /// No description provided for @current_password.
  ///
  /// In en, this message translates to:
  /// **'current_password'**
  String get current_password;

  /// No description provided for @password_changed.
  ///
  /// In en, this message translates to:
  /// **'Password Changed Successfully'**
  String get password_changed;

  /// No description provided for @image_not_available.
  ///
  /// In en, this message translates to:
  /// **'Image is not available!'**
  String get image_not_available;

  /// No description provided for @video_not_available.
  ///
  /// In en, this message translates to:
  /// **'Video is not available!'**
  String get video_not_available;

  /// No description provided for @my_course_details.
  ///
  /// In en, this message translates to:
  /// **'My Course Details'**
  String get my_course_details;

  /// No description provided for @course_statistic.
  ///
  /// In en, this message translates to:
  /// **'Course Statistics'**
  String get course_statistic;

  /// No description provided for @coach.
  ///
  /// In en, this message translates to:
  /// **'Coach Name'**
  String get coach;

  /// No description provided for @hoursNumber.
  ///
  /// In en, this message translates to:
  /// **'Course Hours'**
  String get hoursNumber;

  /// No description provided for @finishedHour.
  ///
  /// In en, this message translates to:
  /// **'Finished Hours'**
  String get finishedHour;

  /// No description provided for @remainsHours.
  ///
  /// In en, this message translates to:
  /// **'remaining Hours'**
  String get remainsHours;

  /// No description provided for @numberOfAbsenece.
  ///
  /// In en, this message translates to:
  /// **'Absence Days'**
  String get numberOfAbsenece;

  /// No description provided for @pricePerHour.
  ///
  /// In en, this message translates to:
  /// **'riyal/hour'**
  String get pricePerHour;

  /// No description provided for @myFiles.
  ///
  /// In en, this message translates to:
  /// **'my files'**
  String get myFiles;

  /// No description provided for @cv.
  ///
  /// In en, this message translates to:
  /// **'cv'**
  String get cv;

  /// No description provided for @certificate.
  ///
  /// In en, this message translates to:
  /// **'certificate'**
  String get certificate;

  /// No description provided for @dishsMostOrder.
  ///
  /// In en, this message translates to:
  /// **'The most popular dishes'**
  String get dishsMostOrder;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @new_trainees.
  ///
  /// In en, this message translates to:
  /// **'The new trainees'**
  String get new_trainees;

  /// No description provided for @no_trainers.
  ///
  /// In en, this message translates to:
  /// **'No Trainers'**
  String get no_trainers;

  /// No description provided for @trainees.
  ///
  /// In en, this message translates to:
  /// **'Trainees'**
  String get trainees;

  /// No description provided for @no_courses.
  ///
  /// In en, this message translates to:
  /// **'No Courses'**
  String get no_courses;

  /// No description provided for @not_active.
  ///
  /// In en, this message translates to:
  /// **'Not Active'**
  String get not_active;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'pending'**
  String get pending;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// No description provided for @choose_category.
  ///
  /// In en, this message translates to:
  /// **'Choose Category'**
  String get choose_category;

  /// No description provided for @enter_course_price.
  ///
  /// In en, this message translates to:
  /// **'Enter Price'**
  String get enter_course_price;

  /// No description provided for @choose_course_img.
  ///
  /// In en, this message translates to:
  /// **'plesae choose course image'**
  String get choose_course_img;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @cource.
  ///
  /// In en, this message translates to:
  /// **'Course Price'**
  String get cource;

  /// No description provided for @enter_num_only.
  ///
  /// In en, this message translates to:
  /// **'Enter only numbers'**
  String get enter_num_only;

  /// No description provided for @enter_eng_letters.
  ///
  /// In en, this message translates to:
  /// **'Enter Only english letters'**
  String get enter_eng_letters;

  /// No description provided for @enter_at_letters.
  ///
  /// In en, this message translates to:
  /// **'Enter only arabic letters'**
  String get enter_at_letters;

  /// No description provided for @course_details_en.
  ///
  /// In en, this message translates to:
  /// **'Enter Details In English'**
  String get course_details_en;

  /// No description provided for @course_details_ar.
  ///
  /// In en, this message translates to:
  /// **'Enter Details In Arabic'**
  String get course_details_ar;

  /// No description provided for @discount_perc.
  ///
  /// In en, this message translates to:
  /// **'Enter Discount percentage'**
  String get discount_perc;

  /// No description provided for @hours_num.
  ///
  /// In en, this message translates to:
  /// **'Enter Hours Number'**
  String get hours_num;

  /// No description provided for @enter_related_img.
  ///
  /// In en, this message translates to:
  /// **'Attach course-related images'**
  String get enter_related_img;

  /// No description provided for @en_course_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Course Name In English'**
  String get en_course_name;

  /// No description provided for @ar_course_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Course Name In Arabic'**
  String get ar_course_name;

  /// No description provided for @add_course.
  ///
  /// In en, this message translates to:
  /// **'Add Course'**
  String get add_course;

  /// No description provided for @chat_with_your_trainers.
  ///
  /// In en, this message translates to:
  /// **'wanna talk with your trainees?'**
  String get chat_with_your_trainers;

  /// No description provided for @course_added_success.
  ///
  /// In en, this message translates to:
  /// **'The Course Added Successfully'**
  String get course_added_success;

  /// No description provided for @goto_my_courses.
  ///
  /// In en, this message translates to:
  /// **'Go To My Courses'**
  String get goto_my_courses;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid Email Format'**
  String get invalid_email;

  /// No description provided for @restaurant.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get restaurant;

  /// No description provided for @rest_name_ar.
  ///
  /// In en, this message translates to:
  /// **'Restaurant name in arabic'**
  String get rest_name_ar;

  /// No description provided for @rest_name_en.
  ///
  /// In en, this message translates to:
  /// **'Restaurant name in english'**
  String get rest_name_en;

  /// No description provided for @logo_ar.
  ///
  /// In en, this message translates to:
  /// **'The Logo in arabic'**
  String get logo_ar;

  /// No description provided for @logo_en.
  ///
  /// In en, this message translates to:
  /// **'The Logo in english'**
  String get logo_en;

  /// No description provided for @cover_en.
  ///
  /// In en, this message translates to:
  /// **'The image cover in english'**
  String get cover_en;

  /// No description provided for @cover_ar.
  ///
  /// In en, this message translates to:
  /// **'The image cover in arabic'**
  String get cover_ar;

  /// No description provided for @select_your_location.
  ///
  /// In en, this message translates to:
  /// **'Select your location on the map'**
  String get select_your_location;

  /// No description provided for @social_media_links.
  ///
  /// In en, this message translates to:
  /// **'Social media links'**
  String get social_media_links;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @shop_name_ar.
  ///
  /// In en, this message translates to:
  /// **'Shop name in arabic'**
  String get shop_name_ar;

  /// No description provided for @shop_name_en.
  ///
  /// In en, this message translates to:
  /// **'Shop name in english'**
  String get shop_name_en;

  /// No description provided for @please_pick_all_img_files.
  ///
  /// In en, this message translates to:
  /// **'please pick all the required images and files'**
  String get please_pick_all_img_files;

  /// No description provided for @please_enter_otp.
  ///
  /// In en, this message translates to:
  /// **'Please Write The OTP'**
  String get please_enter_otp;

  /// No description provided for @my_courses.
  ///
  /// In en, this message translates to:
  /// **'My Courses'**
  String get my_courses;

  /// No description provided for @subscription_plans.
  ///
  /// In en, this message translates to:
  /// **'Subscription Plans'**
  String get subscription_plans;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'approved'**
  String get approved;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'cancelled'**
  String get cancelled;

  /// No description provided for @subscribers.
  ///
  /// In en, this message translates to:
  /// **'Subscribers'**
  String get subscribers;

  /// No description provided for @max_subscribers.
  ///
  /// In en, this message translates to:
  /// **'Max subscribers'**
  String get max_subscribers;

  /// No description provided for @remaining_duration.
  ///
  /// In en, this message translates to:
  /// **'Remaining duration'**
  String get remaining_duration;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @no_trainees.
  ///
  /// In en, this message translates to:
  /// **'No Trainees'**
  String get no_trainees;

  /// No description provided for @link_invalid.
  ///
  /// In en, this message translates to:
  /// **'The link is invalid'**
  String get link_invalid;

  /// No description provided for @manager_email.
  ///
  /// In en, this message translates to:
  /// **'Manager email'**
  String get manager_email;

  /// No description provided for @manager_password.
  ///
  /// In en, this message translates to:
  /// **'Manager password'**
  String get manager_password;

  /// No description provided for @manager_phone.
  ///
  /// In en, this message translates to:
  /// **'Manager Phone Number'**
  String get manager_phone;

  /// No description provided for @search_for_chat.
  ///
  /// In en, this message translates to:
  /// **'Search for any chat'**
  String get search_for_chat;

  /// No description provided for @subscription_plan.
  ///
  /// In en, this message translates to:
  /// **'Subscription plan'**
  String get subscription_plan;

  /// No description provided for @add_a_dish.
  ///
  /// In en, this message translates to:
  /// **'Add a Dish'**
  String get add_a_dish;

  /// No description provided for @dish_name_in_arabic.
  ///
  /// In en, this message translates to:
  /// **'Dish Name in Arabic'**
  String get dish_name_in_arabic;

  /// No description provided for @dish_name_in_english.
  ///
  /// In en, this message translates to:
  /// **'Dish Name in English'**
  String get dish_name_in_english;

  /// No description provided for @attach_an_illustrative_image_of_the_dish.
  ///
  /// In en, this message translates to:
  /// **'Attach an Illustrative Image of the Dish'**
  String get attach_an_illustrative_image_of_the_dish;

  /// No description provided for @choose_the_category.
  ///
  /// In en, this message translates to:
  /// **'Choose the Category'**
  String get choose_the_category;

  /// No description provided for @dish_price.
  ///
  /// In en, this message translates to:
  /// **'Dish Price'**
  String get dish_price;

  /// No description provided for @dish_components_in_arabic.
  ///
  /// In en, this message translates to:
  /// **'Dish Components in Arabic'**
  String get dish_components_in_arabic;

  /// No description provided for @dish_components_in_english.
  ///
  /// In en, this message translates to:
  /// **'Dish Components in English'**
  String get dish_components_in_english;

  /// No description provided for @complete_data.
  ///
  /// In en, this message translates to:
  /// **'complete the data'**
  String get complete_data;

  /// No description provided for @details_in_arabic.
  ///
  /// In en, this message translates to:
  /// **'Details in arabic'**
  String get details_in_arabic;

  /// No description provided for @details_in_english.
  ///
  /// In en, this message translates to:
  /// **'Details in english'**
  String get details_in_english;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @add_Product.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get add_Product;

  /// No description provided for @product_Name_Arabic.
  ///
  /// In en, this message translates to:
  /// **'Product Name in Arabic'**
  String get product_Name_Arabic;

  /// No description provided for @product_Name_English.
  ///
  /// In en, this message translates to:
  /// **'Product Name in English'**
  String get product_Name_English;

  /// No description provided for @attach_Image_Product.
  ///
  /// In en, this message translates to:
  /// **'Attach an Image Representing the Product'**
  String get attach_Image_Product;

  /// No description provided for @product_price.
  ///
  /// In en, this message translates to:
  /// **'Product Price'**
  String get product_price;

  /// No description provided for @product_ingred_ar.
  ///
  /// In en, this message translates to:
  /// **'Product Ingredients in Arabic'**
  String get product_ingred_ar;

  /// No description provided for @product_ingred_en.
  ///
  /// In en, this message translates to:
  /// **'Product Ingredients in English'**
  String get product_ingred_en;

  /// No description provided for @most_wanted_products.
  ///
  /// In en, this message translates to:
  /// **'The most wanted products'**
  String get most_wanted_products;

  /// No description provided for @my_products.
  ///
  /// In en, this message translates to:
  /// **'My products'**
  String get my_products;

  /// No description provided for @my_plates.
  ///
  /// In en, this message translates to:
  /// **'My plates'**
  String get my_plates;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'change'**
  String get change;

  /// No description provided for @old_pass.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get old_pass;

  /// No description provided for @every_year.
  ///
  /// In en, this message translates to:
  /// **'Every year'**
  String get every_year;

  /// No description provided for @free_susbcription.
  ///
  /// In en, this message translates to:
  /// **'Free Subscription'**
  String get free_susbcription;

  /// No description provided for @dish_added_succ.
  ///
  /// In en, this message translates to:
  /// **'Your dish has been added successfully'**
  String get dish_added_succ;

  /// No description provided for @go_to_my_dishes.
  ///
  /// In en, this message translates to:
  /// **'Go to my dishes'**
  String get go_to_my_dishes;

  /// No description provided for @num_orders.
  ///
  /// In en, this message translates to:
  /// **'Number of orders'**
  String get num_orders;

  /// No description provided for @product_added_succ.
  ///
  /// In en, this message translates to:
  /// **'Your product has been added successfully'**
  String get product_added_succ;

  /// No description provided for @go_to_my_products.
  ///
  /// In en, this message translates to:
  /// **'Go to my products'**
  String get go_to_my_products;

  /// No description provided for @start_training.
  ///
  /// In en, this message translates to:
  /// **'Start training'**
  String get start_training;

  /// No description provided for @add_values.
  ///
  /// In en, this message translates to:
  /// **'Add new values'**
  String get add_values;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// No description provided for @fat_perct.
  ///
  /// In en, this message translates to:
  /// **'Fat percentage'**
  String get fat_perct;

  /// No description provided for @trainee_at.
  ///
  /// In en, this message translates to:
  /// **'Trainee at'**
  String get trainee_at;

  /// No description provided for @cm.
  ///
  /// In en, this message translates to:
  /// **'CM'**
  String get cm;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'KG'**
  String get kg;

  /// No description provided for @changes_in_bmi.
  ///
  /// In en, this message translates to:
  /// **'Changes in BMI'**
  String get changes_in_bmi;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @the_member_left_the_call.
  ///
  /// In en, this message translates to:
  /// **'{name} has left the call. If you need anything, feel free to reach out. See you!'**
  String the_member_left_the_call(Object name);

  /// No description provided for @the_member_decline_the_call.
  ///
  /// In en, this message translates to:
  /// **'{name} declined the call '**
  String the_member_decline_the_call(Object name);

  /// No description provided for @delete_acc.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_acc;

  /// No description provided for @delete_acc_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get delete_acc_dialog_content;

  /// No description provided for @check_email.
  ///
  /// In en, this message translates to:
  /// **'Check your Email'**
  String get check_email;
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
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
