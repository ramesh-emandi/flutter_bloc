import 'package:flutter/material.dart';
import 'user_list_widget.dart';

main() {
  runApp(UserListScreen());
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(),
        body: UserListWidget(),
      ),
    );
  }
}
