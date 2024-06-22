import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbl_view/tbl_bloc/tbl_view_cubit.dart';

///ویجت نمایش هر cell در تیبل
class CellsWidget extends StatelessWidget {
  final String value;
  final TextOverflow? overflow;
  final double? width;

  const CellsWidget({super.key, required this.value, this.width, this.overflow,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TblViewCubit, TblViewState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: SizedBox(
            width:width??state.widthCell,
            height: state.heightCell,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                child: Text(value, style: const TextStyle(color: Colors.black),
                  maxLines: 3,
                  overflow: overflow??TextOverflow.ellipsis,),
              ),
            ),
          ),
        );
      },
    );
  }
}
