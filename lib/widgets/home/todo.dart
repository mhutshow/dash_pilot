import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class GlassmorphicTodoScreen extends StatefulWidget {
  @override
  _GlassmorphicTodoScreenState createState() => _GlassmorphicTodoScreenState();
}

class _GlassmorphicTodoScreenState extends State<GlassmorphicTodoScreen> {
  Map<DateTime, List<Map<String, dynamic>>> _events = {};
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _events = {
      DateTime.now(): [
        {"time": "08:00 AM", "task": "Office arrival.", "completed": true},
        {"time": "5:00 AM", "task": "Friends get together", "completed": false},
        {"time": "7:00 PM", "task": "Badminton playing", "completed": false},
        {"time": "9:00 PM", "task": "Joe's house", "completed": false},
        {"time": "10:00 PM", "task": "Charging station", "completed": false},
        {"time": "10:45 PM", "task": "Walmart", "completed": false},
      ],
    };
  }

  void _toggleTaskCompletion(DateTime day, int index) {
    setState(() {
      _events[day]![index]['completed'] = !_events[day]![index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [


          TableCalendar(
            calendarFormat: CalendarFormat.week,
            focusedDay: _selectedDay,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.white70),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false, 
              titleCentered: true,
              titleTextStyle: TextStyle(color: Colors.transparent),
              leftChevronVisible: false, 
              rightChevronVisible: false, 
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.white70),
              weekendStyle: TextStyle(color: Colors.white70),
            ),
          ),


          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _events[_selectedDay]?.length ?? 0,
              itemBuilder: (context, index) {
                final event = _events[_selectedDay]![index];
                return ListTile(
                  leading: Radio(
                    value: true,
                    groupValue: event['completed'],
                    activeColor: Colors.blueAccent,
                    onChanged: (value) {
                      _toggleTaskCompletion(_selectedDay, index);
                    },
                  ),
                  title: Text(
                    event['task'],
                    style: TextStyle(
                      color: event['completed']
                          ? Colors.white70
                          : Colors.white,
                      decoration: event['completed']
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  subtitle: Text(
                    event['time'],
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
