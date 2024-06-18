import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserProvider with ChangeNotifier {
  final ApiService apiService;

  UserProvider(this.apiService);

  List<User>? _users;
  List<User>? get users => _users;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUsers() async {
    try {
      _users = await apiService.fetchUsers();
      _errorMessage = null;
    } catch (e) {
      _users = null;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}

