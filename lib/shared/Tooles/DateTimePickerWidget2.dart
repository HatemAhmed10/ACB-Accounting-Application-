import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimePickerWidget2 extends StatefulWidget {
  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget2> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Get_Process_Cubit, ProcessStates>(
      builder: (context, state) {
        Get_Process_Cubit add_process_cubit = Get_Process_Cubit.get(context);
        return Container(
          height: 50,
          child: InkWell(
            onTap: () {
              add_process_cubit.GetDateTime2(context: context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${add_process_cubit.selectedDate2.year.toString()} / ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFC727),
                  ),
                ),
                Text(
                  '${add_process_cubit.selectedDate2.month.toString()} ',
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
