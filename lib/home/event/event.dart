import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;


  @override
  void initState() {
    super.initState();

    initializeDateFormatting('id_ID', null).then((_) {
      setState(() {});
    });
  }

  String _getFormatLabel(CalendarFormat format) {
  switch (format) {
    case CalendarFormat.month:
      return "Bulan";      // Bulanan
    case CalendarFormat.week:
      return "Minggu";     // Mingguan
    case CalendarFormat.twoWeeks:
      return "2 Minggu";   // 2 Mingguan
    default:
      return "";
  }
}

  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2026, 2, 22): ['Test', 'Adili Jokowi'],
    DateTime.utc(2026, 2, 25): ['Workshop'],
    DateTime.utc(2026, 2, 28): ['Webinar'],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: HexColor.fromHex("#f7f8fb"),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Event Jateng",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              color: Colors.grey[100],
              child: TableCalendar(
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },

              locale: 'id_ID',

              headerVisible: true,

              headerStyle: HeaderStyle(
                formatButtonVisible: true,
              ),

              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blueAccent.withAlpha(130),
                  shape: BoxShape.circle,
                ),
              ),

              eventLoader: _getEventsForDay,
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  if (events.isNotEmpty) {
                    return Positioned(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(65, 88, 208, 1.0),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            ),

            const SizedBox(height: 16),

            if (_selectedDay != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
  "${_getEventsForDay(_selectedDay!).length} Event",
  style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ),
),
                    const SizedBox(height: 8),
                    ..._getEventsForDay(_selectedDay!).map(
                      (event) => ListTile(
                        leading: const Icon(Icons.event, color: Colors.blue),
                        title: Text(event),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
