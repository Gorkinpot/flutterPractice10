import 'package:flutter/material.dart';

Widget labeledField({required String label, required Widget child}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      child,
      const SizedBox(height: 12),
    ],
  );
}
