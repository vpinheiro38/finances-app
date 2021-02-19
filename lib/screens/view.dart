import 'package:finances_app/widgets/dialog_popup.dart';
import 'package:flutter/material.dart';

abstract class View {
  BuildContext _context;

  void showInfoPopup(String message){
    var dialog = DialogPopup.buildDialog(
        message: message,
        confirm: "OK",
        confirmFn: () => Navigator.pop(_context));
    showDialog(context: _context, child: dialog);
  }
}