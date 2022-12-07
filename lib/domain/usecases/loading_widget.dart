import 'package:flutter/material.dart';

import '../../share/styles/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
