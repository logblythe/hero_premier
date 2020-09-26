import 'package:flutter/material.dart';
import 'package:hero_premier/utils/api_exceptions.dart';
import 'package:hero_premier/utils/api_response.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isDisposed = false;
  bool _connected = true;
  Status status;
  dynamic _error;
  dynamic _dialogContent;

  bool get connected => _connected;

  get dialogContent => _dialogContent;

  get error => _error;

  get loading => status == Status.LOADING;

  setCompleted() {
    status = Status.COMPLETED;
    if (!_isDisposed) notifyListeners();
  }

  set connected(bool value) {
    _connected = value;
    notifyListeners();
  }

  setDialogContent(content) {
    _dialogContent = content;
    status = Status.DIALOG_CONTENT;
    notifyListeners();
  }

  setError(error) {
    if (error is AppException) {
      _error = error.toJson()["message"];
    } else {
      _error = error;
    }
    status = Status.ERROR;
    if (!_isDisposed) notifyListeners();
  }

  setLoading() {
    status = Status.LOADING;
    if (!_isDisposed) notifyListeners();
  }

  setPaginating() {
    status = Status.PAGINATING;
    if (!_isDisposed) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
