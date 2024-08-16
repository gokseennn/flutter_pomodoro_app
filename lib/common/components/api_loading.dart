import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiLoading extends StatelessWidget {
  const ApiLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ],
          ),
          width: 50,
          height: 50,
          child: const CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
