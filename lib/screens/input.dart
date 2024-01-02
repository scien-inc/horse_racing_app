import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:horse_racing_app/widget/input_screen.dart';


class InputPage extends StatelessWidget{
  const InputPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: InputScreen());
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }
  int _currentIndex = 2; // 初期インデックスを0に設定

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // タップされたときにインデックスを更新
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('収支入力'),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {

              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black54,
            onPrimary: Colors.white,
            minimumSize: Size(300, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
            //width and color
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return InputOverlay();
              },
            );
          },
          child: Text('次へ'),
          
          ),
        ],
      ),

    );
  }
}
