import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../tbl_bloc/tbl_view_cubit.dart';
import 'widget.dart';
import 'model/model.dart';

///ویجت اصلی برای نمایش تیبل
class CusTblView extends StatefulWidget {
  ///# مدلی که برای گرفتن ستون و دیتا ها میباشد
  final ModelTblView model;
  final String?emptyList;
  ///# عملیات بر روی ردیف انتخاب شده
  final Function(Map<String, dynamic> object)? press;
  ///# عملیات هنگامی که بر روی دکمه add کلیک میکند
  final Function(Map<String,dynamic> object)? addMethod;
  ///# عملیات هنگامی که بر روی دکمه edit کلیک میکند
  final Function(Map<String,dynamic> object)? editMethod;
  ///# عملیات هنگامی که بر روی دکمه delete کلیک میکند
  final Function(Map<String,dynamic> object)? deleteMethod;
  ///# عملیات هنگامی که بر روی دکمه other کلیک میکند
  final Function(Map<String,dynamic> object)? otherMethod;
  ///# برای وقتی که میخواهیم دیتا را از سرور بگیریم و API  کال کنیم
  final bool? loading;

  const CusTblView({
    super.key,
    required this.model,
    this.press,
    this.emptyList,
    this.loading = false,
    this.addMethod, this.editMethod, this.deleteMethod, this.otherMethod,
  });

  @override
  State<CusTblView> createState() => CusTblViewState();
}

class CusTblViewState extends State<CusTblView> {
  double heightHeader = 100;
  @override
  Widget build(BuildContext context) {
    return
      widget.loading==true ?
      Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,backgroundColor: Colors.transparent),):
      BlocProvider(
          create: (ctx) => TblViewCubit()..setAllParams(context,model:widget.model,press: widget.press,
              addMethod: widget.addMethod,editMethod: widget.editMethod,deleteMethod: widget.deleteMethod,otherMethod: widget.otherMethod),
          child: CusTblViewWidget(
            emptyList: widget.emptyList,
          )
      );
  }
}
