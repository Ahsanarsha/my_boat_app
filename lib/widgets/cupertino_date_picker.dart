import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/font_weights.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:my_boat/widgets/button.dart';

class CustomCupertinoDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final String title;
  const CustomCupertinoDatePicker(
      {super.key, required this.initialDate, required this.title});

  @override
  State<CustomCupertinoDatePicker> createState() =>
      _CustomCupertinoDatePickerState();
}

class _CustomCupertinoDatePickerState extends State<CustomCupertinoDatePicker> {
  DateTime? selectedDateTime;

  @override
  void initState() {
    selectedDateTime = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.5),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Container(
                color: AppColors.c141316.withOpacity(0.5),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 6.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(.6),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.w),
                      topRight: Radius.circular(32.w),
                    ),
                    color: AppColors.white,
                  ),
                  height: 377.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16.w,
                          fontWeight: AppFontWeights.semiBold,
                          color: AppColors.c141316,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Expanded(
                        child: CupertinoDatePicker(
                          minimumDate: DateTime(1899, DateTime.now().month,
                              DateTime.now().day - 1),
                          maximumDate: DateTime(2050, DateTime.now().month,
                              DateTime.now().day - 1), // Updated to allow today
                          initialDateTime: selectedDateTime,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (time) {
                            selectedDateTime = time;
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(height: 40.h),
                      AppButton(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        title: AppLocalizations.of(context)!.confirm,
                        onTap: () {
                          Navigator.pop(context, selectedDateTime);
                        },
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
