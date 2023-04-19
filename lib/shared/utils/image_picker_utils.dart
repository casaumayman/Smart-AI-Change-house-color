import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget _sheetItem(
    {String title = "", bool isCancel = false, Function()? onTap}) {
  var colorPrimary = Get.theme.colorScheme.primary;
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(color: isCancel ? Colors.red : colorPrimary),
      ),
    ),
  );
}

Future<T?> showImagePicker<T>(List<T> items) async {
  var itemRenders = items.map((item) => item.toString());
  Widget bottomsheet = Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: itemRenders
              .map((item) => _sheetItem(
                  title: item,
                  isCancel: false,
                  onTap: () {
                    Get.back(result: item);
                  }))
              .toList(),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.only(top: 10),
        child: _sheetItem(
            title: "Cancel",
            isCancel: true,
            onTap: () {
              Get.back();
            }),
      ),
    ],
  );
  var res = await Get.bottomSheet<T>(bottomsheet,
      persistent: true, ignoreSafeArea: false);
  return res;
}
