import 'package:shared_preferences/shared_preferences.dart';

class LocalDataRepository{
  
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> hasToken() async {
    final prefs = await _prefs;
    var value = prefs.getString('token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    final prefs = await _prefs;
    prefs.setString('token', token);
  }

  Future<void> deleteToken() async {
    final prefs = await _prefs;
    prefs.remove('token');
  }

  Future<void> setHasSeenOnboarding(bool value) async {
    final prefs = await _prefs;
    prefs.setBool('hasSeenOnboarding', value);
  }

  Future<bool> getHasSeenOnboarding() async {
    final prefs = await _prefs;
    final hasSeenOnboarding =  prefs.getBool('hasSeenOnboarding');
    return hasSeenOnboarding?? false;
  }
}