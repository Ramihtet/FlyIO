import 'package:http/http.dart' as http;
import 'dart:convert';


class Token {
  String type;
  String username;
  String applicationName;
  String clientId;
  String tokenType;
  String accessToken;
  int expiresIn;
  String state;
  String scope;

  Token({
    this.type,
    this.username,
    this.applicationName,
    this.clientId,
    this.tokenType,
    this.accessToken,
    this.expiresIn,
    this.state,
    this.scope,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    type: json["type"],
    username: json["username"],
    applicationName: json["application_name"],
    clientId: json["client_id"],
    tokenType: json["token_type"],
    accessToken: json["access_token"],
    expiresIn: json["expires_in"],
    state: json["state"],
    scope: json["scope"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "username": username,
    "application_name": applicationName,
    "client_id": clientId,
    "token_type": tokenType,
    "access_token": accessToken,
    "expires_in": expiresIn,
    "state": state,
    "scope": scope,
  };
}

String token;


Future<Token> fetchToken() async {

  final response =
  await http.post("https://test.api.amadeus.com/v1/security/oauth2/token",
      headers: {
//  "Content-Type" : "application/x-www-form-urlencoded"
      },
      body: {'grant_type': 'client_credentials', 'client_id': 'GAYygRbhjbxGk1L5tiOPL6WbkqFxOgvB','client_secret': 'FsD6MGkQjBb4Qufr'}
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
//    print(response.body);
    return Token.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load');
  }
}