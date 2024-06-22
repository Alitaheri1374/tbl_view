import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../src/utils.dart';
import '../tbl_view.dart';
part 'tbl_view_state.dart';

typedef MyIsolateCallback = void Function();

class TblViewCubit extends Cubit<TblViewState> {
  TblViewCubit() : super(TblViewState(model: ModelTblView(columList: [],body: []),widthCell: 100));

  /// # set allParams in bloc
  void setAllParams(BuildContext context,{
    required ModelTblView model,
    ///# call function after press rowNumber
    required Function(Map<String,dynamic>)? press,
    ///# call function after press add btn
    Function(Map<String,dynamic>)? addMethod,
    ///# call function after press edit btn
    Function(Map<String,dynamic>)? editMethod,
    ///# call function after press delete btn
    Function(Map<String,dynamic>)? deleteMethod,
    ///# call function after press other btn
    Function(Map<String,dynamic>)? otherMethod
  }){

    emit(
        TblViewState(model: model,press:(Map<String,dynamic>object){
          press?.call(object);
        },
            addMethod:addMethod==null?null:(Map<String,dynamic>object){addMethod.call(object);} ,
            editMethod:editMethod==null?null:(Map<String,dynamic>object){editMethod.call(object);} ,
            deleteMethod:deleteMethod==null?null:(Map<String,dynamic>object){deleteMethod.call(object);} ,
            otherMethod:otherMethod==null?null:(Map<String,dynamic>object){otherMethod.call(object);} ,
        intRowNumber: state.intRowNumber,
          activePage: 1,
          countPage: CusTblUtils.count(model.body.length,state.intRowNumber),
          subListBody: CusTblUtils.convertToSubLists(model.body, state.intRowNumber),
          widthCell: max(state.widthCell,MediaQuery.of(context).size.width/model.columList.length),
          widthTbl: max(state.widthCell,MediaQuery.of(context).size.width/model.columList.length) * state.model.columList.length
    ));
  }



  /// # change page
  void changeActivePage(int activePage){
    if (activePage <= state.countPage) {
      emit(TblViewState(model: state.model,
          press: state.press,
          addMethod: state.addMethod,
          editMethod: state.editMethod,
          deleteMethod: state.deleteMethod,
          otherMethod: state.otherMethod,
          activePage: activePage,
          intRowNumber: state.intRowNumber,
          countPage: state.countPage,
          subListBody: state.subListBody,
          widthTbl: state.widthTbl,
          widthCell: state.widthCell
      ));
    }
  }
  /// # change rowNumber
  void changeRowNumber(int intRowNumber){
    int countPage=CusTblUtils.count(state.model.body.length,intRowNumber);
    List<List<Map<String,dynamic>>>subList=CusTblUtils.convertToSubLists(state.model.body, intRowNumber);
    emit(TblViewState(
        model: state.model,
        press: state.press,
        addMethod: state.addMethod,
        editMethod: state.editMethod,
        deleteMethod: state.deleteMethod,
        otherMethod: state.otherMethod,
        activePage: 1,
        intRowNumber: intRowNumber,
        countPage: countPage,
        subListBody: subList,
        widthTbl: state.widthTbl,
        widthCell: state.widthCell

    ));
  }

  /// # change widthCell
  void changeWidthCell(double width){
      emit(TblViewState(model: state.model,
        press: state.press,
        addMethod: state.addMethod,
        editMethod: state.editMethod,
        deleteMethod: state.deleteMethod,
        otherMethod: state.otherMethod,
        activePage: state.activePage,
        intRowNumber: state.intRowNumber,
        countPage: state.countPage,
        subListBody: state.subListBody,
        widthCell: width,
        widthTbl: width*state.model.columList.length,
      ));
  }



  ///search width

  /// # change rowNumber
  void search(String searchTxt){
    int countPage=0;
    List<List<Map<String,dynamic>>>subList=[];
    if(searchTxt.isNotEmpty){
      List<Map<String, dynamic>> bodySearch=state.model.body.where((item) =>
          state.model.columList.any((filed)=>
              item[filed.clKey].toString().toLowerCase().contains(searchTxt.toLowerCase())
          )
      ).toList();
      countPage = CusTblUtils.count(bodySearch.length, state.intRowNumber);
      subList = CusTblUtils.convertToSubLists(bodySearch, state.intRowNumber);
    }
    else {

      countPage = CusTblUtils.count(state.model.body.length, state.intRowNumber);
      subList = CusTblUtils.convertToSubLists(state.model.body, state.intRowNumber);
    }

    emit(TblViewState(
        model: state.model,
        press: state.press,
        addMethod: state.addMethod,
        editMethod: state.editMethod,
        deleteMethod: state.deleteMethod,
        otherMethod: state.otherMethod,
        activePage: 1,
        intRowNumber: state.intRowNumber,
        countPage: countPage,
        subListBody: subList,
        widthTbl: state.widthTbl,
        widthCell: state.widthCell

    ));
  }


}
