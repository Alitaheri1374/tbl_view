import 'package:flutter/material.dart';

class CusTblFooterRowNumber extends StatelessWidget {
  final Function(int rowNumber) onChange;
  final int lengthList;
  final int currentRowNumber;
  const CusTblFooterRowNumber({super.key,
    required this.onChange,
    required this.lengthList,
    required this.currentRowNumber,
  });

 
  static const List<int> rowNumberList=[
    1,2,5,10,15,20,25,30,35,40,50,100,200,500
  ]; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*.5+70,
      width: MediaQuery.sizeOf(context).width*.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 50,child: Text(
            "select Row Number",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,fontWeight: FontWeight.bold,)),

            ),
          Divider(color: Theme.of(context).primaryColor,),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*.5,
            width: MediaQuery.sizeOf(context).width*.5,
            child: Center(
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    for(var e in rowNumberList)
                      if(e <= lengthList)
                        Card(
                          color: currentRowNumber==e? Theme.of(context).primaryColor:null,
                          child: InkWell(
                            onTap:currentRowNumber==e? null: () => onChangeFun(e,context),
                            child: SizedBox(
                              height: currentRowNumber==e?65:50,
                              width: currentRowNumber==e?65:50,
                              child: Center(
                                child: Text(
                                    e.toString(),
                                  style: TextStyle(color: currentRowNumber==e?Colors.white:Colors.black,fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                    if(!rowNumberList.contains(lengthList))
                      Card(
                        color: currentRowNumber==lengthList? Theme.of(context).primaryColor:null,
                        child: InkWell(
                          onTap:currentRowNumber==lengthList? null: () => onChangeFun(lengthList,context),
                          child: SizedBox(
                            height: currentRowNumber==lengthList?30:50,
                            width: currentRowNumber==lengthList?30:50,
                            child: Center(
                              child: Text(
                                  lengthList.toString()
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onChangeFun(int rowNumber,BuildContext context){
    Navigator.pop(context);
    onChange(rowNumber);
  }
}
