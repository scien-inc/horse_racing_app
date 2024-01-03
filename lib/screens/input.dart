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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '収支入力',
          style: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold, // 太字
          ), 
        ),
        toolbarHeight: 100,//textsize
        backgroundColor: Colors.white,//backgroundcolor
      ),
      backgroundColor: Colors.white,
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
              isScrollControlled: true,
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
