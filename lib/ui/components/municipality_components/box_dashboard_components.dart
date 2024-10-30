import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/utils/theme_helper.dart';

class BoxVerticalInfoDashboardComponents extends StatelessWidget {
  BoxVerticalInfoDashboardComponents({super.key, this.municipality});
  Municipality? municipality;

  @override
  Widget build(BuildContext context) {
  return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(6),
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
            
            image: NetworkImage('${municipality?.background.baseUrl}${municipality?.background.i640}'),
            fit: BoxFit.cover,
          ),
        ),
        ),
        Container(
          margin: const EdgeInsets.all(6),
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(173, 33, 63, 233),
            borderRadius: BorderRadius.circular(20),
          
        ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              
              children: [
                 CircleAvatar(
                    backgroundImage: NetworkImage(
                        '${municipality?.logo.baseUrl}${municipality?.logo.i640}'),
                  ),
                  Spacer(),
                  Text(
                  DateTime.now().day.toString(),
                  style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                Text(
                      DateFormat.MMMM('it').format(DateTime.now()).toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,color: Colors.white
                      ),
                    ),
              ],
            ),
          ),
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

class BoxVerticalDashboardComponents extends StatelessWidget {
  const BoxVerticalDashboardComponents({super.key,  required this.name, this.isRemoved = false});
  final String name;
  final bool isRemoved;

  @override
  Widget build(BuildContext context) {
  return (isRemoved || name.isEmpty) ? Container(
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
    return (isRemoved || name.isEmpty)? Container(
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
      child: Center(child: Text(name, style: TextStyle(color: Colors.black),)),
    );
  }
}