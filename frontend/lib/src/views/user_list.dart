import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Center(
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            if (userProvider.users != null) {
              return ListView.builder(
                itemCount: userProvider.users!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(userProvider.users![index].username),
                    subtitle: Text(userProvider.users![index].email),
                  );
                },
              );
            } else if (userProvider.errorMessage != null) {
              return Text(userProvider.errorMessage!);
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
