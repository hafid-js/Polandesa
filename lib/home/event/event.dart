import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/common/widgets/images/rounded_image.dart';
import 'package:polandesa/home/event/detail_event.dart';
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

    initializeDateFormatting('id_ID', null).then((_) {
      setState(() {});
    });
  }

  final Map<DateTime, List<Map<String, String>>> _events = {
    DateTime.utc(2026, 2, 22): [
      {
        'title': 'Kampung Ramadhan Tazkia 1447 H',
        'image': 'assets/images/events/event-1.png',
        'date': '01-28 Februari 2026',
      },
      {
        'title': 'Festival UMKM Jateng 2026',
        'image': 'assets/images/events/event-2.jpg',
        'date': '05-20 Februari 2026',
      },
    ],
    DateTime.utc(2026, 2, 25): [
      {
        'title': 'Tabligh Akbar Bersama Para tokoh Nasional.',
        'image': 'assets/images/events/event-3.jpeg',
        'date': '25 Februari 2026',
      },
      {
        'title': 'Rame Rame Gelaran Takjil',
        'image': 'assets/images/events/event-4.jpg',
        'date': '25 Februari 2026',
      },
      {
        'title': 'Jalan Sehat Desa Gunung Condong',
        'image': 'assets/images/events/event-5.jpg',
        'date': '25 Februari 2026',
      },
    ],
  };

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
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
            TableCalendar(
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

              locale: Locale('id','ID'),

              headerVisible: true,

              headerStyle: HeaderStyle(formatButtonVisible: true),

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

            const SizedBox(height: 16),

            if (_selectedDay != null)
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  minWidth: MediaQuery.of(context).size.width
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
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
                            GestureDetector(
                              onTap: () => Get.to(() => DetailEventScreen()),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  URoundedImage(
                                    fit: BoxFit.cover,
                                    imageUrl: event['image']!,
                                    isNetworkImage: false,
                                    width: 90,
                                    height: 90,
                                    borderRadius: 8,
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                event['title']!,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: UColors.dark,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 8.0,
                                              ),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 20,
                                                color: UColors.dark,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          event['date']!,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
