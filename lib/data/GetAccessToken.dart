import '../../data/OAuth.dart';

Future<String?> getAccessToken(login, password) async {

  final oauth = OAuth(
      tokenUrl: 'https://p.mrsu.ru/OAuth/Token',
      clientId: '8',
      clientSecret: 'qweasd');

  OAuthToken token = await oauth.requestTokenAndSave(PasswordGrant(
      username:login, password:password));
  // if(token.accessToken == null) getAccessToken(login, password);
  return token.accessToken;
}


