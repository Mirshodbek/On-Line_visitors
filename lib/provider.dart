import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_visitors/data.dart';
import 'package:online_visitors/list_of_visits.dart';
import 'package:online_visitors/toast/toast.dart';
import 'package:online_visitors/visit_area_screen.dart';

class BrainProvider extends ChangeNotifier {
  final cloudFireStore = FirebaseFirestore.instance;
  String qrCode,
      message,
      buttonText,
      qrDataPerson = 'Mirshodbek Bakhromov',
      qrTime = DateTime.now().toString();
  static bool result = false;
  int currentIndex = 0;
  List<InnerList> _lists;
  List<String> countryListShow = [];

  Future add(BuildContext context) async {
    qrTime = DateTime.now().toString();
    try {
      await cloudFireStore.collection('user').add({
        'timestamp': DateTime.now(),
        'time': qrTime,
      });
      ToastUtils.showCustomToast(context, 'You stand on line!');
    } catch (e) {
      print(e);
    }
    result = true;
    notifyListeners();
  }

  UnmodifiableListView<InnerList> get lists => UnmodifiableListView(_lists);

  void listData() {
    _lists = List.generate(headerValue.length, (outerIndex) {
      return InnerList(
        name: headerValue[outerIndex],
        children: List.generate(countryList.length,
            (innerIndex) => '${countryList[outerIndex][innerIndex].country}'),
      );
    });
  }

  onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    var movedItem = _lists[oldListIndex].children.removeAt(oldItemIndex);
    _lists[newListIndex].children.insert(newItemIndex, movedItem);
    notifyListeners();
  }

  onListReorder(int oldListIndex, int newListIndex) {
    var movedList = _lists.removeAt(oldListIndex);
    _lists.insert(newListIndex, movedList);
    notifyListeners();
  }

  final List<Widget> children = [
    ListVisitsScreen(),
    VisitsArea(),
  ];
  List<Data> _data = [
    Data('Adliya Vazirligi Davlat Xizmatlari Agentligi', 'images/fb.png'),
  ];

  void onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  UnmodifiableListView<Data> get data => UnmodifiableListView(_data);

  int get dataLength {
    return _data.length;
  }
}
