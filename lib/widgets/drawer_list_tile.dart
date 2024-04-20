import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const DrawerListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontFamily: 'DidactGothic',
            fontSize: 18,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
