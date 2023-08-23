import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/models/2Process_Model/process_model.dart';
import 'package:acb/presentation/screens/2Process_Screen/Screens/1showAllProcess.dart';
import 'package:acb/presentation/screens/2Process_Screen/Screens/2showTotaleOfMoney.dart';
import 'package:acb/presentation/screens/2Process_Screen/Screens/3FindOneProduct.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class Get_Process_Cubit extends Cubit<ProcessStates> {
  Get_Process_Cubit() : super(ProcessInitialState());

  static Get_Process_Cubit get(context) => BlocProvider.of(context);

// Get all data for this Company
  List<Process_Model> process = [];

  Company_Model? company_model;

  fetchAllProcess({required String CompanyID, required Company_Model model}) {
    company_model = model;

    var ProcessBox = Hive.box<Process_Model>(kProcessBox);
    final data =
        ProcessBox.values.where((element) => element.CompanyID == CompanyID);

    process = data.toList();
    print(process.length);

    emit(ProcessSuccess());
  }

  //___________________________________________________________
  // Get data by pay or sale
  List<Process_Model> Pay_process = [];
  List<Process_Model> Sale_process = [];

  double TotalPay = 0;
  double TotalSale = 0;
  double ResultOfPayAndSale = 0;

  fetchProcessBySaleOrPay({required String CompanyID}) {
    Pay_process = [];
    Sale_process = [];
    var ProcessBox = Hive.box<Process_Model>(kProcessBox);
    final data = ProcessBox.values.where((element) =>
        element.CompanyID == CompanyID && element.TypeProcess == "PAY");
    Pay_process = data.toList();

    final data2 = ProcessBox.values.where((element) =>
        element.CompanyID == CompanyID && element.TypeProcess == "SELA");
    Sale_process = data2.toList();

    Pay_process.forEach((element) {
      TotalPay = TotalPay + double.parse(element.ProductPrice);
    });
    Sale_process.forEach((element) {
      TotalSale = TotalSale + double.parse(element.ProductPrice);
    });

    ResultOfPayAndSale = TotalPay - TotalSale;

    emit(fetchProcessBySaleOrPaySuccess());
  }

