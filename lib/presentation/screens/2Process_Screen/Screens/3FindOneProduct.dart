import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/2tableOfPay.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/3tableOFSales.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/4tableOfProductName.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/5tableOfCompanyOwner.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/6TableOFMonthProcess.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindOneProduct extends StatelessWidget {
  const FindOneProduct({super.key});

  // String z = NumberFormat.compact().format(1000000);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Get_Process_Cubit, ProcessStates>(
      listener: (context, state) {},
      builder: (context, state) {
        double screenHeight = MediaQuery.of(context).size.height;
        print(screenHeight.toString());

        Get_Process_Cubit get_process_cubit = Get_Process_Cubit.get(context);

        return Scaffold(
          backgroundColor: secondaryColor,
          // appBar: AppBar(
          //   title: Text("الربح"),
          // ),
          body: PageView(
            children: <Widget>[
              Container(
                color: Colors.yellow,
                child: TableOfPay(),
              ),
              Container(
                color: Colors.blue,
                child: TableOfSales(),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: TableOfProductName(
                    company_model: get_process_cubit.company_model!),
              ),
              Container(
                color: Colors.green,
                child: TableOFCompanyOwner(),
              ),
              Container(
                color: Colors.green,
                child: TableOFMonthProcess(),
              ),
            ],
          ),
        );
      },
    );
  }
}
