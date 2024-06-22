
  import 'dart:collection';

import 'package:flutter/material.dart';

class CusTblUtils{
  static List<List<Map<String,dynamic>>> convertToSubLists(List<Map<String,dynamic>> list, int subListSize) {
    List<List<Map<String,dynamic>>> subLists = [];
    int currentIndex = 0;

    while (currentIndex < list.length) {
      int endIndex = currentIndex + subListSize;
      if (endIndex > list.length) {
        endIndex = list.length;
      }

      subLists.add(list.sublist(currentIndex, endIndex));
      currentIndex = endIndex;
    }

    return subLists;
  }
  
  static int count(int length,int rowNumber){
    int count = length%rowNumber==0?length~/rowNumber:length~/rowNumber+1;
    return count;
  }

    static downloadExcel(String base64){
    // DownloadServices.downloadFile(
    //     uint8list: Helper.convertBase64ToUnit8list(
    //         stringBase64: base64.replaceAll('data:application/vnd.ms-excel;base64, ', '')),
    //     nameFile: 'excel', typeFile: 'xls');
  }
}


///extension
  extension ListDynamicExtension on List<dynamic> {
    List<Map<String, dynamic>> toMapList1() {
      return map((dynamic item) => item as Map<String, dynamic>).toList();
    }

    List<Map<String, dynamic>> toMapList() {
      return map((dynamic item) {
        if (item is LinkedHashMap) {
          // Check if all keys are of type String
          if (item.keys.every((key) => key is String)) {
            return item.cast<String, dynamic>();
          } else {
            // Convert LinkedHashMap to Map<String, dynamic>
            return LinkedHashMap.fromIterable(item.entries, key: (e) => e.key as String, value: (e) => e.value).cast<String, dynamic>();
          }
        } else {
          return item as Map<String, dynamic>;
        }
      }).toList();
    }
  }

  ///یکسری کار بر روی context فعلی
  extension MediaQueryValues on BuildContext {
    double get width => MediaQuery.of(this).size.width;
    double get height => MediaQuery.of(this).size.height;
  }

  ///ساخت فضای خالی
  extension EmptySpace on num
  {

    SizedBox get height => SizedBox(height:toDouble());

    SizedBox get width => SizedBox(width:toDouble());

  }