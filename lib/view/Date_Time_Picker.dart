import 'package:flutter/material.dart';

class Date_Time_Picker extends StatefulWidget {
  const Date_Time_Picker({Key? key}) : super(key: key);

  @override
  State<Date_Time_Picker> createState() => _Date_Time_PickerState();
}

class _Date_Time_PickerState extends State<Date_Time_Picker> {
  final _dateC = TextEditingController();
  final _timeC = TextEditingController();

  DateTime selected = DateTime.now();
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);

  TimeOfDay timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Date & Time Pickers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildUI(context),
      ),
    );
  }

  Widget buildUI(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TextFormField(
          controller: _dateC,
          decoration: const InputDecoration(
              labelText: 'Date picker', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _timeC,
          decoration: const InputDecoration(
              labelText: 'Time picker', border: OutlineInputBorder()),
        ),
        ElevatedButton(
            onPressed: () => displayDatePicker(context),
            child: const Text("Pick Date")),
        ElevatedButton(onPressed: () => displayTimePicker(context), child: const Text("Pick Time")),
      ],
    );
  }

  Future displayDatePicker(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );

    if (date != null) {
      setState(() {
        _dateC.text = date.toLocal().toString().split(" ")[0];
      });
    }
  }

  Future displayTimePicker(BuildContext context) async {
    var time = await showTimePicker(
        context: context,
        initialTime: timeOfDay);

    if (time != null) {
      setState(() {
        _timeC.text = "${time.hour}:${time.minute}";
      });
    }
  }
}