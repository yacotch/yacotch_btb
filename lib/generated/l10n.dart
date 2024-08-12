// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Translation {
  Translation();

  static Translation? _current;

  static Translation get current {
    assert(_current != null,
        'No instance of Translation was loaded. Try to initialize the Translation delegate before accessing Translation.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Translation> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Translation();
      Translation._current = instance;

      return instance;
    });
  }

  static Translation of(BuildContext context) {
    final instance = Translation.maybeOf(context);
    assert(instance != null,
        'No instance of Translation present in the widget tree. Did you add Translation.delegate in localizationsDelegates?');
    return instance!;
  }

  static Translation? maybeOf(BuildContext context) {
    return Localizations.of<Translation>(context, Translation);
  }

  /// `My Booking`
  String get my_booking {
    return Intl.message(
      'My Booking',
      name: 'my_booking',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Are You`
  String get areYou {
    return Intl.message(
      'Are You',
      name: 'areYou',
      desc: '',
      args: [],
    );
  }

  /// `Shop Owner`
  String get shopOwner {
    return Intl.message(
      'Shop Owner',
      name: 'shopOwner',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Owner`
  String get restaurantOwner {
    return Intl.message(
      'Restaurant Owner',
      name: 'restaurantOwner',
      desc: '',
      args: [],
    );
  }

  /// `Trainer`
  String get trainer {
    return Intl.message(
      'Trainer',
      name: 'trainer',
      desc: '',
      args: [],
    );
  }

  /// `Id Number`
  String get idNumber {
    return Intl.message(
      'Id Number',
      name: 'idNumber',
      desc: '',
      args: [],
    );
  }

  /// `CV`
  String get cV {
    return Intl.message(
      'CV',
      name: 'cV',
      desc: '',
      args: [],
    );
  }

  /// `Hour Rate`
  String get hourRate {
    return Intl.message(
      'Hour Rate',
      name: 'hourRate',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Name`
  String get restaurantName {
    return Intl.message(
      'Restaurant Name',
      name: 'restaurantName',
      desc: '',
      args: [],
    );
  }

  /// `Shop Name`
  String get shopName {
    return Intl.message(
      'Shop Name',
      name: 'shopName',
      desc: '',
      args: [],
    );
  }

  /// `Commercial registration number`
  String get commericalNumber {
    return Intl.message(
      'Commercial registration number',
      name: 'commericalNumber',
      desc: '',
      args: [],
    );
  }

  /// `Commercial registration file`
  String get commericalFile {
    return Intl.message(
      'Commercial registration file',
      name: 'commericalFile',
      desc: '',
      args: [],
    );
  }

  /// `The name of the restaurant manager`
  String get restaurantManagerName {
    return Intl.message(
      'The name of the restaurant manager',
      name: 'restaurantManagerName',
      desc: '',
      args: [],
    );
  }

  /// `The shop owner's name`
  String get shopManagerName {
    return Intl.message(
      'The shop owner\'s name',
      name: 'shopManagerName',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant owner's phone`
  String get restaurantPhoneNumber {
    return Intl.message(
      'Restaurant owner\'s phone',
      name: 'restaurantPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Shop owner's mobile number`
  String get shopPhoneNumber {
    return Intl.message(
      'Shop owner\'s mobile number',
      name: 'shopPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `City Name`
  String get cityName {
    return Intl.message(
      'City Name',
      name: 'cityName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Experience Certification`
  String get experienceCertification {
    return Intl.message(
      'Experience Certification',
      name: 'experienceCertification',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrder {
    return Intl.message(
      'My Orders',
      name: 'myOrder',
      desc: '',
      args: [],
    );
  }

  /// `Trainee`
  String get trainee {
    return Intl.message(
      'Trainee',
      name: 'trainee',
      desc: '',
      args: [],
    );
  }

  /// `Bouquet`
  String get bouquet {
    return Intl.message(
      'Bouquet',
      name: 'bouquet',
      desc: '',
      args: [],
    );
  }

  /// `Error Occured 😢`
  String get errorOccurred {
    return Intl.message(
      'Error Occured 😢',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `An error has been occurred, please click send to help us fixing the problem`
  String get reportError {
    return Intl.message(
      'An error has been occurred, please click send to help us fixing the problem',
      name: 'reportError',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred. Please try again later`
  String get generalErrorMessage {
    return Intl.message(
      'An error has occurred. Please try again later',
      name: 'generalErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Bad Request`
  String get badRequest {
    return Intl.message(
      'Bad Request',
      name: 'badRequest',
      desc: '',
      args: [],
    );
  }

  /// `Forbidden`
  String get forbidden {
    return Intl.message(
      'Forbidden',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `{url} not Found`
  String notFound(Object url) {
    return Intl.message(
      '$url not Found',
      name: 'notFound',
      desc: '',
      args: [url],
    );
  }

  /// `Conflict Error`
  String get conflictError {
    return Intl.message(
      'Conflict Error',
      name: 'conflictError',
      desc: '',
      args: [],
    );
  }

  /// `Connection time out`
  String get connectionTimeOut {
    return Intl.message(
      'Connection time out',
      name: 'connectionTimeOut',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred, please try again`
  String get unknownError {
    return Intl.message(
      'Unknown error occurred, please try again',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `The server encountered an internal error or misconfigurtion and was unable to complete your request.`
  String get internalServerErrorMessage {
    return Intl.message(
      'The server encountered an internal error or misconfigurtion and was unable to complete your request.',
      name: 'internalServerErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get connectionErrorMessage {
    return Intl.message(
      'Please check your internet connection',
      name: 'connectionErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `OOPS !`
  String get oopsErrorMessage {
    return Intl.message(
      'OOPS !',
      name: 'oopsErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get data`
  String get failedRefresher {
    return Intl.message(
      'Failed to get data',
      name: 'failedRefresher',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noDataRefresher {
    return Intl.message(
      'No data',
      name: 'noDataRefresher',
      desc: '',
      args: [],
    );
  }

  /// `This field can't be empty`
  String get errorTxt {
    return Intl.message(
      'This field can\'t be empty',
      name: 'errorTxt',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logOut {
    return Intl.message(
      'Logout',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Select a language, the application will restart`
  String get changeLangMessage {
    return Intl.message(
      'Select a language, the application will restart',
      name: 'changeLangMessage',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Press twice to exit`
  String get pressTwiceToExit {
    return Intl.message(
      'Press twice to exit',
      name: 'pressTwiceToExit',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message(
      'User name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number ex: 09xx-xxx-xxx`
  String get invalidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number ex: 09xx-xxx-xxx',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 5 characters long`
  String get invalidPassword {
    return Intl.message(
      'Must be at least 5 characters long',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Close App`
  String get closeApp {
    return Intl.message(
      'Close App',
      name: 'closeApp',
      desc: '',
      args: [],
    );
  }

  /// `Update Required`
  String get updateTitle {
    return Intl.message(
      'Update Required',
      name: 'updateTitle',
      desc: '',
      args: [],
    );
  }

  /// `For the best experience, update to the latest version to get new features and improvements.`
  String get updateMessage {
    return Intl.message(
      'For the best experience, update to the latest version to get new features and improvements.',
      name: 'updateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `The page has no content ..`
  String get pageEmpty {
    return Intl.message(
      'The page has no content ..',
      name: 'pageEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `An error happened while connecting to server, please try again later`
  String get responseError {
    return Intl.message(
      'An error happened while connecting to server, please try again later',
      name: 'responseError',
      desc: '',
      args: [],
    );
  }

  /// `The connection has been interrupted`
  String get errorCancelToken {
    return Intl.message(
      'The connection has been interrupted',
      name: 'errorCancelToken',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signUp {
    return Intl.message(
      'Signup',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password doesn't match`
  String get invalidConfirmPassword {
    return Intl.message(
      'Password and confirm password doesn\'t match',
      name: 'invalidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `This field mustn't be empty`
  String get errorEmptyField {
    return Intl.message(
      'This field mustn\'t be empty',
      name: 'errorEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Switch theme`
  String get switchTheme {
    return Intl.message(
      'Switch theme',
      name: 'switchTheme',
      desc: '',
      args: [],
    );
  }

  /// `Account Not Verified`
  String get accountNotVerifiedErrorMessage {
    return Intl.message(
      'Account Not Verified',
      name: 'accountNotVerifiedErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Operation has been cancelled`
  String get cancelErrorMessage {
    return Intl.message(
      'Operation has been cancelled',
      name: 'cancelErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `login Error Required`
  String get loginErrorRequired {
    return Intl.message(
      'login Error Required',
      name: 'loginErrorRequired',
      desc: '',
      args: [],
    );
  }

  /// `This page is empty`
  String get emptyScreen {
    return Intl.message(
      'This page is empty',
      name: 'emptyScreen',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Home Page`
  String get homePage {
    return Intl.message(
      'Home Page',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `Translation Test`
  String get translationTest {
    return Intl.message(
      'Translation Test',
      name: 'translationTest',
      desc: '',
      args: [],
    );
  }

  /// `Just Log`
  String get justLog {
    return Intl.message(
      'Just Log',
      name: 'justLog',
      desc: '',
      args: [],
    );
  }

  /// `Test Success Request`
  String get testSuccessRequest {
    return Intl.message(
      'Test Success Request',
      name: 'testSuccessRequest',
      desc: '',
      args: [],
    );
  }

  /// `Test Failure Request`
  String get testFailureRequest {
    return Intl.message(
      'Test Failure Request',
      name: 'testFailureRequest',
      desc: '',
      args: [],
    );
  }

  /// `Test Validator Request`
  String get testValidatorRequest {
    return Intl.message(
      'Test Validator Request',
      name: 'testValidatorRequest',
      desc: '',
      args: [],
    );
  }

  /// `Get People`
  String get getPeople {
    return Intl.message(
      'Get People',
      name: 'getPeople',
      desc: '',
      args: [],
    );
  }

  /// `Get Pokemons`
  String get getPokemons {
    return Intl.message(
      'Get Pokemons',
      name: 'getPokemons',
      desc: '',
      args: [],
    );
  }

  /// `Test Error Handler`
  String get testErrorScreen {
    return Intl.message(
      'Test Error Handler',
      name: 'testErrorScreen',
      desc: '',
      args: [],
    );
  }

  /// `Keep your fitness`
  String get keep_fitness {
    return Intl.message(
      'Keep your fitness',
      name: 'keep_fitness',
      desc: '',
      args: [],
    );
  }

  /// `We are here to help you keep your fitness\neffectively and simply with suitable prices`
  String get intro1_text {
    return Intl.message(
      'We are here to help you keep your fitness\neffectively and simply with suitable prices',
      name: 'intro1_text',
      desc: '',
      args: [],
    );
  }

  /// `lookup your favorite coach`
  String get lookup_coach {
    return Intl.message(
      'lookup your favorite coach',
      name: 'lookup_coach',
      desc: '',
      args: [],
    );
  }

  /// `we provide you with\nthe best coaches around the world`
  String get intro2_text {
    return Intl.message(
      'we provide you with\nthe best coaches around the world',
      name: 'intro2_text',
      desc: '',
      args: [],
    );
  }

  /// `Training daily`
  String get training_daily {
    return Intl.message(
      'Training daily',
      name: 'training_daily',
      desc: '',
      args: [],
    );
  }

  /// `loosing weight and building muscles\nthrough training and diet`
  String get intro3_text {
    return Intl.message(
      'loosing weight and building muscles\nthrough training and diet',
      name: 'intro3_text',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get next {
    return Intl.message(
      'next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `don't have an account?`
  String get no_account {
    return Intl.message(
      'don\'t have an account?',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get mail {
    return Intl.message(
      'Mail',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Sport Coaches`
  String get sport_coaches {
    return Intl.message(
      'Sport Coaches',
      name: 'sport_coaches',
      desc: '',
      args: [],
    );
  }

  /// `Gyms`
  String get gyms {
    return Intl.message(
      'Gyms',
      name: 'gyms',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants`
  String get restaurants {
    return Intl.message(
      'Restaurants',
      name: 'restaurants',
      desc: '',
      args: [],
    );
  }

  /// `Healthy\nRestaurants`
  String get healthy_restaurants {
    return Intl.message(
      'Healthy\nRestaurants',
      name: 'healthy_restaurants',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get stores {
    return Intl.message(
      'Stores',
      name: 'stores',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get see_all {
    return Intl.message(
      'See all',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Food Supplements`
  String get food_supplements {
    return Intl.message(
      'Food Supplements',
      name: 'food_supplements',
      desc: '',
      args: [],
    );
  }

  /// `Most Rated Coaches`
  String get most_rated_coaches {
    return Intl.message(
      'Most Rated Coaches',
      name: 'most_rated_coaches',
      desc: '',
      args: [],
    );
  }

  /// `you have an account`
  String get account_exist {
    return Intl.message(
      'you have an account',
      name: 'account_exist',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login2 {
    return Intl.message(
      'Login',
      name: 'login2',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signup2 {
    return Intl.message(
      'Signup',
      name: 'signup2',
      desc: '',
      args: [],
    );
  }

  /// `Accept on`
  String get accept_on {
    return Intl.message(
      'Accept on',
      name: 'accept_on',
      desc: '',
      args: [],
    );
  }

  /// `Terms of service`
  String get terms {
    return Intl.message(
      'Terms of service',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get following {
    return Intl.message(
      '',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `Verification code has been sent to your mobile`
  String get verification_code_sent {
    return Intl.message(
      'Verification code has been sent to your mobile',
      name: 'verification_code_sent',
      desc: '',
      args: [],
    );
  }

  /// `Please insert the Verification code to verify yout account`
  String get insert_verification_code {
    return Intl.message(
      'Please insert the Verification code to verify yout account',
      name: 'insert_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `verify account`
  String get account_verification {
    return Intl.message(
      'verify account',
      name: 'account_verification',
      desc: '',
      args: [],
    );
  }

  /// `verify`
  String get verify {
    return Intl.message(
      'verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `didn't receive the code?`
  String get no_code_received {
    return Intl.message(
      'didn\'t receive the code?',
      name: 'no_code_received',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resend_code {
    return Intl.message(
      'Resend code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Men`
  String get men {
    return Intl.message(
      'Men',
      name: 'men',
      desc: '',
      args: [],
    );
  }

  /// `Women`
  String get women {
    return Intl.message(
      'Women',
      name: 'women',
      desc: '',
      args: [],
    );
  }

  /// `Under 16`
  String get under_16 {
    return Intl.message(
      'Under 16',
      name: 'under_16',
      desc: '',
      args: [],
    );
  }

  /// `Coaches`
  String get coaches {
    return Intl.message(
      'Coaches',
      name: 'coaches',
      desc: '',
      args: [],
    );
  }

  /// `Search for coach`
  String get search_coach {
    return Intl.message(
      'Search for coach',
      name: 'search_coach',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Not Active`
  String get notActive {
    return Intl.message(
      'Not Active',
      name: 'notActive',
      desc: '',
      args: [],
    );
  }

  /// `The most popular courses`
  String get mostWantedCourses {
    return Intl.message(
      'The most popular courses',
      name: 'mostWantedCourses',
      desc: '',
      args: [],
    );
  }

  /// `Book now`
  String get book_now {
    return Intl.message(
      'Book now',
      name: 'book_now',
      desc: '',
      args: [],
    );
  }

  /// `Saudi riyal`
  String get saudi_riyal {
    return Intl.message(
      'Saudi riyal',
      name: 'saudi_riyal',
      desc: '',
      args: [],
    );
  }

  /// `Coach location`
  String get coach_location {
    return Intl.message(
      'Coach location',
      name: 'coach_location',
      desc: '',
      args: [],
    );
  }

  /// `Rating Average`
  String get rating_average {
    return Intl.message(
      'Rating Average',
      name: 'rating_average',
      desc: '',
      args: [],
    );
  }

  /// `Rate now`
  String get rate_now {
    return Intl.message(
      'Rate now',
      name: 'rate_now',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Course Subscription`
  String get course_subscription {
    return Intl.message(
      'Course Subscription',
      name: 'course_subscription',
      desc: '',
      args: [],
    );
  }

  /// `Subscription type`
  String get subscription_type {
    return Intl.message(
      'Subscription type',
      name: 'subscription_type',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Hours`
  String get weekly_hours {
    return Intl.message(
      'Weekly Hours',
      name: 'weekly_hours',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `Bill`
  String get bill {
    return Intl.message(
      'Bill',
      name: 'bill',
      desc: '',
      args: [],
    );
  }

  /// `Way of Payment`
  String get payment_way {
    return Intl.message(
      'Way of Payment',
      name: 'payment_way',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `What is your rating?`
  String get whats_ur_rating {
    return Intl.message(
      'What is your rating?',
      name: 'whats_ur_rating',
      desc: '',
      args: [],
    );
  }

  /// `What is your opinion?`
  String get whats_ur_opinion {
    return Intl.message(
      'What is your opinion?',
      name: 'whats_ur_opinion',
      desc: '',
      args: [],
    );
  }

  /// `Current Courses`
  String get current_courses {
    return Intl.message(
      'Current Courses',
      name: 'current_courses',
      desc: '',
      args: [],
    );
  }

  /// `Ended Courses`
  String get ended_courses {
    return Intl.message(
      'Ended Courses',
      name: 'ended_courses',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get payment_ways {
    return Intl.message(
      'Payment Methods',
      name: 'payment_ways',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get edit_profile {
    return Intl.message(
      'Edit profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get date_of_birth {
    return Intl.message(
      'Date of birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `BMI`
  String get bmi {
    return Intl.message(
      'BMI',
      name: 'bmi',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enter_phone_number {
    return Intl.message(
      'Enter phone number',
      name: 'enter_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `enter valid phone number`
  String get enter_valid_phone {
    return Intl.message(
      'enter valid phone number',
      name: 'enter_valid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enter_password {
    return Intl.message(
      'Enter password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter password of 8 characters or more`
  String get enter_valid_password {
    return Intl.message(
      'Enter password of 8 characters or more',
      name: 'enter_valid_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter confirm password`
  String get enter_confirm_password {
    return Intl.message(
      'Enter confirm password',
      name: 'enter_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `passwords don't match`
  String get passwords_not_match {
    return Intl.message(
      'passwords don\'t match',
      name: 'passwords_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Enter pin code`
  String get enter_pin_code {
    return Intl.message(
      'Enter pin code',
      name: 'enter_pin_code',
      desc: '',
      args: [],
    );
  }

  /// `Accept terms and conditions`
  String get accept_terms_conditions {
    return Intl.message(
      'Accept terms and conditions',
      name: 'accept_terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Registered successfully`
  String get account_created_successfully {
    return Intl.message(
      'Registered successfully',
      name: 'account_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get password_changed_successfully {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Account verified successfully`
  String get account_verified_successfully {
    return Intl.message(
      'Account verified successfully',
      name: 'account_verified_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Go to`
  String get goto {
    return Intl.message(
      'Go to',
      name: 'goto',
      desc: '',
      args: [],
    );
  }

  /// `Account settings`
  String get account_settings {
    return Intl.message(
      'Account settings',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `App settings`
  String get app_settings {
    return Intl.message(
      'App settings',
      name: 'app_settings',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Dishes`
  String get dishes {
    return Intl.message(
      'Dishes',
      name: 'dishes',
      desc: '',
      args: [],
    );
  }

  /// `Supplements Shops`
  String get supplements_shops {
    return Intl.message(
      'Supplements Shops',
      name: 'supplements_shops',
      desc: '',
      args: [],
    );
  }

  /// `Supplements`
  String get supplements {
    return Intl.message(
      'Supplements',
      name: 'supplements',
      desc: '',
      args: [],
    );
  }

  /// `My orders`
  String get my_orders {
    return Intl.message(
      'My orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `About app`
  String get about_app {
    return Intl.message(
      'About app',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Enable notifications`
  String get enable_notifications {
    return Intl.message(
      'Enable notifications',
      name: 'enable_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Please insert a value`
  String get insert_value {
    return Intl.message(
      'Please insert a value',
      name: 'insert_value',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get no_data_found {
    return Intl.message(
      'No data found',
      name: 'no_data_found',
      desc: '',
      args: [],
    );
  }

  /// `Filter by`
  String get filter_by {
    return Intl.message(
      'Filter by',
      name: 'filter_by',
      desc: '',
      args: [],
    );
  }

  /// `Coach's Rate`
  String get coach_rate {
    return Intl.message(
      'Coach\'s Rate',
      name: 'coach_rate',
      desc: '',
      args: [],
    );
  }

  /// `Most rated`
  String get most_rated {
    return Intl.message(
      'Most rated',
      name: 'most_rated',
      desc: '',
      args: [],
    );
  }

  /// `Least rated`
  String get least_rated {
    return Intl.message(
      'Least rated',
      name: 'least_rated',
      desc: '',
      args: [],
    );
  }

  /// `Coach address`
  String get coach_address {
    return Intl.message(
      'Coach address',
      name: 'coach_address',
      desc: '',
      args: [],
    );
  }

  /// `Nearest`
  String get nearest {
    return Intl.message(
      'Nearest',
      name: 'nearest',
      desc: '',
      args: [],
    );
  }

  /// `Farthest`
  String get farthest {
    return Intl.message(
      'Farthest',
      name: 'farthest',
      desc: '',
      args: [],
    );
  }

  /// `Coach Specialization`
  String get coach_specialization {
    return Intl.message(
      'Coach Specialization',
      name: 'coach_specialization',
      desc: '',
      args: [],
    );
  }

  /// `Apply Filter`
  String get apply_filter {
    return Intl.message(
      'Apply Filter',
      name: 'apply_filter',
      desc: '',
      args: [],
    );
  }

  /// `current_password`
  String get current_password {
    return Intl.message(
      'current_password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Successfully`
  String get password_changed {
    return Intl.message(
      'Password Changed Successfully',
      name: 'password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Image is not available!`
  String get image_not_available {
    return Intl.message(
      'Image is not available!',
      name: 'image_not_available',
      desc: '',
      args: [],
    );
  }

  /// `Video is not available!`
  String get video_not_available {
    return Intl.message(
      'Video is not available!',
      name: 'video_not_available',
      desc: '',
      args: [],
    );
  }

  /// `My Course Details`
  String get my_course_details {
    return Intl.message(
      'My Course Details',
      name: 'my_course_details',
      desc: '',
      args: [],
    );
  }

  /// `Course Statistics`
  String get course_statistic {
    return Intl.message(
      'Course Statistics',
      name: 'course_statistic',
      desc: '',
      args: [],
    );
  }

  /// `Coach Name`
  String get coach {
    return Intl.message(
      'Coach Name',
      name: 'coach',
      desc: '',
      args: [],
    );
  }

  /// `Course Hours`
  String get hoursNumber {
    return Intl.message(
      'Course Hours',
      name: 'hoursNumber',
      desc: '',
      args: [],
    );
  }

  /// `Finished Hours`
  String get finishedHour {
    return Intl.message(
      'Finished Hours',
      name: 'finishedHour',
      desc: '',
      args: [],
    );
  }

  /// `remaining Hours`
  String get remainsHours {
    return Intl.message(
      'remaining Hours',
      name: 'remainsHours',
      desc: '',
      args: [],
    );
  }

  /// `Absence Days`
  String get numberOfAbsenece {
    return Intl.message(
      'Absence Days',
      name: 'numberOfAbsenece',
      desc: '',
      args: [],
    );
  }

  /// `riyal/hour`
  String get pricePerHour {
    return Intl.message(
      'riyal/hour',
      name: 'pricePerHour',
      desc: '',
      args: [],
    );
  }

  /// `my files`
  String get myFiles {
    return Intl.message(
      'my files',
      name: 'myFiles',
      desc: '',
      args: [],
    );
  }

  /// `cv`
  String get cv {
    return Intl.message(
      'cv',
      name: 'cv',
      desc: '',
      args: [],
    );
  }

  /// `certificate`
  String get certificate {
    return Intl.message(
      'certificate',
      name: 'certificate',
      desc: '',
      args: [],
    );
  }

  /// `The most popular dishes`
  String get dishsMostOrder {
    return Intl.message(
      'The most popular dishes',
      name: 'dishsMostOrder',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message(
      'Chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `The new trainees`
  String get new_trainees {
    return Intl.message(
      'The new trainees',
      name: 'new_trainees',
      desc: '',
      args: [],
    );
  }

  /// `No Trainers`
  String get no_trainers {
    return Intl.message(
      'No Trainers',
      name: 'no_trainers',
      desc: '',
      args: [],
    );
  }

  /// `Trainees`
  String get trainees {
    return Intl.message(
      'Trainees',
      name: 'trainees',
      desc: '',
      args: [],
    );
  }

  /// `No Courses`
  String get no_courses {
    return Intl.message(
      'No Courses',
      name: 'no_courses',
      desc: '',
      args: [],
    );
  }

  /// `Not Active`
  String get not_active {
    return Intl.message(
      'Not Active',
      name: 'not_active',
      desc: '',
      args: [],
    );
  }

  /// `pending`
  String get pending {
    return Intl.message(
      'pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get expired {
    return Intl.message(
      'Expired',
      name: 'expired',
      desc: '',
      args: [],
    );
  }

  /// `Choose Category`
  String get choose_category {
    return Intl.message(
      'Choose Category',
      name: 'choose_category',
      desc: '',
      args: [],
    );
  }

  /// `Enter Price`
  String get enter_course_price {
    return Intl.message(
      'Enter Price',
      name: 'enter_course_price',
      desc: '',
      args: [],
    );
  }

  /// `plesae choose course image`
  String get choose_course_img {
    return Intl.message(
      'plesae choose course image',
      name: 'choose_course_img',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Course Price`
  String get cource {
    return Intl.message(
      'Course Price',
      name: 'cource',
      desc: '',
      args: [],
    );
  }

  /// `Enter only numbers`
  String get enter_num_only {
    return Intl.message(
      'Enter only numbers',
      name: 'enter_num_only',
      desc: '',
      args: [],
    );
  }

  /// `Enter Only english letters`
  String get enter_eng_letters {
    return Intl.message(
      'Enter Only english letters',
      name: 'enter_eng_letters',
      desc: '',
      args: [],
    );
  }

  /// `Enter only arabic letters`
  String get enter_at_letters {
    return Intl.message(
      'Enter only arabic letters',
      name: 'enter_at_letters',
      desc: '',
      args: [],
    );
  }

  /// `Enter Details In English`
  String get course_details_en {
    return Intl.message(
      'Enter Details In English',
      name: 'course_details_en',
      desc: '',
      args: [],
    );
  }

  /// `Enter Details In Arabic`
  String get course_details_ar {
    return Intl.message(
      'Enter Details In Arabic',
      name: 'course_details_ar',
      desc: '',
      args: [],
    );
  }

  /// `Enter Discount percentage`
  String get discount_perc {
    return Intl.message(
      'Enter Discount percentage',
      name: 'discount_perc',
      desc: '',
      args: [],
    );
  }

  /// `Enter Hours Number`
  String get hours_num {
    return Intl.message(
      'Enter Hours Number',
      name: 'hours_num',
      desc: '',
      args: [],
    );
  }

  /// `Attach course-related images`
  String get enter_related_img {
    return Intl.message(
      'Attach course-related images',
      name: 'enter_related_img',
      desc: '',
      args: [],
    );
  }

  /// `Enter Course Name In English`
  String get en_course_name {
    return Intl.message(
      'Enter Course Name In English',
      name: 'en_course_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Course Name In Arabic`
  String get ar_course_name {
    return Intl.message(
      'Enter Course Name In Arabic',
      name: 'ar_course_name',
      desc: '',
      args: [],
    );
  }

  /// `Add Course`
  String get add_course {
    return Intl.message(
      'Add Course',
      name: 'add_course',
      desc: '',
      args: [],
    );
  }

  /// `wanna talk with your trainees?`
  String get chat_with_your_trainers {
    return Intl.message(
      'wanna talk with your trainees?',
      name: 'chat_with_your_trainers',
      desc: '',
      args: [],
    );
  }

  /// `The Course Added Successfully`
  String get course_added_success {
    return Intl.message(
      'The Course Added Successfully',
      name: 'course_added_success',
      desc: '',
      args: [],
    );
  }

  /// `Go To My Courses`
  String get goto_my_courses {
    return Intl.message(
      'Go To My Courses',
      name: 'goto_my_courses',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email Format`
  String get invalid_email {
    return Intl.message(
      'Invalid Email Format',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant`
  String get restaurant {
    return Intl.message(
      'Restaurant',
      name: 'restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant name in arabic`
  String get rest_name_ar {
    return Intl.message(
      'Restaurant name in arabic',
      name: 'rest_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant name in english`
  String get rest_name_en {
    return Intl.message(
      'Restaurant name in english',
      name: 'rest_name_en',
      desc: '',
      args: [],
    );
  }

  /// `The Logo in arabic`
  String get logo_ar {
    return Intl.message(
      'The Logo in arabic',
      name: 'logo_ar',
      desc: '',
      args: [],
    );
  }

  /// `The Logo in english`
  String get logo_en {
    return Intl.message(
      'The Logo in english',
      name: 'logo_en',
      desc: '',
      args: [],
    );
  }

  /// `The image cover in english`
  String get cover_en {
    return Intl.message(
      'The image cover in english',
      name: 'cover_en',
      desc: '',
      args: [],
    );
  }

  /// `The image cover in arabic`
  String get cover_ar {
    return Intl.message(
      'The image cover in arabic',
      name: 'cover_ar',
      desc: '',
      args: [],
    );
  }

  /// `Select your location on the map`
  String get select_your_location {
    return Intl.message(
      'Select your location on the map',
      name: 'select_your_location',
      desc: '',
      args: [],
    );
  }

  /// `Social media links`
  String get social_media_links {
    return Intl.message(
      'Social media links',
      name: 'social_media_links',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shop {
    return Intl.message(
      'Shop',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Shop name in arabic`
  String get shop_name_ar {
    return Intl.message(
      'Shop name in arabic',
      name: 'shop_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Shop name in english`
  String get shop_name_en {
    return Intl.message(
      'Shop name in english',
      name: 'shop_name_en',
      desc: '',
      args: [],
    );
  }

  /// `please pick all the required images and files`
  String get please_pick_all_img_files {
    return Intl.message(
      'please pick all the required images and files',
      name: 'please_pick_all_img_files',
      desc: '',
      args: [],
    );
  }

  /// `Please Write The OTP`
  String get please_enter_otp {
    return Intl.message(
      'Please Write The OTP',
      name: 'please_enter_otp',
      desc: '',
      args: [],
    );
  }

  /// `My Courses`
  String get my_courses {
    return Intl.message(
      'My Courses',
      name: 'my_courses',
      desc: '',
      args: [],
    );
  }

  /// `Subscription Plans`
  String get subscription_plans {
    return Intl.message(
      'Subscription Plans',
      name: 'subscription_plans',
      desc: '',
      args: [],
    );
  }

  /// `approved`
  String get approved {
    return Intl.message(
      'approved',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `cancelled`
  String get cancelled {
    return Intl.message(
      'cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Subscribers`
  String get subscribers {
    return Intl.message(
      'Subscribers',
      name: 'subscribers',
      desc: '',
      args: [],
    );
  }

  /// `Max subscribers`
  String get max_subscribers {
    return Intl.message(
      'Max subscribers',
      name: 'max_subscribers',
      desc: '',
      args: [],
    );
  }

  /// `Remaining duration`
  String get remaining_duration {
    return Intl.message(
      'Remaining duration',
      name: 'remaining_duration',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `No Trainees`
  String get no_trainees {
    return Intl.message(
      'No Trainees',
      name: 'no_trainees',
      desc: '',
      args: [],
    );
  }

  /// `The link is invalid`
  String get link_invalid {
    return Intl.message(
      'The link is invalid',
      name: 'link_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Manager email`
  String get manager_email {
    return Intl.message(
      'Manager email',
      name: 'manager_email',
      desc: '',
      args: [],
    );
  }

  /// `Manager password`
  String get manager_password {
    return Intl.message(
      'Manager password',
      name: 'manager_password',
      desc: '',
      args: [],
    );
  }

  /// `Manager Phone Number`
  String get manager_phone {
    return Intl.message(
      'Manager Phone Number',
      name: 'manager_phone',
      desc: '',
      args: [],
    );
  }

  /// `Search for any chat`
  String get search_for_chat {
    return Intl.message(
      'Search for any chat',
      name: 'search_for_chat',
      desc: '',
      args: [],
    );
  }

  /// `Subscription plan`
  String get subscription_plan {
    return Intl.message(
      'Subscription plan',
      name: 'subscription_plan',
      desc: '',
      args: [],
    );
  }

  /// `Add a Dish`
  String get add_a_dish {
    return Intl.message(
      'Add a Dish',
      name: 'add_a_dish',
      desc: '',
      args: [],
    );
  }

  /// `Dish Name in Arabic`
  String get dish_name_in_arabic {
    return Intl.message(
      'Dish Name in Arabic',
      name: 'dish_name_in_arabic',
      desc: '',
      args: [],
    );
  }

  /// `Dish Name in English`
  String get dish_name_in_english {
    return Intl.message(
      'Dish Name in English',
      name: 'dish_name_in_english',
      desc: '',
      args: [],
    );
  }

  /// `Attach an Illustrative Image of the Dish`
  String get attach_an_illustrative_image_of_the_dish {
    return Intl.message(
      'Attach an Illustrative Image of the Dish',
      name: 'attach_an_illustrative_image_of_the_dish',
      desc: '',
      args: [],
    );
  }

  /// `Choose the Category`
  String get choose_the_category {
    return Intl.message(
      'Choose the Category',
      name: 'choose_the_category',
      desc: '',
      args: [],
    );
  }

  /// `Dish Price`
  String get dish_price {
    return Intl.message(
      'Dish Price',
      name: 'dish_price',
      desc: '',
      args: [],
    );
  }

  /// `Dish Components in Arabic`
  String get dish_components_in_arabic {
    return Intl.message(
      'Dish Components in Arabic',
      name: 'dish_components_in_arabic',
      desc: '',
      args: [],
    );
  }

  /// `Dish Components in English`
  String get dish_components_in_english {
    return Intl.message(
      'Dish Components in English',
      name: 'dish_components_in_english',
      desc: '',
      args: [],
    );
  }

  /// `complete the data`
  String get complete_data {
    return Intl.message(
      'complete the data',
      name: 'complete_data',
      desc: '',
      args: [],
    );
  }

  /// `Details in arabic`
  String get details_in_arabic {
    return Intl.message(
      'Details in arabic',
      name: 'details_in_arabic',
      desc: '',
      args: [],
    );
  }

  /// `Details in english`
  String get details_in_english {
    return Intl.message(
      'Details in english',
      name: 'details_in_english',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get add_Product {
    return Intl.message(
      'Add Product',
      name: 'add_Product',
      desc: '',
      args: [],
    );
  }

  /// `Product Name in Arabic`
  String get product_Name_Arabic {
    return Intl.message(
      'Product Name in Arabic',
      name: 'product_Name_Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Product Name in English`
  String get product_Name_English {
    return Intl.message(
      'Product Name in English',
      name: 'product_Name_English',
      desc: '',
      args: [],
    );
  }

  /// `Attach an Image Representing the Product`
  String get attach_Image_Product {
    return Intl.message(
      'Attach an Image Representing the Product',
      name: 'attach_Image_Product',
      desc: '',
      args: [],
    );
  }

  /// `Product Price`
  String get product_price {
    return Intl.message(
      'Product Price',
      name: 'product_price',
      desc: '',
      args: [],
    );
  }

  /// `Product Ingredients in Arabic`
  String get product_ingred_ar {
    return Intl.message(
      'Product Ingredients in Arabic',
      name: 'product_ingred_ar',
      desc: '',
      args: [],
    );
  }

  /// `Product Ingredients in English`
  String get product_ingred_en {
    return Intl.message(
      'Product Ingredients in English',
      name: 'product_ingred_en',
      desc: '',
      args: [],
    );
  }

  /// `The most wanted products`
  String get most_wanted_products {
    return Intl.message(
      'The most wanted products',
      name: 'most_wanted_products',
      desc: '',
      args: [],
    );
  }

  /// `My products`
  String get my_products {
    return Intl.message(
      'My products',
      name: 'my_products',
      desc: '',
      args: [],
    );
  }

  /// `My plates`
  String get my_plates {
    return Intl.message(
      'My plates',
      name: 'my_plates',
      desc: '',
      args: [],
    );
  }

  /// `change`
  String get change {
    return Intl.message(
      'change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get old_pass {
    return Intl.message(
      'Old Password',
      name: 'old_pass',
      desc: '',
      args: [],
    );
  }

  /// `Every year`
  String get every_year {
    return Intl.message(
      'Every year',
      name: 'every_year',
      desc: '',
      args: [],
    );
  }

  /// `Free Subscription`
  String get free_susbcription {
    return Intl.message(
      'Free Subscription',
      name: 'free_susbcription',
      desc: '',
      args: [],
    );
  }

  /// `Your dish has been added successfully`
  String get dish_added_succ {
    return Intl.message(
      'Your dish has been added successfully',
      name: 'dish_added_succ',
      desc: '',
      args: [],
    );
  }

  /// `Go to my dishes`
  String get go_to_my_dishes {
    return Intl.message(
      'Go to my dishes',
      name: 'go_to_my_dishes',
      desc: '',
      args: [],
    );
  }

  /// `Number of orders`
  String get num_orders {
    return Intl.message(
      'Number of orders',
      name: 'num_orders',
      desc: '',
      args: [],
    );
  }

  /// `Your product has been added successfully`
  String get product_added_succ {
    return Intl.message(
      'Your product has been added successfully',
      name: 'product_added_succ',
      desc: '',
      args: [],
    );
  }

  /// `Go to my products`
  String get go_to_my_products {
    return Intl.message(
      'Go to my products',
      name: 'go_to_my_products',
      desc: '',
      args: [],
    );
  }

  /// `Start training`
  String get start_training {
    return Intl.message(
      'Start training',
      name: 'start_training',
      desc: '',
      args: [],
    );
  }

  /// `Add new values`
  String get add_values {
    return Intl.message(
      'Add new values',
      name: 'add_values',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get day {
    return Intl.message(
      'day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Fat percentage`
  String get fat_perct {
    return Intl.message(
      'Fat percentage',
      name: 'fat_perct',
      desc: '',
      args: [],
    );
  }

  /// `Trainee at`
  String get trainee_at {
    return Intl.message(
      'Trainee at',
      name: 'trainee_at',
      desc: '',
      args: [],
    );
  }

  /// `CM`
  String get cm {
    return Intl.message(
      'CM',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `KG`
  String get kg {
    return Intl.message(
      'KG',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Changes in BMI`
  String get changes_in_bmi {
    return Intl.message(
      'Changes in BMI',
      name: 'changes_in_bmi',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `{name} has left the call. If you need anything, feel free to reach out. See you!`
  String the_member_left_the_call(Object name) {
    return Intl.message(
      '$name has left the call. If you need anything, feel free to reach out. See you!',
      name: 'the_member_left_the_call',
      desc: '',
      args: [name],
    );
  }

  /// `{name} declined the call `
  String the_member_decline_the_call(Object name) {
    return Intl.message(
      '$name declined the call ',
      name: 'the_member_decline_the_call',
      desc: '',
      args: [name],
    );
  }

  /// `Delete Account`
  String get delete_acc {
    return Intl.message(
      'Delete Account',
      name: 'delete_acc',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get delete_acc_dialog_content {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'delete_acc_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Check your Email`
  String get check_email {
    return Intl.message(
      'Check your Email',
      name: 'check_email',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Translation> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Translation> load(Locale locale) => Translation.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
