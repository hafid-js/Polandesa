import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:polandesa/common/widgets/circular_container.dart';
import 'package:polandesa/features/prayer_time/models/prayer_time.dart';
import 'package:polandesa/features/prayer_time/repository/prayer_time_repository.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';
import 'package:polandesa/utils/constants/sizes.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  late Future<Map<String, dynamic>> _future;
  final repo = PrayerTimeRepository();
  late String weekday;

  late Timer timer;
  Duration remaining = Duration.zero;
  Duration totalDuration = Duration.zero;
  PrayerTime? todayPrayer;

  String nextPrayerName = "";
  DateTime? nextPrayerTime;
  

  @override
  void initState() {
    super.initState();
    _future = repo.fetchPrayerTimes(
      province: "Jawa Tengah",
      city: "Kab. Purworejo",
    );

    _future.then((data) {
      final schedules = data['schedules'] as List<PrayerTime>;
      if (schedules.isNotEmpty) {
        todayPrayer = schedules[0];
        getNextPrayer(schedules);
        _startTimer(schedules);
      }
    });
  }

  PrayerTime getNextPrayer(List<PrayerTime> schedules) {
    final now = DateTime.now();

    for (final item in schedules) {
      final prayers = {
        "Subuh": item.fajr,
        "Dzuhur": item.dhuhr,
        "Ashar": item.asr,
        "Maghrib": item.maghrib,
        "Isya": item.isha,
      };

      for (final entry in prayers.entries) {
        final hour = int.parse(entry.value.split(":")[0]);
        final minute = int.parse(entry.value.split(":")[1]);
        final dt = DateTime(now.year, now.month, now.day, hour, minute);

        if (dt.isAfter(now)) {
          nextPrayerName = entry.key;
          nextPrayerTime = dt;
          totalDuration = nextPrayerTime!.difference(now);
          remaining = totalDuration;
          return item;
        }
      }
    }

    // jiika semua jadwal hari ini sudah lewat, ambil Subuh besok
    final tomorrow = schedules[0];
    final fajr = tomorrow.fajr.split(":");
    nextPrayerTime = DateTime(
      now.year,
      now.month,
      now.day + 1,
      int.parse(fajr[0]),
      int.parse(fajr[1]),
    );
    nextPrayerName = "Subuh";
    totalDuration = nextPrayerTime!.difference(now);
    remaining = totalDuration;

    return schedules[0];
  }

  void _startTimer(List<PrayerTime> schedules) {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();

      final prayers = {
        "Subuh": schedules[0].fajr,
        "Dzuhur": schedules[0].dhuhr,
        "Ashar": schedules[0].asr,
        "Maghrib": schedules[0].maghrib,
        "Isya": schedules[0].isha,
      };

      DateTime? nextPrayerDT;
      DateTime? currentPrayerDT;

      for (final entry in prayers.entries.toList()) {
        final hour = int.parse(entry.value.split(":")[0]);
        final minute = int.parse(entry.value.split(":")[1]);
        final dt = DateTime(now.year, now.month, now.day, hour, minute);

        if (dt.isAfter(now) && nextPrayerDT == null) {
          nextPrayerDT = dt;
          nextPrayerName = entry.key;
        }
        if (dt.isBefore(now) || dt.isAtSameMomentAs(now)) {
          currentPrayerDT = dt;
        }
      }

      // jika semua sudah lewat, next adalah Subuh besok
      if (nextPrayerDT == null) {
        final fajr = schedules[0].fajr.split(":");
        nextPrayerDT = DateTime(
          now.year,
          now.month,
          now.day + 1,
          int.parse(fajr[0]),
          int.parse(fajr[1]),
        );
        nextPrayerName = "Subuh";
        currentPrayerDT = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(schedules[0].isha.split(":")[0]),
          int.parse(schedules[0].isha.split(":")[1]),
        );
      }

      totalDuration = nextPrayerDT!.difference(currentPrayerDT!);
      remaining = nextPrayerDT.difference(now);

      setState(() {
        // percent akan dihitung di build()
      });
    });
  }

  

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: screenHeight,
                child: const Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError) {
              return SizedBox(
                height: screenHeight,
                child: Center(child: Text("Error: ${snapshot.error}")),
              );
            }

            final data = snapshot.data!;
            final List<PrayerTime> schedules = data['schedules'];
            final province = data['province'];
            final city = data['city'];

            DateTime formattingDate = DateTime.parse(schedules.first.fullDate);

            String dateNow = DateFormat('dd MMM yyy','id').format(formattingDate);
            String formattingHijri = HijriCalendar.fromDate(formattingDate).toFormat("dd MMMM yyyy H");

            double percentValue = 0.0;
            if (totalDuration.inSeconds > 0) {
              percentValue =
                  (totalDuration.inSeconds - remaining.inSeconds) /
                  totalDuration.inSeconds;
              percentValue = percentValue.clamp(0.0, 1.0);
            }

            return Column(
              children: [
                // HEADER
                SizedBox(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        child: Container(
                          height: USizes.homePrimaryHeaderHeight,
                          color: const Color.fromRGBO(65, 88, 208, 1),
                          child: Stack(
                            children: [
                              Positioned(
                                top: -150,
                                right: -160,
                                child: UCircularContainer(
                                  height: USizes.homePrimaryHeaderHeight,
                                  width: USizes.homePrimaryHeaderHeight,
                                  backgroundColor: UColors.white.withValues(
                                    alpha: 0.1,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 50,
                                right: -250,
                                child: UCircularContainer(
                                  height: USizes.homePrimaryHeaderHeight,
                                  width: USizes.homePrimaryHeaderHeight,
                                  backgroundColor: UColors.white.withValues(
                                    alpha: 0.1,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 100,
                                  bottom: 20,
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_on_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 4),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              province,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              city,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircularPercentIndicator(
                                          backgroundColor: Colors.white,
                                          backgroundWidth: 22,
                                          radius: 80.0,
                                          lineWidth: 10.0,
                                          animation: false,
                                          percent: percentValue.clamp(0.0, 1.0),
                                          reverse: false,
                                          center: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                nextPrayerName,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "${remaining.inHours.toString().padLeft(2, '0')}:"
                                                "${remaining.inMinutes.remainder(60).toString().padLeft(2, '0')}:"
                                                "${remaining.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                                                style: const TextStyle(
                                                  fontSize: 26,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${nextPrayerTime!.hour.toString().padLeft(2, '0')}:"
                                                "${nextPrayerTime!.minute.toString().padLeft(2, '0')}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              const Text(
                                                "Azan (Mekah)",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: HexColor.fromHex(
                                            "#ff6900",
                                          ),
                                        ),
                                      ),
                                    ),
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

                // CARD RAJAB + JADWAL SHOLAT
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          top: 10,
                          left: 16,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Hari ini",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: HexColor.fromHex("#020381"),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            if (schedules.isNotEmpty)
                              Builder(
                                builder: (context) {
                                  final item = schedules[0];

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // CARD RAJAB
                                      Card(
                                        color: Colors.white,
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            35,
                                          ),
                                          side: const BorderSide(
                                            color: Color.fromRGBO(
                                              65,
                                              88,
                                              208,
                                              1,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons
                                                    .arrow_back_ios_new_outlined,
                                                color: Color.fromRGBO(
                                                  65,
                                                  88,
                                                  208,
                                                  1,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "${formattingHijri}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                        65,
                                                        88,
                                                        208,
                                                        1,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${item.weekday}, ${dateNow}",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey[800],
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Color.fromRGBO(
                                                  65,
                                                  88,
                                                  208,
                                                  1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      // JADWAL SHOLAT
                                      ...[
                                        {"label": "Imsak", "time": item.imsak},
                                        {"label": "Subuh", "time": item.fajr},
                                        {
                                          "label": "Terbit",
                                          "time": item.sunrise,
                                        },
                                        {"label": "Dhuha", "time": item.dhuha},
                                        {"label": "Dzuhur", "time": item.dhuhr},
                                        {"label": "Ashar", "time": item.asr},
                                        {
                                          "label": "Maghrib",
                                          "time": item.maghrib,
                                        },
                                        {"label": "Isya", "time": item.isha},
                                      ].map((jadwal) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          child: Card(
                                            color: Colors.grey[100],
                                            elevation: 0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 20,
                                                  ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .album_outlined,
                                                        color: Colors.grey[400],
                                                        size: 20,
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Text(
                                                        jadwal['label']!,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        jadwal['time']!,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ],
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
