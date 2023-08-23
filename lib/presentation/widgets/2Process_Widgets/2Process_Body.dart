import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/shared/Tooles/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Process_Body extends StatelessWidget {
  const Process_Body({super.key, required this.company_model});
  final Company_Model company_model;

  @override
  Widget build(BuildContext context) {
    TextEditingController ProductName_Controller = TextEditingController();

    return BlocProvider(
      create: (context) => Get_Process_Cubit()
        ..fetchAllProcess(
            CompanyID: company_model.CompanyID, model: company_model)
        ..fetchProcessBySaleOrPay(
          CompanyID: company_model.CompanyID,
        ),
      child: BlocBuilder<Get_Process_Cubit, ProcessStates>(
        builder: (context, state) {
          Get_Process_Cubit get_process_cubit = Get_Process_Cubit.get(context);

          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //___________________________________________________________
                  // Show Data
                  Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: get_process_cubit.process.length,
                      itemBuilder: (context, index) => Container(
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              color: Colors.red,
                              child: Row(
                                children: [
                                  Text(
                                    get_process_cubit.process[index].ProductName
                                        .toString(),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    get_process_cubit.process[index].DateProcess
                                        .toString(),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    get_process_cubit
                                        .process[index].ProductPrice
                                        .toString(),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    get_process_cubit.process[index].TypeProcess
                                        .toString(),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    get_process_cubit
                                        .process[index].CompanyOwner
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //_______________________________________________________
                  // حساب الريح والخساره
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("pay"),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child:
                                  Text(get_process_cubit.TotalPay.toString()),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("الربح"),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text(get_process_cubit.ResultOfPayAndSale
                                  .toString()),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("sale"),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child:
                                  Text(get_process_cubit.TotalSale.toString()),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),

                  //____________________________________________________
                  // Tables
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    color: Colors.blue,
                    height: 400,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Center(
                          child: Text("جدول ال Pay"),
                        ),
                        Table(
                          border: TableBorder.all(),
                          defaultColumnWidth: FixedColumnWidth(120.0),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.yellow,
                                    child: Text('Process Name'),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text('Process Price'),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text('Process Date'),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text('Company Owner'),
                                  ),
                                ),
                              ],
                            ),
                            for (var item in get_process_cubit.Pay_process)
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Center(
                                      child: Text(item.ProductName),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(item.ProductPrice.toString()),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(item.DateProcess.toString()),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(item.CompanyOwner.toString()),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text("جدول ال Sale"),
                        ),
                        Table(
                          border: TableBorder.all(),
                          defaultColumnWidth: FixedColumnWidth(120.0),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.yellow,
                                    child: Text('Process Name'),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text('Process Price'),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text('Process Date'),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text('Company Owner'),
                                  ),
                                ),
                              ],
                            ),
                            for (var item in get_process_cubit.Sale_process)
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Center(
                                      child: Text(item.ProductName),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(item.ProductPrice.toString()),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(item.DateProcess.toString()),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(item.CompanyOwner.toString()),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // _____________________________________________________
                  // search by Product Name
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: double.infinity,
                    height: 400,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 350,
                              margin: EdgeInsets.only(
                                  top: 6, bottom: 6, left: 28, right: 28),
                              child: CustomTextFormField(
                                keyboardType: TextInputType.text,
                                textEditingController: ProductName_Controller,
                                HintText: "Product Name ",
                                icons: Icons.title,
                                validatorFunctoion: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            CircleAvatar(
                              child: IconButton(
                                onPressed: () {
                                  get_process_cubit.fetchDataUsingProductName(
                                    CompanyID: company_model.CompanyID,
                                    ProductName:
                                        ProductName_Controller.text.toString(),
                                  );
                                  print(ProductName_Controller.text.toString());
                                },
                                icon: Icon(Icons.send),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        get_process_cubit.ProductName_process.isEmpty
                            ? Text("Not Found")
                            : Container(
                                color: Colors.blue,
                                height: 200,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Table(
                                      border: TableBorder.all(),
                                      defaultColumnWidth:
                                          FixedColumnWidth(120.0),
                                      children: [
                                        TableRow(
                                          children: [
                                            TableCell(
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.yellow,
                                                child: Text('Process Name'),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text('Process Price'),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text('Process Date'),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text('Company Owner'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        for (var item in get_process_cubit
                                            .ProductName_process)
                                          TableRow(
                                            children: [
                                              TableCell(
                                                child: Center(
                                                  child: Text(item.ProductName),
                                                ),
                                              ),
                                              TableCell(
                                                child: Center(
                                                  child: Text(item.ProductPrice
                                                      .toString()),
                                                ),
                                              ),
                                              TableCell(
                                                child: Center(
                                                  child: Text(item.DateProcess
                                                      .toString()),
                                                ),
                                              ),
                                              TableCell(
                                                child: Center(
                                                  child: Text(item.CompanyOwner
                                                      .toString()),
                                                ),
                                              ),
                                            ],
                                          ),
                                        TableRow(
                                          children: [
                                            TableCell(
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.yellow,
                                                child: Text(get_process_cubit
                                                    .ProductName_process.length
                                                    .toString()),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text(get_process_cubit
                                                        .ProductNameResult
                                                    .toString()),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text(''),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: Text(''),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),

                  //______________________________________________

                  //  عايز اعرف بشتري من كل شركه بكام بقا
                  Container(
                    color: Colors.black,
                    height: 300,
                    child: Column(
                      children: [
                        MaterialButton(
                          // minWidth: 150,
                          height: 60,
                          onPressed: () {
                            get_process_cubit.GetInFormationAboutCompany(
                                CompanyID: company_model.CompanyID);
                          },
                          child: Text(
                            "Add Process".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          color: Colors.yellow,
                          height: 200,
                          child: ListView.builder(
                            itemCount: get_process_cubit.MapOfProcess.length,
                            itemBuilder: (context, index) => Container(
                              child: Row(
                                children: [
                                  Text(
                                    "اسم الشركه" +
                                        get_process_cubit.MapOfProcess[index]
                                                ["CompanyName"]
                                            .toString(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "رقم عمليات الشراء او البيع" +
                                        get_process_cubit.MapOfProcess[index]
                                                ["NumberOfProcess"]
                                            .toString(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "تم شراء منهم ب " +
                                        get_process_cubit.MapOfProcess[index]
                                                ["Pay"]
                                            .toString(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "تم بيع ليهم ب" +
                                        get_process_cubit.MapOfProcess[index]
                                                ["Sale"]
                                            .toString(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("الربح" +
                                      (double.parse(get_process_cubit
                                                  .MapOfProcess[index]["Sale"]
                                                  .toString()) -
                                              double.parse(get_process_cubit
                                                  .MapOfProcess[index]["Pay"]))
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
