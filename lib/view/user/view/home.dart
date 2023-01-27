import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvmproviders/components/app_error.dart';
import 'package:test_mvvmproviders/components/app_loading.dart';
import 'package:test_mvvmproviders/view/user/model/user_model.dart';
import 'package:test_mvvmproviders/view/user/viewmodel/users_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {
              // openAddUser(context);
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () async {
              // usersViewModel.getUsers();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(usersViewModel),
          ],
        ),
      ),
    );
  }

//กำหนดการแสดงผล
  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    final userError = usersViewModel.userError;
    if (userError != null) {
      return AppError(
        errortxt: userError.message,
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.userListModel[index];
          return ListTile(
            title: Text(userModel.name.toString()),
            subtitle: Text(userModel.email.toString()),
            onTap: () async {
              usersViewModel.setSelectedUser(userModel);
              Navigator.pushNamed(context, "/UserDetailsScreen");
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: usersViewModel.userListModel.length,
      ),
    );
  }
}
