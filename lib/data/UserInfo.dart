// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:core';

import 'package:dio/dio.dart';

Future<String> getUserData(token, url) async =>
    Future.delayed(const Duration(milliseconds: 100), () async {
      try {
        var dio = Dio();
        var response = await dio.get(
          url,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
        );
        // print(response.headers);
        return response.data.toString();
      } on DioError {
        return getUserData(token, url);
      }
    });

var AllMainData;
var NIOKR;
var UserEducation;
var UserPublication;
var UserGrant;
var UserPatent;

UserInfo getUserInfo(token) {
  UserInfo user = UserInfo();
  getUserData(token, 'https://papi.mrsu.ru/v1/User')
      .then((value) => AllMainData = value);
  getUserData(token, 'https://papi.mrsu.ru/v1/UserEducation')
      .then((value) => UserEducation = value);
  getUserData(token, 'https://papi.mrsu.ru/v1/Publication')
      .then((value) => UserPublication = value);
  getUserData(token, 'https://papi.mrsu.ru/v1/NIOKR')
      .then((value) => NIOKR = value);
  getUserData(token, 'https://papi.mrsu.ru/v1/Grant?type=string')
      .then((value) => UserGrant = value);
  getUserData(token, 'https://papi.mrsu.ru/v1/Patent?type=string')
      .then((value) => UserPatent = value);

  user.photo_url = (AllMainData) != null
      ? ("https:${AllMainData.split(',')[13].split(':')[3]}").toString()
      : "https://images.squarespace-cdn.com/content/v1/63429e5cf75efe54e65314d2/48bd9d0d-0a9b-405f-980e-5d148860e30a/Commercial-photographer.png";

  user.FIO = (AllMainData) != null
      ? AllMainData.split(',')[12].split(':')[1].toString()
      : "Данные не получены из сети";

  user.ID = (AllMainData) != null
      ? (AllMainData.split(',')[4].split(':')[1]).toString()
      : "Данные не получены из сети";

  user.Education = (UserEducation) != null
      ? (UserEducation.split('[')[0]).toString()
      : "Данные не получены из сети";

  user.Publication = (UserEducation) != null
      ? (UserEducation.split('[')[0]).toString()
      : "Данные не получены из сети";

  user.Grants = (UserGrant) != null
      ? (UserGrant.split('[')[0]).toString()
      : "Данные не получены из сети";

  user.NIOKR = (NIOKR) != null
      ? (NIOKR.split('[')[0]).toString()
      : "Данные не получены из сети";

  user.Patents = (UserPatent) != null
      ? (UserPatent.split('[')[0]).toString()
      : "Данные не получены из сети";

  return user;
}

class UserInfo {
  String photo_url = "undefined";
  String FIO = "undefined";
  String ID = "undefined";
  String Education = "undefined";
  String Publication = "undefined";
  String NIOKR = "undefined";
  String Grants = "undefined";
  String Patents = "undefined";
}
