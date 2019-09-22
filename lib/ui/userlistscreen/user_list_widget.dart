import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/image_list_bloc.dart';
import 'package:flutter_bloc/bloc/user_list_bloc.dart';
import 'package:flutter_bloc/repository/modal/album.dart';
import 'package:flutter_bloc/repository/modal/result.dart';
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
    _bloc.getAlbumImage();
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
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: _bloc.listenTextChange,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
            if(snapshot.hasData) {
              return Text(snapshot.data.toString());
            }else {
              return Text("");
            }

          }),
          TextField(
            decoration: InputDecoration(hintText: "Enter text"),
            onChanged: (value){
            _bloc.addText(value);
            },
          )
        ],
      )
//      StreamBuilder(
//          stream: _bloc.getImageStream,
//          builder:
//              (BuildContext context, AsyncSnapshot<Result> snapshot) {
//            if(snapshot.data is SuccessState) {
//              List<AlbumImage> images = (snapshot.data as SuccessState).msg;
//              return ListView.builder(
//                  itemCount: images.length,
//                  itemBuilder: (BuildContext context, int index) {
//                    return Card(
//                      elevation: 3.0,
//                      child: ListTile(
//                        title: Text(images[index].title),
//                        leading: Image.network(images[index].thumbnailUrl),
//                      ),
//                    );
//                  });
//            } else if (snapshot.data is ErrorState) {
//              String message = (snapshot.data as ErrorState).msg;
//              return Text(message);
//            } else {
//              return CircularProgressIndicator();
//            }
//          }),
    );
  }
}
