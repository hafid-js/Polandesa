import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/features/event/data/event_data.dart';
import 'package:polandesa/features/event/widgets/event_card.dart';
import 'package:polandesa/utils/constants/colors.dart';
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
    _selectedDay = DateTime.utc(
      _focusedDay.year,
      _focusedDay.month,
      _focusedDay.day,
    );
    initializeDateFormatting('id_ID', null).then((_) => setState(() {}));
  }

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return eventsData[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.white,
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
              color: UColors.backgroundColor,
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
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Bulanan',
                  CalendarFormat.twoWeeks: '2 Mingguan',
                  CalendarFormat.week: 'Mingguan',
                },
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                headerVisible: true,
                headerStyle: const HeaderStyle(formatButtonVisible: true),
                calendarStyle: CalendarStyle(
                  todayDecoration: const BoxDecoration(
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
                      return const Positioned(
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Color.fromRGBO(65, 88, 208, 1.0),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                enabledDayPredicate: (day) {
                  return day.isAfter(
                        DateTime.now().subtract(const Duration(days: 1)),
                      ) ||
                      isSameDay(day, DateTime.now());
                },
              ),
            ),
            const SizedBox(height: 16),

            if (_selectedDay != null)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
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
                    const SizedBox(height: 18),
                    ..._getEventsForDay(_selectedDay!).map(
                      (event) => Column(
                        children: [
                          EventCard(event: event),
                          const SizedBox(height: 20),
                        ],
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
