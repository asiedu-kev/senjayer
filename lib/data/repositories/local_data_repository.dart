import 'package:senjayer/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setRememberMe(bool rememberMe) async {
    final prefs = await _prefs;
    prefs.setBool('rememberMe', rememberMe);
  }

  Future<bool> rememberUser() async {
    final prefs = await _prefs;
    return prefs.getBool('rememberMe') ?? false;
  }

  Future<void> clearRememberMe() async {
    final prefs = await _prefs;
    prefs.remove('rememberMe');
  }
    Future<bool> hasToken() async {
    final prefs = await _prefs;
    var value = prefs.getString('token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getToken() async {
    final prefs = await _prefs;
    return prefs.getString('token')!;
  }

  Future<void> persistToken(String token) async {
    final prefs = await _prefs;
    prefs.setString('token', token);
  }

  Future<void> deleteToken() async {
    final prefs = await _prefs;
    prefs.remove('token');
  }

  Future<User> getUser() async {
    final prefs = await _prefs;
    return User.fromJson(prefs.getString('user')!);
  }

  Future<void> persistUser(User user) async {
    final prefs = await _prefs;
    final String userString = user.toJson();
    prefs.setString('user', userString);
  }

  Future<void> deleteuser() async {
    final prefs = await _prefs;
    prefs.remove('user');
  }

/*   Future<String> getPhone() async {
    final prefs = await _prefs;
    return prefs.getString('phone')!;
  }

  Future<void> persistPhone(String phone) async {
    final prefs = await _prefs;
    prefs.setString('phone', phone);
  }

  Future<void> deletePhone() async {
    final prefs = await _prefs;
    prefs.remove('phone');
  } */

  Future<void> setHasSeenOnboarding(bool value) async {
    final prefs = await _prefs;
    prefs.setBool('hasSeenOnboarding', value);
  }

  Future<bool> getHasSeenOnboarding() async {
    final prefs = await _prefs;
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding');
    return hasSeenOnboarding ?? false;
  }
}
