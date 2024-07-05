import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoxVerticalDashboardComponents extends StatelessWidget {
  const BoxVerticalDashboardComponents({super.key,  required this.name, this.isRemoved = false});
  final String name;
  final bool isRemoved;

  @override
  Widget build(BuildContext context) {
    return isRemoved ? Container(
      margin: const EdgeInsets.all(6),
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 0.45,
    ) : _completeWidgetContainer(context, name) ;
  }

  Widget _completeWidgetContainer(BuildContext context, String name) {
    return Stack(
      children: [
        
        Container(
          margin: const EdgeInsets.all(6),
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(child: Text(name, style: TextStyle(color: Colors.black),)),
        ),
        
      ],
    );
  }
  

  Widget _emptyWidgetContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}

class BoxHorizzontalDashboardComponents extends StatelessWidget {
  const BoxHorizzontalDashboardComponents({super.key, required this.name, this.isRemoved = false});
  final String name;
  final bool isRemoved;
  @override
  Widget build(BuildContext context) {
    return isRemoved ? Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,) : Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(name),
    );
  }
}