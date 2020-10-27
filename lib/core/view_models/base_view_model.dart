import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    if (!_isDisposed) notifyListeners();
  }

  setShowDialog(content) {
    _dialogContent = content;
    status = Status.DIALOG_CONTENT;
    if (!_isDisposed) notifyListeners();
  }

  setError(error) {
    if (error is AppException) {
      _error = error.toJson()['Message'] ?? error.toJson()['message'];
    } else {
      _error = error.toString();
    }
    status = Status.ERROR;
    if (!_isDisposed) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: _error,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.withAlpha(200),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
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
