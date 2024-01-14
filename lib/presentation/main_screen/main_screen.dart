import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vikncode_test/application/main_screen_controller/controller/main_screen_controller.dart';
import 'package:vikncode_test/infrastracture/repository.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Repository().salesList();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sales Estimate',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                filled: true,
                fillColor: Color(0xFFFBFBFB),
              ),
            ),
            Expanded(
              child: Obx(() {
                controller;
                log(controller.salesListData.toString(), name: 'list count');
                return ListView.separated(
                  controller: controller.scrollController,
                  itemCount: controller.salesListData.length + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.salesListData.length) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '# Invoice No',
                                  style: TextStyle(
                                    color: const Color(0xFF7D7D7D),
                                    fontSize: 13.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  controller
                                          .salesListData[index].customerName ??
                                      'Unknown',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  controller.salesListData[index].status
                                      .toString(),
                                  style: TextStyle(
                                    color: const Color(0xFF7D7D7D),
                                    fontSize: 13.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  controller.salesListData[index].grandTotal
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
