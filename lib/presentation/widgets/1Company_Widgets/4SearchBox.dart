import 'package:acb/business_logic/Company_Cubit/Get_company_cubit.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4, // 5 top and bottom
      ),
      decoration: BoxDecoration(
        // color: Colors.white.withOpacity(0.4),
        color: kBackGrounBlackdAny,
        borderRadius: BorderRadius.circular(17),
      ),
      child: TextField(
        cursorColor: Colors.white,
        onChanged: (query) => BlocProvider.of<Get_CompanyCubit>(context)
            .searchList(
                items: BlocProvider.of<Get_CompanyCubit>(context).FCompanys,
                query: query),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          // icon: SvgPicture.asset("assets/icons/search.svg"),
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
