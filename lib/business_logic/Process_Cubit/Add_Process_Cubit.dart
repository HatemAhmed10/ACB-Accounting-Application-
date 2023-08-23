import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/models/2Process_Model/process_model.dart';
import 'package:acb/shared/Tooles/4CustomshowToast.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class Add_Process_Cubit extends Cubit<ProcessStates> {
  Add_Process_Cubit() : super(ProcessInitialState());

  static Add_Process_Cubit get(context) => BlocProvider.of(context);

  //_____________________________________
  String selectedValue = "Pay";
  void updateSelectedValue(String newValue) {
    selectedValue = newValue;
    emit(DropdownState());
  }
//______________________________________________

  DateTime selectedDate = DateTime.now();

  void GetDateTime({required BuildContext context}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      emit(GetDateTimestate());
    }
  }

  //___________________________________________________________________

  addProcess({required Process_Model process_model}) async {
    emit(AddProcessLoading());
    print(process_model.ProductName.toString());
    try {
      var ProcessBox = Hive.box<Process_Model>(kProcessBox);
      await ProcessBox.add(process_model);
      // showToast(state: ToastStates.SUCCESS, text: "Good Add");
      emit(AddProcessSuccess());
    } catch (e) {
      emit(AddProcessFailure());
    }
  }
  // ___________________________________________________________
}
