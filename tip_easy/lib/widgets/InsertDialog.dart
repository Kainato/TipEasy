import 'package:flutter/material.dart';

class InsertDialog extends StatelessWidget {
  final String title;
  final List<Widget> content;
  final IconData icon;
  final List<Widget>? actions;

  const InsertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      icon: Icon(icon),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Close',
            style: TextStyle(),
          ),
        ),
        ...actions ?? [],
      ],
    );
  }
}
