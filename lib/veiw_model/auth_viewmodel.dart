import 'package:coders_adda_app/models/login_model.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  String? _verificationId;
  AppUser? _currentUser;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get verificationId => _verificationId;
  bool get isLoggedIn => _currentUser != null;
  AppUser? get currentUser => _currentUser;


  Future<LoginResponse> loginWithPhone(String phoneNumber) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();


      await Future.delayed(Duration(seconds: 2));


      _verificationId = 'mock_verification_id_${DateTime.now().millisecondsSinceEpoch}';
      
      _isLoading = false;
      notifyListeners();

      return LoginResponse(
        success: true,
        verificationId: _verificationId,
      );
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return LoginResponse(success: false, message: e.toString());
    }
  }


  Future<LoginResponse> verifyOtp(String smsCode) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();


      await Future.delayed(Duration(seconds: 2));


      _currentUser = AppUser(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        phone: '+91${_getMockPhone()}',
      );
      
      _isLoading = false;
      notifyListeners();

      return LoginResponse(
        success: true,
        user: _currentUser,
      );
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return LoginResponse(success: false, message: e.toString());
    }
  }

  String _getMockPhone() {

    return '98765${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void resetVerification() {
    _verificationId = null;
    notifyListeners();
  }


  Future<void> signOut() async {
    _currentUser = null;
    _verificationId = null;
    _errorMessage = null;
    notifyListeners();
  }
}