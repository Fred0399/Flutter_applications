import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../urls.dart';
import '../models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userID;
  DateTime _dateExpiration;
  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_dateExpiration != null &&
        _dateExpiration.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userID {
    if (isAuth && _userID != null) return _userID;
    return null;
  }

  Future<void> _authenticate(String email, String password, String url) async {
    try {
      final response = await http.post(
        authUrl + url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final result = json.decode(response.body);
      if (result['error'] != null) {
        throw HttpException(result['error']['message']);
      }
      _token = result['idToken'];
      _userID = result['localId'];
      _dateExpiration = DateTime.now().add(
        Duration(
          seconds: int.parse(result['expiresIn']),
        ),
      );
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userDataJson = json.encode({
        'token': _token,
        'userID': _userID,
        'expiryDate': _dateExpiration.toIso8601String(),
      });
      prefs.setString("userData", userDataJson);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, signupUrl);
  }

  Future<void> signin(String email, String password) async {
    return _authenticate(email, password, signIn);
  }

  Future<void> logout() async {
    _token = null;
    _dateExpiration = null;
    _userID = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();

    //alternative prefs.remove(key);
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final _duration = _dateExpiration.difference(DateTime.now()).inSeconds;
    Timer(Duration(seconds: _duration), logout);
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }
    final response = json.decode(prefs.getString("userData")) as Map<String,Object>;
    final expiryDate=DateTime.parse(response['expiryDate']);
    if(expiryDate.isBefore(DateTime.now())){
      return false;
    }
    _token = response['token'];
    _userID = response['userID'];
    _dateExpiration = expiryDate;

    notifyListeners();
    _autoLogout();
    return true;
  }
}
