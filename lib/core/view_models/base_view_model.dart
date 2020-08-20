import 'package:flutter/material.dart';
import 'package:hero_premier/utils/api_response.dart';

enum AppState { BUSY, IDLE, ERROR }

class BaseViewModel extends ChangeNotifier {
  bool _isDisposed = false;
  Status status;
  dynamic _error;

  get error => _error;

  setLoading() {
    status = Status.LOADING;
    if (!_isDisposed) notifyListeners();
  }

  setCompleted() {
    status = Status.COMPLETED;
    if (!_isDisposed) notifyListeners();
  }

  setError(error) {
    _error = error;
    status = Status.ERROR;
    if (!_isDisposed) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
