import 'package:flutter_bloc/repository/local_repository/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository{
  @override
  String getUserEmailAddress() {

    return "ramesh@gmail.com";
  }

  @override
  String getUserPassword() {

    return "secret";
  }

}