import 'package:flutter/material.dart';

class BackGroundView extends StatelessWidget {
  const BackGroundView({super.key, required this.ratio});
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * ratio,
          color: Colors.black,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
