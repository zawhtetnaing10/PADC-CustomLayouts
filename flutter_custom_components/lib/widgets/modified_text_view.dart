import 'package:flutter/material.dart';

class ModifiedTextView extends Text {
  ModifiedTextView(
    String data,
  ) : super(
          data,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        );
}
