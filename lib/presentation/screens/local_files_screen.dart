import 'package:flutter/material.dart';
import 'package:local_storage/data/local_files/profile_local_file.dart';

class LocalFilesScreen extends StatefulWidget {
  @override
  _LocalFilesScreenState createState() => _LocalFilesScreenState();
}

class _LocalFilesScreenState extends State<LocalFilesScreen> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Local File'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    const Text(
                      'User Name',
                      style: TextStyle(fontSize: 24),
                    ),
                    UserName(),
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                    ),
                    RaisedButton(
                      onPressed: () {
                        ProfileDetail().updateName(nameController.text);
                        setState(() {});
                      },
                      child: const Text('Enter'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class UserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: ProfileDetail().getName(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Text('...');
            default:
              if (snapshot.hasError) {
                return const Text('Error');
              } else {
                final String name =
                    snapshot.data.toString().isEmpty ? '-' : snapshot.data;
                return Text(
                  name,
                  style: const TextStyle(fontSize: 20),
                );
              }
          }
        },
      );
}
