// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:profile_page/data/UserInfo.dart';
import 'package:profile_page/data/GetAccessToken.dart';
import 'package:profile_page/custom/button.dart';

var token;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class ProfileScreenArguments {
  late String login;
  late String password;

  ProfileScreenArguments(this.login, this.password);
}

class _ProfileScreen extends State<ProfileScreen> {

  @override
  Widget build(BuildContext ctx) {

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        ProfileScreenArguments('', '')) as ProfileScreenArguments;

    getAccessToken(arguments.login, arguments.password)
        .then((value) => token = value);

    UserInfo user = getUserInfo(token);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 131, 182, 241),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40,
                  width: 250,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      arguments.login = "";
                      arguments.password = "";
                      Navigator.pushReplacementNamed(ctx, "/");
                    },
                    child: const Text(
                      'Exit',
                      style: TextStyle(
                          fontSize: 12.5,
                          color: Color.fromARGB(255, 207, 25, 63)),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image.network(user.photo_url),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                    height: 75,
                    width: 310,
                    child: Card(
                      color: Colors.black38,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextBlock("\n${user.FIO}"),
                          TextBlock("ID:${user.ID}"),
                        ],
                      ),
                      // margin: EdgeInsets.all(20),
                    )),
                const Padding(padding: EdgeInsets.all(2)),
                SizedBox(
                    height: 90,
                    width: 310,
                    child: Card(
                      color: Colors.black38,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextBlock('\nДокументы об образовании\n'),
                          TextBlock(user.Education == ""
                              ? "Записей нет\n"
                              : user.Education),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.all(2)),
                SizedBox(
                    height: 95,
                    width: 310,
                    child: Card(
                      color: Colors.black38,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextBlock('\nПубликации\n'),
                          TextBlock(user.Publication == ""
                              ? "Записей нет"
                              : user.Publication),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.all(2)),
                SizedBox(
                    height: 95,
                    width: 310,
                    child: Card(
                      color: Colors.black38,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextBlock('\nНИОКР\n'),
                          TextBlock(
                              user.NIOKR == "" ? "Записей нет\n" : user.NIOKR),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.all(2)),
                SizedBox(
                    height: 80,
                    width: 300,
                    child: Card(
                      color: Colors.black38,
                      child: Column(
                        children: [
                          TextBlock('\nГранты\n'),
                          TextBlock(
                              user.Grants == "" ? "Записей нет\n" : user.Grants),
                        ],
                      ),
                    )),
                const Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                    height: 80,
                    width: 300,
                    child: Card(
                      color: Colors.black38,
                      child: Column(
                        children: [
                          TextBlock('\nИнтелектуальная собственность\n'),
                          TextBlock(user.Patents == ""
                              ? "Записей нет\n"
                              : user.Patents),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
