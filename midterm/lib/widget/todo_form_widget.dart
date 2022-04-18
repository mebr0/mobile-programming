import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final DateTime time;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<DateTime?> onChangedTime;
  final VoidCallback onSave;

  static final format = DateFormat("yyyy-MM-dd HH:mm");

  const TodoFormWidget({
    Key? key,
    required this.title,
    required this.time,
    required this.onChangedTitle,
    required this.onChangedTime,
    required this.onSave
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        const SizedBox(height: 8),
        buildTime(),
        const SizedBox(height: 8),
        buildButton(),
      ],
    ),
  );

  Widget buildTitle() => TextFormField(
    initialValue: title,
    onChanged: onChangedTitle,
    validator: (title) {
      if (title!.isEmpty) {
        return "The title cannot be empty";
      }

      return null;
    },
    decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Title",
    ),
  );

  Widget buildTime() => DateTimeField(
    format: format,
    onChanged: onChangedTime,
    onShowPicker: (context, value) async {
      final date = await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: value ?? DateTime.now(),
          lastDate: DateTime(2100)
      );

      if (date != null) {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(value ?? DateTime.now()),
        );
        return DateTimeField.combine(date, time);
      }

      return value;
    },
    decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "DateTime",
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      onPressed: onSave,
      child: const Text("Save"),
    ),
  );
}
