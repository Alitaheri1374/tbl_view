import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbl_view/src/utils.dart';
import '../tbl_bloc/tbl_view_cubit.dart';
import 'body/body.dart';
import 'footer_btn/footer_btn.dart';
import 'search/search_tbl.dart';

class CusTblViewWidget extends StatefulWidget {
  final String?emptyList;
  const CusTblViewWidget({super.key,
    this.emptyList
  });

  @override
  State<CusTblViewWidget> createState() => CusTblViewWidgetState();
}

class CusTblViewWidgetState extends State<CusTblViewWidget> {

  double heightHeader=100;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TblViewCubit, TblViewState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
                builder: (context,boxConstraints) {
                  return SizedBox(
                    height: boxConstraints.maxHeight,
                    width: boxConstraints.maxWidth,
                    child: Column(
                      children: [
                        10.height,
                        SizedBox(
                            width: boxConstraints.maxWidth,
                            height: max(70, context.height*.07),
                            child: const SearchTbl()),
                        /*Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CusInput(model:
                                  InputerModel(
                                      controller: TextEditingController(),
                                    labelText: MaterialLocalizations.of(context).searchFieldLabel,
                                  )),
                              ),
                              10.width,
                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomLabel(text: MaterialLocalizations.of(context).searchFieldLabel),
                                    5.width,
                                    const Icon(Icons.search_rounded),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),*/
                        10.height,
                        if(state.model.body.isEmpty|| state.subListBody.isEmpty)
                          Card(
                            child: Container(
                              width: boxConstraints.maxWidth,
                              padding: const EdgeInsets.all(10),
                              height: 80,
                              child: Text(widget.emptyList??"emptyList"),
                            ),
                          )
                        else if(state.model.columList.isNotEmpty )
                           const Expanded(
                              child: ShowBodyTblViewWidget(),
                            )
                      ],
                    ),
                  );
                }
            ),
          ),
          bottomNavigationBar:
          state.model.body.isEmpty||state.subListBody.isEmpty?null:
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
            child: SizedBox(
                height: max(60,context.height*.07),
                child: const CusTblFooterBtn()
              ),
          ),
        );
      },
    );
  }





}
