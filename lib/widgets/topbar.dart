import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Flutter Api App'),
      actions: [
        IconButton(
          icon: const Icon(Icons.info),
          onPressed: () => ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Info button clicked"))),
        ),
      ],
    );
  }
}
