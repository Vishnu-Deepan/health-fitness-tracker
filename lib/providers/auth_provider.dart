import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  Map<String, dynamic>? _userData;

  User? get user => _user;
  Map<String, dynamic>? get userData => _userData;

  // Check if the user is signed in
  bool get isSignedIn => _user != null;

  // Register user
  Future<void> register(String email, String password) async {
    _user = await _authService.registerWithEmailAndPassword(email, password);
    notifyListeners();
  }

  // Login user
  Future<void> login(String email, String password) async {
    _user = await _authService.signInWithEmailAndPassword(email, password);
    await _fetchUserData();
    notifyListeners();
  }

  // Logout user
  Future<void> logout() async {
    await _authService.signOut();
    _user = null;
    _userData = null;
    notifyListeners();
  }

  // Fetch user data
  Future<void> _fetchUserData() async {
    if (_user != null) {
      DocumentSnapshot doc = await _authService.getUserData(_user!.uid);
      _userData = doc.data() as Map<String, dynamic>?;
      notifyListeners();
    }
  }

  // Update user profile
  Future<void> updateUserProfile(String name, String profilePicture) async {
    if (_user != null) {
      await _authService.updateUserProfile(_user!.uid, name, profilePicture);
      await _fetchUserData();
    }
  }
}
