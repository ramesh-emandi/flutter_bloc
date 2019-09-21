import 'package:flutter_bloc/repository/modal/album.dart';
import 'package:flutter_bloc/repository/modal/user.dart';
import 'package:flutter_bloc/repository/remote_repository/remote_repository.dart';
import 'package:http/http.dart';
import 'dart:convert';

class RemoteRepositoryImpl implements RemoteRepository{

  var client = Client();
  
  @override
  Future<List<User>> getUserList() async{

    Response resp= await client.get("https://jsonplaceholder.typicode.com/users");
    if(resp.statusCode == 200) {
      return userFromJson(resp.body);
    }
    else {
      return null;
    }
  }

  @override
  Future<List<AlbumImage>> getAlbumImage() async{

    Response resp= await client.get("https://jsonplaceholder.typicode.com/photos");
    if(resp.statusCode == 200) {
      return albumImageFromJson(resp.body);
    }
    else {
      return null;
    }
  }

}