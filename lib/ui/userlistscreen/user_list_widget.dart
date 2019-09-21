import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/image_list_bloc.dart';
import 'package:flutter_bloc/bloc/user_list_bloc.dart';
import 'package:flutter_bloc/repository/modal/album.dart';
import 'package:flutter_bloc/repository/modal/user.dart';

class UserListWidget extends StatefulWidget {
  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
//  UserListBloc _bloc = UserListBloc();

  ImageListBloc _bloc = ImageListBloc();

  @override
  void initState() {
    _bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _bloc.getAlbumImage(),
          builder:
              (BuildContext context, AsyncSnapshot<List<AlbumImage>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 3.0,
                      child: ListTile(
                        title: Text(snapshot.data[index].title),
                        leading: Image.network(snapshot.data[index].thumbnailUrl),
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
