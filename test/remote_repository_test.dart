// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/repository/modal/album.dart';
import 'package:flutter_bloc/repository/modal/result.dart';
import 'package:flutter_bloc/repository/remote_repository/remote_repository.dart';
import 'package:flutter_bloc/repository/remote_repository/remote_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_bloc/ui/userlistscreen/user_list_screen.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import 'mocked_client.dart';

void main() {
//  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(UserListScreen());
//
//    // Verify that our counter starts at 0.
//    expect(find.text('0'), findsOneWidget);
//    expect(find.text('1'), findsNothing);
//
//    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();
//
//    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('1'), findsOneWidget);
//  });

  test("Testing network Success", () async{
    RemoteRepository _repository = RemoteRepositoryImpl();
    var mockedClient = MockedClient();
    _repository.setClient(mockedClient);
    when(mockedClient.get("https://jsonplaceholder.typicode.com/photos")).thenAnswer((_) async=>
    Response('[{"albumId": 1,"id": 1,"title": "accusamus beatae ad facilis cum similique qui sunt","url": "https://via.placeholder.com/600/92c952","thumbnailUrl": "https://via.placeholder.com/150/92c952"}]', 200)
    );
    expect(await _repository.getAlbumImage(), isInstanceOf<SuccessState<List<AlbumImage>>>());
  });
}
