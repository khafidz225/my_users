import 'package:flutter/material.dart';

class SubAppbar extends StatelessWidget {
  SubAppbar({required this.onTap, required this.title, super.key});
  String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_back_outlined,
                size: 18,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
