import 'package:flutter/material.dart';

class MyRouter {
  static Future<T?> push<T>(BuildContext context, Widget page) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void pushNamed(BuildContext context, String page) {
    Navigator.of(context).pushNamed(page);
  }

  static Future popAndPush<T>(BuildContext context, Widget page) {
    pop(context);
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void popsAndPush(BuildContext context, Widget page) {
    pops(context);
    push(context, page);
  }

  static void replace(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (context) => page),
    );
  }

  static void makeFirst(BuildContext context, Widget page) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (context) => page),
    );
  }

  static void pop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  static void pops(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    }
  }

  static void dismissAlert(context) {
    Navigator.of(context).pop();
  }

  static void navigate(BuildContext context, String page) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Navigator.of(context).pushReplacementNamed(page);
  }

  static void pushRemove(BuildContext context, String page) {
    // Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false)
  }
}
