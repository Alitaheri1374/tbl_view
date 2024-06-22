import 'package:flutter/material.dart';
import 'package:tbl_view/tbl_view.dart'; 

import 'val.dart';

class TblTest extends StatefulWidget {
  const TblTest({super.key});

  @override
  State<TblTest> createState() => _TblTestState();
}

class _TblTestState extends State<TblTest> {
  List<ModelHeaderTblView>header=ValTbl.dataHeader;
  List<Map<String,dynamic>> data=ValTbl.data;
  @override
  Widget build(BuildContext context) {
    return CusTblView(
      model: ModelTblView(
        columList: header,
        body: data,
      ),
      loading: false,
      press: (object) {
        debugPrint(object.toString());
      },
      addMethod: (object) {
        debugPrint("CALL addMethod");
        debugPrint(object.toString());
        debugPrint("==="*10);
      },
      editMethod: (object) {
        debugPrint("CALL editMethod");
        debugPrint(object.toString());
        debugPrint("==="*10);
      },
      deleteMethod: (object) {
        debugPrint("CALL deleteMethod");
        debugPrint(object.toString());
        debugPrint("==="*10);
      },
      otherMethod: (object) {
        debugPrint("CALL otherMethod");
        debugPrint(object.toString());
        debugPrint("==="*10);
      },

    );
  }
}
