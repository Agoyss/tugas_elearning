import 'package:flutter/material.dart';
import 'package:hello_flutter/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class clock extends StatefulWidget {
  const clock({super.key});

  @override
  State<clock> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<clock> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _showTimePicker(context) async {
    final timePick = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (timePick != null) {
      setState(() {
        _selectedTime = timePick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Time : ${_selectedTime.format(context)}'),
              const SizedBox(
                width: 10,
              ),
              CustomButton(
                text: 'Time Picker',
                onPressed: () {
                  _showTimePicker(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
