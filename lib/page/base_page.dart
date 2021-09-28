import 'package:flutter/material.dart';

abstract class BasePage {
  getProgressDialog() {
    return const Center(child: CircularProgressIndicator());
  }
}
