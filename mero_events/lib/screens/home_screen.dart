import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
            child: TableCalendar(
                locale: "en_US",
                rowHeight: 43,
                headerStyle: HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                focusedDay: today,
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                firstDay: DateTime.utc(2023, 01, 01),
                lastDay: DateTime.utc(2024, 01, 01),
                onDaySelected: _onDaySelected)),
        Text(today.toString().split(" ")[0]),
        TextField(
            autofocus: false,
            decoration: InputDecoration(hintText: "Event Title")),
        TextField(
            autofocus: false,
            decoration: InputDecoration(hintText: "Event Description"))
      ],
    );
  }
}
