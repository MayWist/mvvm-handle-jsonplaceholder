import 'package:flutter/material.dart';
import 'package:test_mvvmproviders/view/user/view/user_details_screen.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/UserDetailsScreen': (BuildContext context) => UserDetailsScreen(),
  };
}
