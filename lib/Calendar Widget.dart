import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'EventEditingPage.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

import 'EventProvider.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
      view: CalendarView.timelineDay,
      appointmentBuilder: (context, details) {
        final meeting = details.appointments.first;

        return Container(
            child: Column(children: [
          Container(
            padding: EdgeInsets.all(3),
            height: 50,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: Color.fromRGBO(230, 96, 119, 1),
            ),
            child: Column(
              children: [
                Text(
                  meeting.title,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                Text(
                  meeting.description,
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          )
        ]));
      },
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      backgroundColor: Colors.transparent,
      headerHeight: 0,
      todayHighlightColor: Colors.black,
      selectionDecoration: BoxDecoration(
        color: Color.fromRGBO(97, 153, 203, 0.3),
      ),
    );
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }

  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  String getSubject(int index) => getEvent(index).title;

  @override
  Color getColor(int index) => getEvent(index).backgroundColor;

  @override
  bool isAllDay(int index) => getEvent(index).isAllDay;
}
