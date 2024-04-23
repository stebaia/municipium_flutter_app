import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalRapidActionComponent extends StatelessWidget {
  const ModalRapidActionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Colors.black54, borderRadius: const BorderRadius.all(Radius.circular(50)), border: Border.all(color: Colors.blueGrey)),
                      child: const Center(
                        child: Icon(CupertinoIcons.calendar),
                      ),
                    ),
                    const SizedBox(height:10),
                    const Text('Prenotazione', style: TextStyle(fontSize: 12))
                  ],
                ),
                const SizedBox(width: 6,),
                Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Colors.black54, borderRadius: const BorderRadius.all(Radius.circular(50)), border: Border.all(color: Colors.blueGrey)),
                      child: const Center(
                        child: Icon(CupertinoIcons.phone),
                      ),
                    ),
                    const SizedBox(height:10),
                    const Text('Chiamate d\'emergenza', style: TextStyle(fontSize: 12),)
                  ],
                ),
                const SizedBox(width: 6,),
                Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Colors.black54, borderRadius: const BorderRadius.all(Radius.circular(50)), border: Border.all(color: Colors.blueGrey)),
                      child: const Center(
                        child: Icon(CupertinoIcons.alarm),
                      ),
                    ),
                    const SizedBox(height:6),
                    const Text('Segnalazione', style: TextStyle(fontSize: 12))
                  ],
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}