import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbl_view/src/utils.dart';
import '../../tbl_bloc/tbl_view_cubit.dart';
import 'animated_search_widget.dart';
class SearchTbl extends StatefulWidget {
  const SearchTbl({super.key});

  @override
  State<SearchTbl> createState() => _SearchTblState();
}

class _SearchTblState extends State<SearchTbl> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: max(60, context.height*.07),
          width: context.width,
          child: CustomSearchBox(
            controller: textController,
            searchFunction: (txt) {
              BlocProvider.of<TblViewCubit>(context).search(textController.text);
            },
          ),
        ),
      ),
    );
  }
}
