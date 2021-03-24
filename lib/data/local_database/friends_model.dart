class FriendModel {
  final String name;
  final int age;

  FriendModel({this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }
}
