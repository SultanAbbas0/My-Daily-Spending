import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/reusable_components/continue_button.dart';
import 'package:my_daily_spending/reusable_components/text_field_container.dart';
import 'package:my_daily_spending/routes/deduct/reusable_components/undo_button.dart';

class BigContainer extends StatelessWidget {
  const BigContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 40.w),
        width: 260.w,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(children: [
          SizedBox(height: 10.h),
          Text(
            'Deduct from\nspending',
            textAlign: TextAlign.center,
            style: defaultTextStyle.copyWith(fontSize: 30.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          const TextFieldContainer(height: 30, width: 250, withTextField: true),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UndoButton(
                  text: 'Undo', height: 30.h, width: 100.w, fontSize: 15.sp),
              SizedBox(
                width: 5.w,
              ),
              ContinueButton(
                  text: 'Submit', height: 30.h, width: 100.w, fontSize: 15.sp)
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Deduct from\nsavings',
            textAlign: TextAlign.center,
            style: defaultTextStyle.copyWith(fontSize: 30.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          const TextFieldContainer(height: 30, width: 250, withTextField: true),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UndoButton(
                  text: 'Undo', height: 30.h, width: 100.w, fontSize: 15.sp),
              SizedBox(
                width: 5.w,
              ),
              ContinueButton(
                  text: 'Submit', height: 30.h, width: 100.w, fontSize: 15.sp)
            ],
          ),
        ]),
      ),
    );
  }
}
