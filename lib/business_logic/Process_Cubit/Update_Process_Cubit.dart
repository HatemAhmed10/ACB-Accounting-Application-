import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/models/2Process_Model/process_model.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class Update_Process_Cubit extends Cubit<ProcessStates> {
  Update_Process_Cubit() : super(ProcessInitialState());

  static Update_Process_Cubit get(context) => BlocProvider.of(context);

  //_____________________________________
  String selectedValue = "Pay";
  void updateSelectedValue(String newValue) {
    selectedValue = newValue;
    emit(DropdownState());
  }
//______________________________________________

  //______________________________________________

  DateTime selectedDate3 = DateTime.now();
  void addDateTime({required DateTime dateTime}) {
    selectedDate3 = dateTime;
  }

  void GetDateTime3({required BuildContext context}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate3) {
      selectedDate3 = pickedDate;
      emit(GetDateTimestate2());
    }
  }

  //___________________________________________________________________

  // ___________________________________________________________
  // Update

  List<Process_Model> process = [];
  Process_Model? OneProcessModel;

  UpdateProcess(
      {required String CompanyID, required Process_Model process_model}) async {
    process = [];

    var ProcessBox = Hive.box<Process_Model>(kProcessBox);
    final datakeys = ProcessBox.keys.firstWhere(
      (key) =>
          (ProcessBox.get(key) as Process_Model).ProcessID.toString() ==
          process_model.ProcessID.toString(),
      orElse: () => null,
      // (element) =>
      //     element.CompanyID == CompanyID &&
      //     element.ProcessID.toString() == process_model.ProcessID.toString(),
    );
    if (datakeys != null) {
      var myData = ProcessBox.get(datakeys) as Process_Model;
      myData.ProductName = process_model.ProductName;
      myData.ProductPrice = process_model.ProductPrice;
      myData.LateMoney = process_model.LateMoney;
      myData.CompanyOwner = process_model.CompanyOwner;
      myData.DateProcess = process_model.DateProcess;
      myData.TypeProcess = process_model.TypeProcess;
      myData.save();
    }
    emit(UpdateProcessstate());
  }

//_____________________________________________________________________
  // delate Process
  List<Process_Model>? ProcessList;
  Process_Model? OneProcess;
  Process_Model NotFountModel = Process_Model(
    CompanyID: "",
    CompanyOwner: "",
    DateProcess: DateTime.now(),
    LateMoney: "",
    ProcessID: "",
    ProductName: "",
    ProductPrice: "",
    TypeProcess: "",
  );
  DeleteProcess({required String ProcessID}) async {
    ProcessList = [];
    var ProcessBox = Hive.box<Process_Model>(kProcessBox);
    ProcessList = ProcessBox.values.toList();
    OneProcess = ProcessList!.firstWhere(
      (item) => item.ProcessID == ProcessID.toString(),
      orElse: () => NotFountModel,
    );
    await ProcessBox.delete(OneProcess!.key);
    emit(DelateProcessSuccess());

    // showToast(state: ToastStates.SUCCESS, text: "Delete Done");
  }
//______________________________________________________________________
}