//_____________________________________________________________________
  // Get Data using Product Name

  List<Process_Model> ProductName_process = [];
  double ProductNameResult = 0;
  double ProductLateMoeny = 0;

  fetchDataUsingProductName(
      {required String CompanyID, required String ProductName}) {
    emit(fetchDataUsingProductNameLoading());
    var ProcessBox = Hive.box<Process_Model>(kProcessBox);
    final data2 = ProcessBox.values.where((element) =>
        element.CompanyID == CompanyID && element.ProductName == ProductName);
    ProductName_process = data2.toList();
    if (ProductName_process.isNotEmpty) {
      ProductName_process.forEach((element) {
        ProductNameResult =
            ProductNameResult + double.parse(element.ProductPrice);
        ProductLateMoeny = ProductLateMoeny + double.parse(element.LateMoney);
      });
    }
    emit(fetchDataUsingProductNameSuccess());
  }

  //____________________________________________________________
  // Get Information about Company Owner
  List<Process_Model> Allprocess = [];
  List<String> CompanysOwner = [];

  List<List<Process_Model>> Allprocess_CompanysOwner = [];
  List<Process_Model> Oneprocess = [];
  List<dynamic> MapOfProcess = [];

  double processPay = 0;
  double processSale = 0;

  void GetInFormationAboutCompany({required String CompanyID}) {
    Allprocess = [];
    CompanysOwner = [];
    Allprocess_CompanysOwner = [];
    Oneprocess = [];
    MapOfProcess = [];

    emit(GetInFormationAboutCompanyLoading());
    var ProcessBox = Hive.box<Process_Model>(kProcessBox);
    final data =
        ProcessBox.values.where((element) => element.CompanyID == CompanyID);

    Allprocess = data.toList();

    Allprocess.forEach((element) {
      CompanysOwner.add(element.CompanyOwner.toString());
    });
    print(CompanysOwner.toString());

    Set<String> setCompanysOwner = Set<String>.from(CompanysOwner);

    print(setCompanysOwner.toString());

    setCompanysOwner.forEach(
      (element) {
        print(element.toString());
        var ProcessBox2 = Hive.box<Process_Model>(kProcessBox);
        final data3 = ProcessBox2.values.where((element2) =>
            element2.CompanyID == CompanyID &&
            element2.CompanyOwner.toString() == element.toString());
        Oneprocess = data3.toList();
        Allprocess_CompanysOwner.add(Oneprocess);
      },
    );
    Allprocess_CompanysOwner.forEach(
      (element) {
        print(element.toString());
        element.forEach((element) {
          if (element.TypeProcess == "PAY") {
            processPay = processPay + double.parse(element.ProductPrice);
          } else if (element.TypeProcess == "SELA") {
            processSale = processSale + double.parse(element.ProductPrice);
          }
          print("AAAAAAA ${element.TypeProcess.toString()}");
        });
        MapOfProcess.add({
          "CompanyName": element[0].CompanyOwner.toString(),
          "NumberOfProcess": element.length.toString(),
          "Pay": processPay.toString(),
          "Sale": processSale.toString(),
        });
        MapOfProcess.sort(
            (a, b) => b['NumberOfProcess'].compareTo(a['NumberOfProcess']));
        processPay = 0;
        processSale = 0;
      },
    );
    print("TTTTT ${MapOfProcess.toString()}");

    emit(GetInFormationAboutCompanySuccess());
  }
  //______________________________________________________________

  int currentIndex = 1;

  List<Widget> screens = [
    showAllProcess(),
    showTotaleOfMoney(),
    FindOneProduct(),
    // Test(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  //______________________________________________________________

  // get data about one month
  List<Process_Model> One_Month_Pay_process = [];
  List<Process_Model> One_Month_Sale_process = [];
  List<Process_Model> One_Month_All_process = [];

  double Total_One_Month_Pay = 0;
  double Total_One_Month_Sale = 0;
  double Result_One_Month_OfPayAndSale = 0;

  void getDataAboutOneMonth({
    required String CompanyID,
    required String EYear,
    required String EMonth,
  }) {
    One_Month_Pay_process = [];
    One_Month_Sale_process = [];
    One_Month_All_process = [];

    Total_One_Month_Pay = 0;
    Total_One_Month_Sale = 0;
    Result_One_Month_OfPayAndSale = 0;

    var One_Month_process_ProcessBox = Hive.box<Process_Model>(kProcessBox);
    final data3 = One_Month_process_ProcessBox.values.where(
      (element) =>
          element.CompanyID == CompanyID &&
          element.DateProcess.year.toString() == EYear.toString() &&
          element.DateProcess.month.toString() == EMonth.toString(),
    );
    One_Month_All_process = data3.toList();

    final data = One_Month_process_ProcessBox.values.where(
      (element) =>
          element.CompanyID == CompanyID &&
          element.DateProcess.year.toString() == EYear.toString() &&
          element.DateProcess.month.toString() == EMonth.toString() &&
          element.TypeProcess == "PAY",
    );
    One_Month_Pay_process = data.toList();

    One_Month_Pay_process.forEach((element) {
      Total_One_Month_Pay =
          Total_One_Month_Pay + double.parse(element.ProductPrice);
    });

    final data2 = One_Month_process_ProcessBox.values.where(
      (element) =>
          element.CompanyID == CompanyID &&
          element.DateProcess.year.toString() == EYear.toString() &&
          element.DateProcess.month.toString() == EMonth.toString() &&
          element.TypeProcess == "SELA",
    );
    One_Month_Sale_process = data2.toList();
    One_Month_Sale_process.forEach((element) {
      Total_One_Month_Sale =
          Total_One_Month_Sale + double.parse(element.ProductPrice);
    });

    Result_One_Month_OfPayAndSale = Total_One_Month_Pay - Total_One_Month_Sale;
    print(One_Month_Pay_process.toString());
    print(One_Month_Sale_process.toString());

    emit(getDataAboutOneMonthstate());
  }

  //______________________________________________

  DateTime selectedDate2 = DateTime.now();

  void GetDateTime2({required BuildContext context}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate2) {
      selectedDate2 = pickedDate;
      emit(GetDateTimestate2());
    }
  }

  //___________________________________________________________________
  List<Process_Model> One_Year_Pay_process = [];
  List<Process_Model> One_Year_Sale_process = [];
  List<Process_Model> One_Year_All_process = [];

  double Total_One_Year_Pay = 0;
  double Total_One_Year_Sale = 0;
  double Result_One_Year_OfPayAndSale = 0;
  List AllMonthesOfYears = [];

  void getDataAboutOneYear({
    required String CompanyID,
    required String EYear,
  }) {
    One_Year_Pay_process = [];
    One_Year_Sale_process = [];
    One_Year_All_process = [];
    AllMonthesOfYears = [];

    Total_One_Year_Pay = 0;
    Total_One_Year_Sale = 0;
    Result_One_Year_OfPayAndSale = 0;

    var One_Year_process_ProcessBox = Hive.box<Process_Model>(kProcessBox);

    for (int x = 0; x < 12; x++) {
      final data = One_Year_process_ProcessBox.values.where(
        (element) =>
            element.CompanyID == CompanyID &&
            element.DateProcess.year.toString() == EYear.toString() &&
            element.DateProcess.month.toString() == "${x + 1}" &&
            element.TypeProcess == "PAY",
      );
      One_Year_Pay_process = data.toList();

      One_Year_Pay_process.forEach((element) {
        Total_One_Year_Pay =
            Total_One_Year_Pay + double.parse(element.ProductPrice);
      });

      final data2 = One_Year_process_ProcessBox.values.where(
        (element) =>
            element.CompanyID == CompanyID &&
            element.DateProcess.year.toString() == EYear.toString() &&
            element.DateProcess.month.toString() == "${x + 1}" &&
            element.TypeProcess == "SELA",
      );
      One_Year_Sale_process = data2.toList();
      One_Year_Sale_process.forEach((element) {
        Total_One_Year_Sale =
            Total_One_Year_Sale + double.parse(element.ProductPrice);
      });

      Result_One_Year_OfPayAndSale = Total_One_Year_Pay - Total_One_Year_Sale;
      AllMonthesOfYears.add(Result_One_Year_OfPayAndSale);
      One_Year_Pay_process = [];
      One_Year_Sale_process = [];
      One_Year_All_process = [];

      Total_One_Year_Pay = 0;
      Total_One_Year_Sale = 0;
      Result_One_Year_OfPayAndSale = 0;
    }
    print(AllMonthesOfYears.toString());

    emit(getDataAboutOneYearstate());
  }

  //___________________________________________________________
  // Get data by Late Moeny
  List<Process_Model> late_Moeny_Pay_process = [];
  double LateMoenyOfPay = 0;
  double takeMoenyOPay = 0;
  List<Process_Model> late_Moeny_Sale_process = [];
  double LateMoenyOfSale = 0;
  double takeMoenyOSale = 0;
  fetchProcessByLateMOeny({required String CompanyID}) {
    late_Moeny_Pay_process = [];
    LateMoenyOfPay = 0;
    takeMoenyOPay = 0;
    late_Moeny_Sale_process = [];
    LateMoenyOfSale = 0;
    takeMoenyOSale = 0;
    var ProcessBox = Hive.box<Process_Model>(kProcessBox);
    final data = ProcessBox.values.where((element) =>
        element.CompanyID == CompanyID &&
        int.parse(element.LateMoney) > 0 &&
        element.TypeProcess == "PAY");
    late_Moeny_Pay_process = data.toList();

    late_Moeny_Pay_process.forEach((element) {
      takeMoenyOPay = takeMoenyOPay + double.parse(element.ProductPrice);
      LateMoenyOfPay = LateMoenyOfPay + double.parse(element.LateMoney);
    });

    final data2 = ProcessBox.values.where((element) =>
        element.CompanyID == CompanyID &&
        int.parse(element.LateMoney) > 0 &&
        element.TypeProcess == "SELA");
    late_Moeny_Sale_process = data2.toList();

    late_Moeny_Sale_process.forEach((element) {
      takeMoenyOSale = takeMoenyOSale + double.parse(element.ProductPrice);
      LateMoenyOfSale = LateMoenyOfSale + double.parse(element.LateMoney);
    });

    emit(fetchProcessByLateMoenySuccess());
  }

