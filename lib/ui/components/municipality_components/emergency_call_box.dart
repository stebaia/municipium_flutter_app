import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmergencyCallBox extends StatelessWidget {
  const EmergencyCallBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 34, 34, 34).withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Chiamate di Emergenza',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.phone_outlined,
                size: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
