import 'package:flutter/material.dart';

/// A helper class for navigation operations within the app.
abstract class NavigationHelper {
  /// Navigates to the specified [screen] using the standard push navigation.
  ///
  /// This method pushes the specified [screen] widget onto the navigation stack, allowing the user to
  /// navigate back to the previous screen using the system's back button or the AppBar's back button.
  ///
  /// The [screen] parameter is required and should be a valid [Widget] representing the destination screen.
  static goto({required Widget screen, required BuildContext context}) =>
      Navigator.push(
          context, // Retrieves the current BuildContext to initiate the navigation.
          MaterialPageRoute(builder: (context) => screen)
          // Builds the route with the specified screen.
          );

  /// Navigates to the specified [screen] using the push replacement navigation.
  ///
  /// This method replaces the current screen in the navigation stack with the specified [screen],
  /// ensuring that the user cannot navigate back to the previous screen using the system's back button or the AppBar's back button.
  ///
  /// The [screen] parameter is required and should be a valid [Widget] representing the destination screen.
  static gotoReplacement(
          {required Widget screen, required BuildContext context}) =>
      Navigator.pushReplacement(
          context, // Retrieves the current BuildContext to initiate the navigation.
          MaterialPageRoute(builder: (context) => screen)
          // Builds the route with the specified screen.
          );
  static gotoAndRemove(
          {required Widget screen, required BuildContext context}) =>
      Navigator.pushAndRemoveUntil(
        context, // Retrieves the current BuildContext to initiate the navigation.
        MaterialPageRoute(builder: (context) => screen)
        // Builds the route with the specified screen.
        ,
        (route) => false,
      );

  static pop(BuildContext context) => Navigator.pop(context);
}
