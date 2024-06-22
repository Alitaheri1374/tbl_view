import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../tbl_bloc/tbl_view_cubit.dart';
import 'rows.dart';

class TblListViewWidget extends StatelessWidget {
  const TblListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TblViewCubit, TblViewState>(
      builder: (context, state) {
        return LayoutBuilder(
            builder: (context, boxConstraints) {
              return SizedBox(
                height: boxConstraints.maxHeight,
                child:
                state.model.body.isEmpty ||
                      state.subListBody.isEmpty?
                  const Text("emptyDataList",)
                :
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      for(int index =0 ;index< state.subListBody[state.activePage-1].length;index++)
                        InkWell(
                            onTap: () {
                              state.press?.call(state.subListBody[state.activePage-1][index]);
                            },
                            child: TblRowWidget(index: index,)),
                    ],
                  ),
                ),);
            }
        );
      },
    );
  }
}
