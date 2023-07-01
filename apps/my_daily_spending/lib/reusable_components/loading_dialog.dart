import 'package:flutter/material.dart';

showloadingDialog(context) {
  showDialog(
      context: context,
      builder: (context) {
        return const AbsorbPointer(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
}
