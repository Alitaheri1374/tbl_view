import 'package:flutter/material.dart';

class ShowAllPageWidget extends StatelessWidget {
  final Function(int rowNumber) onChange;
  final int countPage;
  final int currentPage;
  const ShowAllPageWidget ({super.key,
    required this.onChange,
    required this.countPage,
    required this.currentPage,
  });



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
            "select Page",
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
                    for(int index=1;index<=countPage;index++)
                        Card(
                          color: currentPage==index? Theme.of(context).primaryColor:null,
                          child: InkWell(
                            onTap:currentPage==index? null: () => onChangeFun(index,context),
                            child: SizedBox(
                              height: currentPage==index?65:50,
                              width: currentPage==index?65:50,
                              child: Center(
                                child: Text(
                                    index.toString(),
                                  style: TextStyle(color: currentPage==index?Colors.white:Colors.black,fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
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
