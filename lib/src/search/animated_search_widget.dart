import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tbl_view/src/utils.dart';

class CustomSearchBox extends StatefulWidget {
  ///text Controller
  final TextEditingController controller;
  ///تاخیر زمانی
  final int delayMilliSecond;
  ///اگر بخواهیم باز باشد
  final bool? initIsOpen;
  ///کاربر نتواند وضعیت را تغییر دهد
  final bool? canChangeState;
  ///متد سرچ
  final Function(String txt)searchFunction;

  ///ویجت برای باز کردن سرچ
  final Widget? iconOpenSearchWidget;
  final Color? colorBackgroundSearchIcon;
  ///استایل لیبل مربوط به دکمه سرچ
  final TextStyle? textStyleBtnSearch;
  ///رنگ مربوط به دکمه سرچ
  final Color? colorBtnSearch;
  ///ویجت برای دکمه سرچ
  final Widget? btnSearchWidget;
  ///ویجت برای بستن سرچ
  final Widget? closeSearchWidget;
  ///متن hintText برای textField
  final String? hintText;


  const CustomSearchBox({super.key,
    required this.controller,
    this.delayMilliSecond=700,
    this.initIsOpen=false,
    this.canChangeState,
    required this.searchFunction,
    this.iconOpenSearchWidget,
    this.colorBackgroundSearchIcon,
    this.textStyleBtnSearch,
    this.colorBtnSearch,
    this.btnSearchWidget,
    this.closeSearchWidget,
    this.hintText,
  });

  @override
  State<CustomSearchBox> createState() => _CustomSearchBoxState();
}

class _CustomSearchBoxState extends State<CustomSearchBox> with SingleTickerProviderStateMixin {

  ///toggle - false =>  closed
  ///toggle - true =>  open
  late bool isOpenWidget ;

  late AnimationController animationController;
  FocusNode focusNode =FocusNode();

  @override
  void initState() {
    super.initState();
    isOpenWidget=widget.initIsOpen??false;
    animationController=AnimationController(vsync: this,
      duration: Duration(milliseconds: widget.delayMilliSecond)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: AnimatedContainer(
              duration: Duration(milliseconds: widget.delayMilliSecond),
              height: constraints.maxHeight,
              width: isOpenWidget?constraints.maxWidth:50,
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                // color: isOpenWidget?Colors.green:Colors.transparent,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
                /*boxShadow: isOpenWidget?[
                const BoxShadow(
                color: Colors.black26,
                spreadRadius: -10.0,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
                ),]:null,*/
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: isOpenWidget?constraints.maxWidth*.3:50,
                    curve: Curves.easeInOut,
                    child:

                ///icon for open search
                    (!isOpenWidget)?
                    Align(
                      alignment: Directionality.of(context)==TextDirection.rtl?Alignment.centerRight:Alignment.centerLeft,
                      child: DecoratedBox(
                        decoration:isOpenWidget?const BoxDecoration(): BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: widget.colorBackgroundSearchIcon??Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black45,
                                  spreadRadius: 1.5,
                                  offset: Offset(2,1)
                              )
                            ]
                        ),
                        child: SizedBox(
                          height: 45,width: 45,
                          child: InkWell(
                            onTap: isToggled,
                            child: isOpenWidget?const Icon(Icons.arrow_back_ios):(widget.iconOpenSearchWidget??const Icon(Icons.search_rounded)),
                          ),
                        ),
                      ),
                    ):
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: widget.colorBtnSearch??Theme.of(context).primaryColor
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        widget.searchFunction(widget.controller.text);
                      },
                      child: widget.btnSearchWidget??Text(
                        MaterialLocalizations.of(context).searchFieldLabel,
                        style: widget.textStyleBtnSearch??const TextStyle(color: Colors.white),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  10.width,
                  Expanded(
                    child: LayoutBuilder(
                        builder: (context,boxConstraint) {
                        return Stack(
                          children: [
                            ///searchBtn and TextField
                            AnimatedPositioned(
                                duration: Duration(milliseconds: widget.delayMilliSecond),
                                // left: isOpenWidget?40:20,
                                // top: 0.0,
                                curve: Curves.easeOut,
                                child: AnimatedOpacity(
                                  opacity: isOpenWidget?1:0,
                                  duration: const Duration(milliseconds: 150),
                                  // curve: Curves.easeOut,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    alignment: Alignment.topCenter,
                                    width: boxConstraint.maxWidth ,
                                    // color: Colors.green,
                                    child: TextField(
                                      controller: widget.controller,
                                      focusNode: focusNode,
                                      cursorRadius: const Radius.circular(10.0),
                                      cursorWidth: 2.0,
                                      style: const TextStyle(color: Colors.black),
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        // fillColor: Theme.of(context).scaffoldBackgroundColor,
                                        // filled: true,
                                        isDense: true,
                                        floatingLabelBehavior: FloatingLabelBehavior.never,
                                        hintText: widget.hintText??MaterialLocalizations.of(context).searchFieldLabel,
                                        labelStyle: const TextStyle(
                                          color: Color(0xff5B5B5B),
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        border: const UnderlineInputBorder(
                                          // borderRadius: BorderRadius.circular(20.0),
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                        suffixIcon: AnimatedOpacity(
                                          opacity: isOpenWidget?1:0,
                                          duration: const Duration(milliseconds: 500),
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              /// can add custom color or the color will be white
                                              // color: widget.color,
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                            child: AnimatedBuilder(
                                              builder: (context, widget) {
                                                ///Using Transform.rotate to rotate the suffix icon when it gets expanded
                                                return Transform.rotate(
                                                  angle: animationController.value * 1.0 * pi,
                                                  child: widget,
                                                );
                                              },
                                              animation: animationController,
                                              child: GestureDetector(
                                                onTap: () {
                                                  widget.controller.clear();
                                                  isToggled();
                                                  widget.searchFunction("");
                                                },

                                                ///suffixIcon is of type Icon
                                                child:  const Icon(
                                                  Icons.close,
                                                  size: 30.0,
                                                  // color: widget.textFieldIconColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ),
                            ),

                          ],
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  ///open and Close Search
  isToggled(){
    if(widget.canChangeState??true){
      if(!isOpenWidget){
        FocusScope.of(context).requestFocus(focusNode);
        animationController.forward();
      }else{
        animationController.reverse();
        focusNode.unfocus();
      }
      setState(() {
        isOpenWidget=!isOpenWidget;
      });
    }
  }
}
