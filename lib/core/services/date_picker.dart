import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> datePicker(BuildContext context,TextEditingController controller) async {
  final picked = await showDatePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(3000),
    initialDate: DateTime.now(),
  );
  if(picked!=null){
    final date=DateFormat('dd-MM-yyyy').format(picked);
    controller.text=date;
  }
}
