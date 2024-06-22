///مدل برای تیبل نمایشی
class ModelTblView{
  ///لیست ستون ها
  List<ModelHeaderTblView> columList;
  ///لیست body
  List<Map<String,dynamic>> body;
  ///لیست search
  List<String>? searchFieldList;
  ModelTblView({required this.columList,required this.body,this.searchFieldList});


  ModelTblView copyWith() {
    return ModelTblView(
      columList: columList,
      body: body,
      searchFieldList: searchFieldList,
    );
  }
}


///enum for type of Column
  enum ColumnTypeTbl{
    ///نمایش مقدار
    showValue,
  ///انجام عملیات بر روی آن ردیف
    btn,
  }
///enum for when [$ColumnTypeTbl]==[ColumnTypeTbl.btn]
  enum BtnOperationType{
  ///add
  add,
  ///edit
  edit,
  ///delete
  delete,
  ///show row
  showDetail,
  ///for other action
  other
  }

///modelHeader
class ModelHeaderTblView{
  ///key ستون
  String clKey;
  ///عنوان نمایشی
  String? clTitle;
  ///برای فعال بودن ستون
  bool? isActive;
  ///رای نوع ستون
  ColumnTypeTbl? type;
  BtnOperationType? typeBtn;
  ModelHeaderTblView({required this.clKey,this.clTitle='',this.isActive=true,this.type=ColumnTypeTbl.showValue,this.typeBtn});


  ModelHeaderTblView copyWith() {
    return ModelHeaderTblView(
      clKey: clKey,
      clTitle: clTitle??'',
      isActive: isActive=false,
      type: type??ColumnTypeTbl.showValue,
      typeBtn: typeBtn,
    );
  }
}