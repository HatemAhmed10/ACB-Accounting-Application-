import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/business_logic/Process_Cubit/Update_Process_Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimePickerWidgetToUpdate extends StatefulWidget {
  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidgetToUpdate> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Update_Process_Cubit, ProcessStates>(
      builder: (context, state) {
        Update_Process_Cubit add_process_cubit =
            Update_Process_Cubit.get(context);
        return Container(
          height: 50,
          child: InkWell(
            onTap: () {
              add_process_cubit.GetDateTime3(context: context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${add_process_cubit.selectedDate3.year.toString()} /',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFC727),
                  ),
                ),
                Text(
                  '${add_process_cubit.selectedDate3.month.toString()} /',
                  style: TextStyle(fontSize: 20, color: Color(0xFFFFC727)),
                ),
                Text(
                  '${add_process_cubit.selectedDate3.day.toString()}',
                  style: TextStyle(fontSize: 20, color: Color(0xFFFFC727)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
