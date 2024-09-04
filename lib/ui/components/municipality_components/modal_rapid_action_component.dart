import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:municipium/routers/app_router.gr.dart';

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
                      decoration: BoxDecoration(
                          
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Theme.of(context).disabledColor)),
                      child: const Center(
                        child: Icon(CupertinoIcons.calendar),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Prenotazione', style: TextStyle(fontSize: 12))
                  ],
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Theme.of(context).disabledColor)),
                      child: const Center(
                        child: Icon(CupertinoIcons.phone),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Chiamate d\'emergenza',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                           
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            border: Border.all(color: Theme.of(context).disabledColor)),
                        child: const Center(
                          child: Icon(CupertinoIcons.alarm),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text('Segnalazione', style: TextStyle(fontSize: 12))
                    ],
                  ),
                  onTap: () {
                    context.pushRoute(NewIssueRouter());
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
