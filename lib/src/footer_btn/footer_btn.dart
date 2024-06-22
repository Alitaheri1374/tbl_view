import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbl_view/src/utils.dart';
import '../alert.dart';
import 'change_page_item.dart';
import 'show_all_page.dart';
import '../../tbl_bloc/tbl_view_cubit.dart';
import 'change_row_number.dart';

class CusTblFooterBtn extends StatefulWidget {
  const CusTblFooterBtn({super.key,});

  @override
  State<CusTblFooterBtn> createState() => _CusTblFooterBtnState();
}

class _CusTblFooterBtnState extends State<CusTblFooterBtn> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TblViewCubit, TblViewState>(
  builder: (context, state) {
    return LayoutBuilder(
      builder: (context,boxConstraint) {
        return SizedBox(
          height: max(MediaQuery.sizeOf(context).height*.08, 100),
          width: boxConstraint.maxWidth,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    ///اولین صفحه
                    if(state.activePage!=1)
                      IconButton(onPressed: (){
                        changePage(1);
                      }, icon: const Icon(Icons.first_page,color: Colors.white,))
                    else
                      10.width,
                    if(state.activePage!=1)
                    ///صفحه قبلی
                      IconButton(onPressed: (){
                        changePage(state.activePage-1);
                      }, icon: const Icon(Icons.keyboard_arrow_left_sharp,color: Colors.white,)),
                    ///صفحه قبلی
                    // if(state.activePage!=1)
                    // ChangePageWidget(onTap: (){
                    //   changePage(state.activePage-1);
                    // }, title: (state.activePage-1).toString(),isActive: false,),
                    ///صفحه فعلی
                    ChangePageWidget(onTap: () => changePageAlert(state), title: state.activePage.toString(),isActive: true,),
                    ///صفحه بعدی
                    // if(state.activePage!=state.countPage)
                    // ChangePageWidget(onTap: (){
                    //   changePage(state.activePage+1);
                    // }, title: (state.activePage+1).toString(),isActive: false,),
                    ///صفحه بعدی
                    if(state.activePage!=state.countPage)
                      IconButton(onPressed: (){
                        changePage(state.activePage+1);
                      }, icon: const Icon(Icons.keyboard_arrow_right_sharp,color: Colors.white,))
                    else
                      10.width,
                    ///آخرین صفحه
                    if(state.activePage!=state.countPage)
                      IconButton(onPressed: (){
                        changePage(state.countPage);
                      },tooltip: state.countPage.toString(), icon: const Icon(Icons.last_page,color: Colors.white,)),
                  ]
                ),
              ),
              ElevatedButton(
                onPressed: ()=>changeRowNumber(state),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_drop_down_sharp),
                    10.width,
                    Text( state.intRowNumber.toString()),
                  ],
                ),
              ),
              10.width,
            ],
          ),
        );
      }
    );
  },
);
  }


  ///change rowNumber
  void changeRowNumber(TblViewState state){
     int lengthList=0;
      for(int i=0;i<state.subListBody.length;i++){
        lengthList+=state.subListBody[i].length;
      }
    CustomAlert.basicAlert(context,
        child: CusTblFooterRowNumber(
          currentRowNumber: state.intRowNumber,
          lengthList: lengthList,
          onChange: (rowNumber) {
            BlocProvider.of<TblViewCubit>(context).changeRowNumber(rowNumber);
          },
        )
    );
  }
  ///change page with Alert
  void changePageAlert(TblViewState state){
    CustomAlert.basicAlert(context,
        child: ShowAllPageWidget(
          currentPage: state.activePage,
          countPage: state.countPage,
          onChange: (page) {
            BlocProvider.of<TblViewCubit>(context).changeActivePage(page);
          },
        )
    );
  }
  ///change page with arrow
  void changePage(int page){
    BlocProvider.of<TblViewCubit>(context).changeActivePage(page);
  }



}
