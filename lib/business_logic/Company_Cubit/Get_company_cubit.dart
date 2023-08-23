import 'package:acb/business_logic/Company_Cubit/company_state.dart';
import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class Get_CompanyCubit extends Cubit<CompanyStates> {
  Get_CompanyCubit() : super(CompanyInitialState());

  static Get_CompanyCubit get(context) => BlocProvider.of(context);

  List<Company_Model> Companys = [];
  List<Company_Model> FCompanys = [];

  fetchAllCompany() {
    var CompanyBox = Hive.box<Company_Model>(kCompanyBox);
    FCompanys = CompanyBox.values.toList();
    Companys = FCompanys;
    emit(CompanySuccess());
  }
  //_______________________________________________
  // search

  void searchList({required List<Company_Model> items, required String query}) {
    Companys = items
        .where((item) =>
            item.CompanyName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(CompanySearcheSuccess());
  }
  //_____________________________________________
  // delate

  List<Company_Model>? CompanyList;
  Company_Model? OneCompany;
  Company_Model NotFountModel = Company_Model(
    CompanyID: "",
    CompanyAdress: "",
    CompanyManager: "",
    CompanyName: "",
    CompanyNumber: "",
  );

  DeleteCompany({required String CompanyID}) async {
    CompanyList = [];
    var CompanyBox = Hive.box<Company_Model>(kCompanyBox);
    CompanyList = CompanyBox.values.toList();
    OneCompany = CompanyList!.firstWhere(
      (item) => item.CompanyID == CompanyID.toString(),
      orElse: () => NotFountModel,
    );
    await CompanyBox.delete(OneCompany!.key);
    emit(DelateCompanySuccess());

    // showToast(state: ToastStates.SUCCESS, text: "Delete Done");
  }
}
