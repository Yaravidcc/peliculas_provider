import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthFirebaseProvider extends ChangeNotifier {
  final String _baseUrl = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY]';
  final String _firebaseToken = 'AIzaSyAougmnX4ADgxNNqWq7qJy8H9msjXb1Lrw';

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {'email': email, 'password': password};
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if (kDebugMode) print(decodedResp);
  }
}
