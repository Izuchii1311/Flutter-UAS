import 'package:clothes_app/users/pages/success.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/config.dart';
import '../components/custom_appbar.dart';
import 'main_layouts.dart';

// Halaman Booking Page
class BookingPage extends StatefulWidget {
  BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Deklarasi Awal
  // Menentukan format kalender dalam bulan
  CalendarFormat _format = CalendarFormat.month;
  // Tanggal yang ditandai sekarang
  DateTime _focusDay = DateTime.now();
  // Tanggal saat ini
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;    // Variabel false, untuk weekend
  bool _dateSelected = false; // Tanggal yang dipilih false
  bool _timeSelected = false; // Jam yang dipilih false

  @override
  Widget build(BuildContext context) {
    Config().init(context );
    return Scaffold(
      // App Bar
      appBar: CustomAppBar(
        appTitle: 'Booking Jadwal',
        icon: const FaIcon(Icons.arrow_back_ios), 
        onPressed: () { 
          Navigator.pop(context);
         },
      ),
      body: CustomScrollView(
        // Sliver Biasanya merupakan bagian dari CustomScrollView
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                // Memanggil Widget Tabel Kalender yang sudah dibuat
                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      'Pilih waktu untuk konsultasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Kemudian cek jika isWeekend = true maka tampilkan code berikut
          _isWeekend? SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10, 
                vertical: 30
              ),
              alignment: Alignment.center,
              child: const Text(
                'Hari libur tidak tersedia, pilih di hari lain untuk konsultasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          )
          // Tetapi jika tidak tampilkan jadwal jam
          : SliverGrid(
            delegate: SliverChildBuilderDelegate(     // Sebagai pembangun parameter
              (context, index) {
                // Responsive Interaction
                return InkWell(
                  splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        // _currentIndex akan diisi dengan tanggal hari ini
                        _currentIndex = index;
                        _timeSelected = true;
                      });
                    },
                    // jika _timeSelectednya = true tampilkan jadwal
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                        // Nilai awal _currentIndex = 0
                        // jika ada yang milih maka akan disiikan index tersebut
                        // jika ada nilainya ganti warna Bordernya
                        color: _currentIndex == index
                          ? Colors.white
                          : Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        // Nilai awal _currentIndex = 0
                        // jika ada yang milih maka akan disiikan index tersebut
                        // jika ada nilainya ganti warna background bordernya
                        color: _currentIndex == index
                          ? Config.primaryColor
                          : null,
                        ),
                      alignment: Alignment.center,
                      // Jam dimulai dari index ke 9 + index 1
                      // jika lebih dari jam 11 ganti menjadi PM
                      child: Text(
                        '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // Nilai awal _currentIndex = 0
                          // jika ada yang milih maka akan disiikan index tersebut
                          // jika ada nilainya ganti warna Text nya
                          color: _currentIndex == index ? Colors.white : null,
                        ),
                      ),
                    ),
                  );
                },
                // Set Jadwal ada 8
                childCount: 8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,      // cell horizontall jadwal
                childAspectRatio: 1.5   // Menentukan rasio dari grid item.
              ),
            ),
            // Mengubah Widget biasa Menjadi Sliver
            SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              // Custom Button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Config.primaryColor,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 20,
                    50,
                  ),
                ),
                onPressed: _timeSelected && _dateSelected
                  ? () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Success(
                              title: "Kembali ke Menu Utama", 
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainLayouts(),
                                ),
                              );
                            }
                          )
                        ),
                      );
                  }
                  : null,
                child: const Text(
                  "Booking Jadwal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
          )
        ],
      ),
    );
  }

  // Membuat Tabel Kalender
Widget _tableCalendar() {
  // Mengembalikan Tabel Kalender
  return TableCalendar(
    focusedDay: _focusDay,            // Nilai tanggal yg ada di kalender
    firstDay: DateTime.now(),         // Hari pertama diawali dengan tgl saat ini
    lastDay: DateTime(2023, 12, 31),  // Hari Terakhir sampai 2023-12 -31
    calendarFormat: _format,          // Format Kalender dalam bentuk Bulan
    currentDay: _currentDay,          // Tanggal Saat ini
    rowHeight: 48,
    // Style Kalender
    calendarStyle: const CalendarStyle(
      // Style untuk Tanggal hari ini
      todayDecoration: BoxDecoration(
        color: Config.primaryColor, 
        shape: BoxShape.circle
      ),
    ),
    // Format Kalender
    availableCalendarFormats: const {
      CalendarFormat.month: 'Month',
    },
    onFormatChanged: (format) {
      setState(() {
        _format = format;
      });
    },
    // Ketika Tanggal Dipilih
    onDaySelected: ((selectedDay, focusedDay) {
      setState(() {
        _currentDay = selectedDay;
        _focusDay = focusedDay;
        _dateSelected = true;       // menjadi true

        // Kalo hari weekday (hari ke 6 & 7 dipilih)
        if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
          _isWeekend = true;        // menjadi true
          _timeSelected = false;    // tidak akan menampilkan waktu yang ada
          _currentIndex = null;
        } else {
          _isWeekend = false;
        }
        });
      }),
    );
  }
}