import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);
  @override
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.users),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // Exemple de changement vers le français
              Provider.of<LanguageChangeProvider>(context, listen: false)
                  .changeLanguage();
            },
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).nextTheme();
            },
          ),
        ],
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

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
