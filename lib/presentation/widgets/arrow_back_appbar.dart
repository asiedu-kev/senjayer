import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';

class ArrowBackAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? leadingFunction;
  const ArrowBackAppBar({
    Key? key,
    required this.title,
    this.leadingFunction,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_outlined,
          color: AppConstants().purple,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.values[5],
          color: Colors.black,
        ),
      ),
      actions: [
        if (leadingFunction != null)
          GestureDetector(
            onTap: leadingFunction,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              child: const Icon(
                Icons.more_horiz,
                color: Colors.black,
                size: 20,
              ),
            ),
          )
      ],
    );
  }
}
