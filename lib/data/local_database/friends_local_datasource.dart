import 'package:local_storage/data/local_database/friends_model.dart';
import 'package:local_storage/data/local_database/local_database.dart';
import 'package:local_storage/data/local_database/local_database_constants.dart';

class FriendsLocalDatasource {
  static final LocalDatabase _database = LocalDatabase('friend');

  Future<void> init() async {
    await _database.init(createFriendTableCommand);
  }

  Future<List<FriendModel>> getfriends() async {
    final List<Map<String, dynamic>> maps = await _database.get();
    final List<FriendModel> friends = maps
        .map(
          (friend) => FriendModel(
            name: friend['name'],
            age: friend['age'],
          ),
        )
        .toList();
    return friends;
  }

  Future<void> createFriend(FriendModel friend) async {
    await _database.create(friend.toMap());
  }
}
