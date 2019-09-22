import 'package:flutter_bloc/repository/modal/album.dart';
import 'package:flutter_bloc/repository/modal/result.dart';
import 'package:flutter_bloc/repository/modal/user.dart';

abstract class RemoteRepository {
  Future<List<User>> getUserList();
  Future<Result> getAlbumImage();
}
