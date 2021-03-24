import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:local_storage/data/local_database/friends_local_datasource.dart';
import 'package:local_storage/data/local_database/friends_model.dart';

class LocalDatabase extends StatefulWidget {
  @override
  _LocalDatabaseState createState() => _LocalDatabaseState();
}

class _LocalDatabaseState extends State<LocalDatabase> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Local Database'),
        ),
        body: Center(
          child: Column(
            children: [
              CreateNewFriend(
                ageController: ageController,
                nameController: nameController,
                onCreate: () {
                  setState(() {});
                },
              ),
              const SizedBox(height: 50),
              const Text('Friend List', style: TextStyle(fontSize: 30)),
              Expanded(child: Friends()),
            ],
          ),
        ),
      );
}

class CreateNewFriend extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final Function onCreate;

  CreateNewFriend({
    Key key,
    this.nameController,
    this.ageController,
    this.onCreate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Age'),
                  controller: ageController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          RaisedButton(
            onPressed: () {
              final FriendModel friend = FriendModel(
                name: nameController.text,
                age: int.parse(ageController.text),
              );
              FriendsLocalDatasource().createFriend(friend);
              nameController.clear();
              ageController.clear();
              onCreate();
            },
            child: const Text('Create'),
          )
        ],
      );
}

class Friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: FriendsLocalDatasource().getfriends(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<FriendModel> friendList = [];
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              break;
            default:
              if (snapshot.hasError) {
                break;
              } else {
                friendList = snapshot.data;
              }
          }
          return ListView.separated(
            itemCount: friendList.length,
            itemBuilder: (_, int index) {
              return ListTile(
                title: Text(friendList[index].name),
                subtitle: Text(friendList[index].age.toString()),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
          );
        },
      );
}
