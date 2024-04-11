import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastUpdateBox extends StatelessWidget {
  const LastUpdateBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 34, 34, 34).withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ultimi aggiornamenti',
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Center(child: Text('5')),
                  )
                ],
              ),
              Expanded(
                child: Container(),
              ),
              const Text(
                'News',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'Eventi',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'Rifiuti',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
