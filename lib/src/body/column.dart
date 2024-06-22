import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tbl_bloc/tbl_view_cubit.dart';
import '../model/model.dart';
import 'show_items/cell/cell_label.dart';

/// # نمایش header  ستون ها
class ColumnItem extends StatelessWidget {
  const ColumnItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TblViewCubit, TblViewState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(.3)
          ),
          child: SizedBox(
            height: state.heightCell,
            child: Row(
              children: [
                for(var e in state.model.columList)
                  CellsWidget(value: e.clTitle??'',overflow: TextOverflow.visible,
                    width: e.type==ColumnTypeTbl.btn?state.widthCellBtn:null,
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
