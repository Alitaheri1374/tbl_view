part of 'tbl_view_cubit.dart';

class  TblViewState {
  ///دل ورودی که از parent میگیره
  ModelTblView model;
  ///عملیات بر روی ردیف انتخاب شده
  Function(Map<String,dynamic>)? press;
  ///عملیات هنگامی که بر روی دکمه add کلیک میکند
  Function(Map<String,dynamic>)? addMethod;
  ///عملیات هنگامی که بر روی دکمه edit کلیک میکند
  Function(Map<String,dynamic>)? editMethod;
  ///عملیات هنگامی که بر روی دکمه delete کلیک میکند
  Function(Map<String,dynamic>)? deleteMethod;
  ///عملیات هنگامی که بر روی دکمه other کلیک میکند
  Function(Map<String,dynamic>)? otherMethod;
  ///این لیست بخاطر شکسته شدن دیت
  ///این لیست بخاطر شکسته شدن دیت
  List<List<Map<String,dynamic>>>subListBody;
  ///تعداد کل صفحه ها
  int countPage;
  ///صفحه ای از لیست که دارد نمایش داده میشود
  int activePage;
  ///تعداد هر ردیف
  int intRowNumber;
  /// ارتفاع هر cell
  double heightCell;
  /// عرض هر cell
  double widthCell;
  /// عرض هر cell در موقعی [ColumnTypeTbl$]==[ColumnTypeTbl.btn]
  double widthCellBtn;
  /// عرض table
  double widthTbl;


  TblViewState({
    required this.model,
    this.press,
    this.addMethod,
    this.editMethod,
    this.deleteMethod,
    this.otherMethod,
    this.subListBody=const [],
    this.countPage=0,
    this.activePage=1,
    this.intRowNumber=10,
    this.heightCell=100,
    required this.widthCell,
    this.widthCellBtn=50,
    this.widthTbl=100,
  });
}

