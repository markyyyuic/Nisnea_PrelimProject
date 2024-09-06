import 'package:collection/collection.dart';
import 'package:prelim_project/models/user_model.dart';


class UserService {
  final List<User> _user = [];

  List<User> getUsers() => _user;

  void addUser(User users){
    _user.add(users);
  }


  User? getUserByID(String id){
    return _user.firstWhereOrNull((user) => user.id == id);
  }

}