import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../tbl_bloc/tbl_view_cubit.dart';
import '../../../../model/model.dart';
import 'show_row_vetically/show_row_vertically.dart';

///ویجت  cell نمایش  btn برای هر ردیف  در تیبل
class CellsBtnWidget extends StatelessWidget {
  final Map<String,dynamic> object;
  final BtnOperationType type;
  const CellsBtnWidget({super.key, required this.object, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TblViewCubit, TblViewState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: SizedBox(
            width:state.widthCellBtn,
            height: state.heightCell,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                child: InkWell(
                  onTap: () {
                    if(type==BtnOperationType.showDetail){
                      showDetailVertical(context,state);
                    }
                    else{
                      operation(state);
                    }
                  },
                  child:

                  (type==BtnOperationType.add)?
                    Icon(Icons.add,color: Theme.of(context).primaryColor,):
                  (type==BtnOperationType.edit)?
                    const Icon(Icons.edit,color: Colors.yellow,):
                  (type==BtnOperationType.delete)?
                    Icon(Icons.delete,color: Theme.of(context).colorScheme.error,):
                  (type==BtnOperationType.showDetail)?
                    Icon(CupertinoIcons.ellipsis_vertical_circle_fill,color: Theme.of(context).primaryColor,):
                  (type==BtnOperationType.other)?
                    Icon(Icons.settings,color: Theme.of(context).primaryColor,):
                  Icon(Icons.settings,color: Theme.of(context).primaryColor,),
                ),
              ),
            ),
          )
        );
      },
    );
  }


  ///show Detail
  void showDetailVertical(BuildContext context,TblViewState state){
    Route route=MaterialPageRoute(builder: (context) => ShowRowVerticallyWidget(object: object,state: state,),);
    Navigator.push(context, route);
  }

  void operation(TblViewState state){
    switch(type){
      case BtnOperationType.add:addMethod(state);
      break;
      case BtnOperationType.edit:editMethod(state);
      break;
      case BtnOperationType.delete:deleteMethod(state);
      break;
      case BtnOperationType.other:otherMethod(state);
      break;
      default:
        break;
    }
  }

  void addMethod(TblViewState state){
    state.addMethod?.call(object);
  }
  void editMethod(TblViewState state){
    state.editMethod?.call(object);
  }
  void deleteMethod(TblViewState state){
    state.deleteMethod?.call(object);
  }
  void otherMethod(TblViewState state){
    state.otherMethod?.call(object);
  }
}
