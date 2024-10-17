import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/calendar_event_bloc/calendar_event_bloc_bloc.dart';
import 'package:municipium/model/calendar_event/calendar_event.dart';
import 'package:municipium/utils/calendar_utility.dart';

class LastUpdateBox extends StatelessWidget {
  const LastUpdateBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: 
         Container(
          
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Ultimi aggiornamenti',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  BlocBuilder<CalendarBloc, CalendarEventBlocState>(
                    
                    builder: (context, state) {
                      if(state is FetchedCalendarState) {
                        return Container(
                        margin: const EdgeInsets.all(16),
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 137, 0, 0),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(child: Text(state.calendar.length.toString())),
                      );
                      }else {
                        return Container();
                      }
                      
                    }
                  )
                ],
              ),

              BlocBuilder<CalendarBloc, CalendarEventBlocState>(builder:(context, state) {
                if(state is FetchedCalendarState) {
                  List<CalendarEvent> calendarEvent = state.calendar;
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    height: 200,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: calendarEvent.length,
                      itemBuilder :(context, index) {

                      CalendarEvent event = calendarEvent[index];
                      return Container(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(child: Text('${CalendarUtility.getNameFromType(event.type)}: ${event.title}'))
                          ],
                        ),
                      );
                      
                    },),
                  );
                } else {
                  return Container();
                }
              },),
             
             
            ],
          ),
        ),
      );
    
  }
}
