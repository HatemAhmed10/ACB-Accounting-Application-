// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:acb/presentation/widgets/1Company_Widgets/2CompanyBody.dart';
import 'package:acb/presentation/widgets/1Company_Widgets/Add_Company.dart';
import 'package:acb/shared/Tooles/routes.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';

class company_view extends StatefulWidget {
  const company_view({super.key});

  @override
  State<company_view> createState() => _company_viewState();
}

class _company_viewState extends State<company_view> {
  @override
  Widget build(BuildContext context) {
    TextEditingController CompanyName_Controller = TextEditingController();
    TextEditingController CompanyAdress_Controller = TextEditingController();
    TextEditingController CompanyNumber_Controller = TextEditingController();
    TextEditingController CompanyManager_Controller = TextEditingController();

    return Scaffold(
      backgroundColor: secondaryColor,
      // appBar: AppBar(
      //   title: Text("company_view"),
      // ),
      body: Company_Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          navigateTo(context, AddCompany());

          // navigateTo();
          // CustomBottomSheet(context: context);
        },
        child: Icon(
          size: 30,
          Icons.add,
          color: Color(0xFFFFC727),
        ),
      ),
    );
  }
}
