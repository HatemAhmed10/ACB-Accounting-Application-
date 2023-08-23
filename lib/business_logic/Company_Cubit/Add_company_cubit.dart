import 'package:acb/business_logic/Company_Cubit/company_state.dart';
import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class Add_CompanyCubit extends Cubit<CompanyStates> {
  Add_CompanyCubit() : super(CompanyInitialState());

  static Add_CompanyCubit get(context) => BlocProvider.of(context);

  List<Company_Model>? companyList;
  bool companyFound = false;

  addCompany({required Company_Model companyModel}) async {
    emit(AddCompanyLoading());
    companyList = [];
    companyFound = false;
    var teacherBox = Hive.box<Company_Model>(kCompanyBox);

    companyList = teacherBox.values.toList();

    companyList!.forEach((element) {
      if (element.CompanyName == companyModel.CompanyName) {
        companyFound = true;
      }
    });

    if (companyFound == false) {
      try {
        var teacherBox2 = Hive.box<Company_Model>(kCompanyBox);
        await teacherBox2.add(companyModel);
        emit(AddcompanySuccess());
      } catch (e) {
        emit(AddcompanyFailure());
      }
    } else {
      emit(AddcompanyIsFound());
      // showToast(state: ToastStates.SUCCESS, text: "This Item is Alreade Add");
    }
  }
  // ___________________________________________________________
}
