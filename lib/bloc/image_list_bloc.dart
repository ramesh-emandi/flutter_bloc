import 'package:flutter_bloc/bloc/block_base.dart';
import 'package:flutter_bloc/repository/modal/album.dart';
import 'package:flutter_bloc/repository/modal/user.dart';
import 'package:flutter_bloc/repository/repository.dart';
import 'package:flutter_bloc/repository/repository_impl.dart';

class ImageListBloc implements BlocBase {

  Repository _repository;
  //user future or streams for content delivery

  @override
  void init() {
    _repository = RepositoryImpl();
  }

  Future<List<AlbumImage>> getAlbumImage() {
    return _repository.getAlbumImage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}
