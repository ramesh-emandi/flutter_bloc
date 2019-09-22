import 'package:flutter_bloc/repository/modal/result.dart';
import 'package:flutter_bloc/repository/modal/user.dart';
import 'package:http/http.dart';

abstract class RemoteRepository {
  setClient(Client client);
  Future<List<User>> getUserList();
  Future<Result> getAlbumImage();
}
