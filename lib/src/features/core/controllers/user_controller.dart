import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/models/user_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _userRepository = Get.put(UserRepository());

  List<UserModel> fakeUsers = List<UserModel>.generate(50,  (index) => UserModel(id: index.toString(), email: '${index}nguyen.ifzas@gmail.com', password: ''));

  getUserData(String email) async {
    return await _userRepository.getUser(email);
  }

  Future<List<UserModel>> getUsers() async {
    return await _userRepository.getUsers();
  }

  void removeUser(String id) {
    _userRepository.removeUser(id);
  }
}
