import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvmproviders/routes/navigate.dart';
import 'package:test_mvvmproviders/view/user/view/home.dart';
import 'package:test_mvvmproviders/view/user/viewmodel/users_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersViewModel()),
      ],
      child: MaterialApp(
        title: 'MVVM + Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: Navigate.routes,
      ),
    );
  }
}
