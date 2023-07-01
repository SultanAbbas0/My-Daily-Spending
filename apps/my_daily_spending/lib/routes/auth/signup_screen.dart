import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:my_daily_spending/providers/providers.dart';
import 'package:my_daily_spending/repositories/auth_repository.dart';
import 'package:my_daily_spending/repositories/database_repository.dart';
import 'package:my_daily_spending/reusable_components/loading_dialog.dart';
import 'package:my_daily_spending/routes/auth/resuable_components/text_field_with_label.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final usernameTextController = useTextEditingController();
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Sign up',
              style: defaultTextStyle.copyWith(fontSize: 55.sp),
            ),
            SizedBox(
              height: 39.h,
            ),
            TextFieldWithLabel(
              text: 'Username',
              textController: usernameTextController,
            ),
            SizedBox(
              height: 93.h,
            ),
            TextFieldWithLabel(
              text: 'Email',
              textController: emailTextController,
            ),
            SizedBox(
              height: 93.h,
            ),
            TextFieldWithLabel(
              text: 'Password',
              textController: passwordTextController,
              obscureText: true,
            ),
            SizedBox(
              height: 35.h,
            ),
            GestureDetector(
              onTap: () async {
                if (emailTextController.text.isEmpty ||
                    passwordTextController.text.isEmpty ||
                    usernameTextController.text.isEmpty) {
                  return;
                }
                showloadingDialog(context);
                await AuthRepository.signUp(
                  emailTextController.text,
                  passwordTextController.text,
                  usernameTextController.text,
                );
                await AuthRepository.login(
                    emailTextController.text, passwordTextController.text);
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
                ref.invalidate(currentUser);
                if (DataBaseRepository.database.auth.currentUser != null) {
                  ref.read(loginScreen.notifier).state = true;
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: borderRadius(5.r), color: Colors.green[300]),
                height: 56.h,
                width: 200.w,
                child: const Text('Sign up'),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 20.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: GestureDetector(
                      onTap: () => ref.read(loginScreen.notifier).state = true,
                      child: Text(
                        'Already have an account? Login!!',
                        style: defaultTextStyle.copyWith(color: Colors.black),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
