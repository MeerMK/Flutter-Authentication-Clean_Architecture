import 'dart:convert'; // For json decoding
import 'package:http/http.dart' as http; // For making HTTP requests
import 'package:demo_app/features/auth/domain/entities/auth_response.dart';

abstract class RemoteAuthDataSource {
  Future<AuthResponse> signIn(String email, String password);
  Future<AuthResponse> signUp(String username, String email, String password);
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final http.Client client;

  RemoteAuthDataSourceImpl(this.client);

  @override
  Future<AuthResponse> signIn(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://ourlink/api/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return AuthResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to sign in');
    }
  }

  @override
  Future<AuthResponse> signUp(
      String username, String email, String password) async {
    final response = await client.post(
      Uri.parse('https://ourlink/api/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'username': username, 'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return AuthResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
