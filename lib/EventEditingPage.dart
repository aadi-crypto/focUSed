import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'EventProvider.dart';

class Utils {
  static String toDateTime(DateTime dateTime) {
    final time = DateFormat.Hm().format(dateTime);

    return '$time';
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.Hm().format(dateTime);

    return '$time';
  }
}

class EventEditingPage extends StatefulWidget {
  final Event? event;

  const EventEditingPage({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final notesController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(minutes: 30));
    }
  }

  @override
  dispose() {
    super.dispose();

    titleController.dispose();
  }

  Widget build(BuildContext context) {
    return Material(
        color: Color.fromRGBO(231, 240, 237, 1),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Form(
              key: _formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).viewPadding.top),
                    SizedBox(height: 20 + 30),
                    Text(
                      'Create a New Event',
                      style: TextStyle(
                          fontSize: 43,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    buildTitle(),
                    SizedBox(height: 12),
                    buildDateTimePickers(),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Notes...'),
                      onFieldSubmitted: (_) {},
                      controller: notesController,
                    ),
                    SizedBox(
                      height: 20,
                      width: 30,
                    ),
                    OutlinedButton(onPressed: saveForm, child: Text("Done")),
                    SizedBox(height: 12),
                  ]),
            )));
  }

  Widget buildFrom() => Row(
        children: [
          buildDropdownField(
              text: Utils.toTime(fromDate), onClicked: () => pickFromTime())
        ],
      );

  Widget buildTo() => Row(
        children: [
          buildDropdownField(
              text: Utils.toTime(toDate), onClicked: () => pickToTime())
        ],
      );

  Row buildDateTimePickers() {
    return Row(children: [
      Text('FROM: '),
      buildFrom(),
      SizedBox(
        height: 20,
        width: 30,
      ),
      Text('TO: '),
      buildTo(),
    ]);
  }

  TextFormField buildTitle() {
    return TextFormField(
      style: TextStyle(fontSize: 24),
      decoration: InputDecoration(hintText: 'Event Name'),
      onFieldSubmitted: (_) {},
      validator: (title) =>
          title != null && title.isEmpty ? 'Title must not be empty' : null,
      controller: titleController,
    );
  }

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      OutlinedButton(
        onPressed: onClicked,
        child: Row(
          children: [Text(text), Icon(Icons.arrow_drop_down)],
        ),
      );

  Future pickFromTime() async {
    final date = await pickTime(fromDate);

    if (date == null) return null;

    setState(() => fromDate = date);
  }

  Future<DateTime?> pickTime(
    DateTime initialTime, {
    DateTime? firstDate,
  }) async {
    //final time = Duration(hours: initialTime.hour, minutes: initialTime.minute);

    //return DateTime.now().add(time);
    final timeOfDay = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(initialTime));
    if (timeOfDay == null) return null;

    final date =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

    return date.add(time);
  }

  Future pickToTime() async {
    final date = await pickTime(toDate);

    if (date == null) return null;

    setState(() => toDate = date);
  }

  Future saveForm() async {
    final isValid = _formkey.currentState!.validate();

    if (isValid) {
      final event = Event(
          title: titleController.text,
          from: fromDate,
          to: toDate,
          isAllDay: false,
          description: notesController.text);

      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);

      Navigator.of(context).pop();
    }
  }
}

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  const Event({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.backgroundColor = Colors.red,
    this.isAllDay = false,
  });
}
