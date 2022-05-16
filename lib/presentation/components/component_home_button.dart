import 'package:flutter/material.dart';

class ComponentHomeButton extends StatelessWidget {

  final IconData icon;
  final String text;
  final GestureTapCallback onTap;

  const ComponentHomeButton({Key? key, required this.icon, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double size = 160.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(2, 2)
              ),
          ],
          gradient: const LinearGradient(
              colors: [
                 Color.fromRGBO(250, 133, 63, 1),
                 Color.fromRGBO(250, 133, 63, 0.80),
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 55, color: Colors.white),
            const SizedBox(height: 5),
            Text(text, style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600), textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
