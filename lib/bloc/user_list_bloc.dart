import 'package:flutter_bloc/bloc/block_base.dart';
import 'package:flutter_bloc/repository/modal/user.dart';
import 'package:flutter_bloc/repository/repository.dart';
import 'package:flutter_bloc/repository/repository_impl.dart';

class UserListBloc implements BlocBase {

  Repository _repository;
  //user future or streams for content delivery

  @override
  void init() {
    _repository = RepositoryImpl();
  }

  Future<List<User>> getUserList() {
    return _repository.getUserList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}
