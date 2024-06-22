import 'package:flutter/material.dart';

import 'column.dart';
import 'show_items/tbl_list_view.dart';

class ShowBodyTblViewWidget extends StatelessWidget {
  const ShowBodyTblViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,boxConstraints) {
        return SizedBox(
          width: boxConstraints.maxWidth,
          height: boxConstraints.maxHeight,
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                  ///ستونها
                  ColumnItem(),
                  Expanded(child: TblListViewWidget())
              ],
            ),
          ),
        );
      }
    );
  }
}
