import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvmproviders/view/user/viewmodel/users_view_model.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(usersViewModel.selectedUser.name!),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(usersViewModel.selectedUser.name!),
            SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.email!,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.phone!,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.website!,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              usersViewModel.selectedUser.address!.street!,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              usersViewModel.selectedUser.address!.city!,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