//_____________________________________________________________________

  //___________________________________________________________
  // Get data by Late Moeny
  List<Process_Model> late_Moeny_Pay_process2 = [];
  double LateMoenyOfPay2 = 0;
  List<Process_Model> late_Moeny_Sale_process2 = [];
  double LateMoenyOfSale2 = 0;
  fetchProcessByLateMOenyByMonth({
    required String CompanyID,
    required String EYear,
    required String EMonth,
  }) {
    late_Moeny_Pay_process2 = [];
    LateMoenyOfPay2 = 0;
    late_Moeny_Sale_process2 = [];
    LateMoenyOfSale2 = 0;
    var ProcessBox = Hive.box<Process_Model>(kProcessBox);
    final data = ProcessBox.values.where((element) =>
        element.CompanyID == CompanyID &&
        int.parse(element.LateMoney) > 0 &&
        element.DateProcess.year.toString() == EYear.toString() &&
        element.DateProcess.month.toString() == EMonth.toString() &&
        element.TypeProcess == "PAY");
    late_Moeny_Pay_process2 = data.toList();

    late_Moeny_Pay_process2.forEach((element) {
      LateMoenyOfPay2 = LateMoenyOfPay2 + double.parse(element.LateMoney);
    });

    final data2 = ProcessBox.values.where((element) =>
        element.CompanyID == CompanyID &&
        int.parse(element.LateMoney) > 0 &&
        element.TypeProcess == "SELA");
    late_Moeny_Sale_process2 = data2.toList();

    late_Moeny_Sale_process2.forEach((element) {
      LateMoenyOfSale2 = LateMoenyOfSale2 + double.parse(element.LateMoney);
    });

    emit(fetchProcessByLateMoenySuccess());
  }

//_____________________________________________________________________
}
