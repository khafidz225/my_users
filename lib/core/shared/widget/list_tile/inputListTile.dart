import 'package:flutter/material.dart';
import 'package:my_users/core/shared/utils/palette.dart';

class InputListTile extends StatelessWidget {
  InputListTile({required this.title, required this.child, super.key});
  String title;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                color: Palette.n70),
          ),
          const SizedBox(
            height: 10,
          ),
          child,
        ],
      ),
    );
  }
}
