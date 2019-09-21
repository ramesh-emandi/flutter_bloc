
import 'package:flutter_bloc/repository/local_repository/LocalRepositoryImpl.dart';
import 'package:flutter_bloc/repository/local_repository/local_repository.dart';
import 'package:flutter_bloc/repository/modal/album.dart';
import 'package:flutter_bloc/repository/remote_repository/remote_repository.dart';
import 'package:flutter_bloc/repository/remote_repository/remote_repository_impl.dart';
import 'package:flutter_bloc/repository/repository.dart';

import 'modal/user.dart';

class RepositoryImpl implements Repository{
  RemoteRepository _remoteRepository = RemoteRepositoryImpl();
  LocalRepository _localRepository = LocalRepositoryImpl();

  @override
  Future<List<User>> getUserList() {
    return _remoteRepository.getUserList();
  }

  @override
  Future<List<AlbumImage>> getAlbumImage() {
    return _remoteRepository.getAlbumImage();
  }
}