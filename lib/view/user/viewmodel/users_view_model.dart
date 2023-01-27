import 'package:flutter/material.dart';
import 'package:test_mvvmproviders/view/user/model/user_error.dart';
import 'package:test_mvvmproviders/view/user/model/user_model.dart';
import 'package:test_mvvmproviders/view/user/repo/api_status.dart';
import 'package:test_mvvmproviders/view/user/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError = null;
  late UserModel _selectedUser;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel get selectedUser => _selectedUser;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
