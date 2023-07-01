import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/repositories/user_repository.dart';
import 'package:my_daily_spending/reusable_components/loading_dialog.dart';
import 'package:my_daily_spending/reusable_components/title_container.dart';
import 'package:my_daily_spending/routes/settings/components/contact_us.dart';
import 'package:my_daily_spending/routes/settings/components/logout_button.dart';

import 'package:my_daily_spending/routes/settings/reusable_components/localization_button.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleContainer(text: 'Settings'.tr()),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  if (context.mounted) {
                    showloadingDialog(context);
                  }
                  await UserRepository.uploadProfilePicture(File(image.path));
                  if (context.mounted) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                  setState(() {});
                }
              },
              child: CircleAvatar(
                key: UniqueKey(),
                radius: 50,
                foregroundImage:
                    NetworkImage(UserRepository.getProfilePictureUrl()),
                backgroundImage:
                    NetworkImage(UserRepository.getDefaultProfilePictureUrl()),
                onForegroundImageError: (exception, stackTrace) {},
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              //margin: EdgeInsets.only(left: 35.w),
              alignment: Alignment.center,
              height: 63.h,
              width: 310.w,
              decoration: BoxDecoration(
                borderRadius: borderRadius(250.r),
                color: const Color.fromRGBO(3, 59, 156, 0.15),
              ),
              child: Text(
                ref.watch(username).when(
                      data: (data) => data,
                      error: (error, stackTrace) => '',
                      loading: () => 'username',
                    ),
                style: defaultTextStyle.copyWith(fontSize: 30.sp),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 34.w,
                ),
                const LocalizationButton(
                  text: 'EN',
                  locale: Locale('en', 'US'),
                ),
                SizedBox(
                  width: 67.w,
                ),
                const LocalizationButton(
                  text: 'AR',
                  locale: Locale('ar', 'SA'),
                )
              ],
            ),
            SizedBox(height: 40.h),
            const ContactUs(),
            SizedBox(
              height: 30.h,
            ),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
