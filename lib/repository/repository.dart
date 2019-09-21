import 'package:flutter_bloc/repository/modal/album.dart';

import 'modal/user.dart';

abstract class Repository {
  Future<List<User>> getUserList();
  Future<List<AlbumImage>> getAlbumImage();
}