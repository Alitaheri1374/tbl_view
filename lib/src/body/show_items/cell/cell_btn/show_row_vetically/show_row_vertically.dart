import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tbl_view/src/utils.dart';
import '../../../../../../tbl_bloc/tbl_view_cubit.dart';
import '../../../../../model/model.dart';

class ShowRowVerticallyWidget extends StatelessWidget {
  final Map<String,dynamic>object;
  final TblViewState state;
  const ShowRowVerticallyWidget({super.key,
    required this.object,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading:IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,size: 50,),
        ) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              50.width,
              for(var e in state.model.columList)
                if(e.type!=ColumnTypeTbl.btn)
                showRow(context,e.clTitle??'', (object[e.clKey]??'').toString())

            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {Navigator.pop(context);  },
        child: Container(
          height: max(60, context.height*.07),
          width: context.width,
          color: Theme.of(context).primaryColor,
          child: Center(
            child:Text( MaterialLocalizations.of(context).closeButtonLabel,style: const TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }

  ///showRow
  Widget showRow(BuildContext context,String key,String value){
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 40
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(width: context.width*.2,
                child: Text( "$key : ",),
              ),
              15.width,
              Expanded(
                child: LayoutBuilder(
                  builder: (context,boxConstraint) {
                    return SizedBox(width: boxConstraint.maxWidth,
                      child: Text( value,),
                    );
                  }
                ),
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
