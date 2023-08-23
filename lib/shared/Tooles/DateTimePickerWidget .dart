import 'package:acb/business_logic/Process_Cubit/Add_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimePickerWidget extends StatefulWidget {
  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Add_Process_Cubit, ProcessStates>(
      builder: (context, state) {
        Add_Process_Cubit add_process_cubit = Add_Process_Cubit.get(context);
        return Container(
          height: 50,
          child: InkWell(
            onTap: () {
              add_process_cubit.GetDateTime(context: context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${add_process_cubit.selectedDate.year.toString()} /',
                  style: TextStyle(fontSize: 20, color: Color(0xFFFFC727)),
                ),
                Text(
                  '${add_process_cubit.selectedDate.month.toString()} /',
                  style: TextStyle(fontSize: 20, color: Color(0xFFFFC727)),
                ),
                Text(
                  '${add_process_cubit.selectedDate.day.toString()}',
                  style: TextStyle(fontSize: 20, color: Color(0xFFFFC727)),
                ),
              ],
            ),
          ),
        );
        // return Column(
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {
        //         add_process_cubit.GetDateTime(context: context);
        //       },
        //       child: Text('Select Date'),
        //     ),
        //     SizedBox(height: 16.0),
        //     Text(
        //       'Selected Date: ${add_process_cubit.selectedDate.day.toString() ?? 'Not selected'}',
        //     ),
        //     Text(
        //       'Selected Date: ${add_process_cubit.selectedDate.month.toString() ?? 'Not selected'}',
        //     ),
        //     Text(
        //       'Selected Date: ${add_process_cubit.selectedDate.year.toString() ?? 'Not selected'}',
        //     ),
        //   ],
        // );
      },
    );
  }
}
