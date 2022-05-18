import 'package:flutter/material.dart';

class DatePicikerfu extends StatefulWidget {
  DatePicikerfu({Key? key}) : super(key: key);

  @override
  State<DatePicikerfu> createState() => _DatePicikerfuState();
}

class _DatePicikerfuState extends State<DatePicikerfu> {
  var _currentselectedDate;
  void callDatePicker() async {
    var selectDate = await getDatePickerwidget();
    setState(() {
      _currentselectedDate = selectDate;
    });
  }

  Future<DateTime?> getDatePickerwidget() {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2023),
        builder: (context, child) {
          return Theme(data: ThemeData.light(), child: child!);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
