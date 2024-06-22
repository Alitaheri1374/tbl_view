import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbl_view/tbl_bloc/tbl_view_cubit.dart';

import '../../model/model.dart';
import 'cell/cell_btn/cell_btn.dart';
import 'cell/cell_label.dart';

class TblRowWidget extends StatelessWidget {
  final int index;

  const TblRowWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TblViewCubit, TblViewState>(
      builder: (context, state) {
        return Row(
          children: [
            for(var e in state.model.columList)
              if(e.type!=ColumnTypeTbl.btn)
              Builder(
                builder: (context) {
                  String? value;
                  try {
                    value=(state.subListBody[state.activePage-1][index][e.clKey]??'').toString();
                  } catch (e) {
                    value='';
                  }
                  return CellsWidget(
                    // value: (state.subListBody[state.activePage-1][index][e.clKey]??'').toString(),
                    value: value,
                  );
                }
              )
              else if(index<state.subListBody[state.activePage-1].length)
                CellsBtnWidget(object: state.subListBody[state.activePage-1][index],type: e.typeBtn??BtnOperationType.other,)
          ],
        );
      },
    );
  }
}
