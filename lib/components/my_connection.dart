import 'package:flutter/material.dart';

class MyConnection extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const MyConnection({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Image.asset(imagePath, height: 50),
      ),
    );
  }
}
