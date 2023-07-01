import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_daily_spending/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Ellipse(color: Color.fromRGBO(3, 59, 156, 0.15)),
        Positioned(
          top: 10.h,
          left: 5.w,
          child: const Ellipse(
            color: Color.fromRGBO(123, 116, 99, 0.141),
          ),
        ),
        Positioned(
          top: 50.h,
          left: 85.w,
          child: Column(children: [
            Text(
              'Contact us'.tr(),
              style: defaultTextStyle.copyWith(
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchUrl(
                            Uri.parse(
                                'https://www.instagram.com/sultan_abbas1/'),
                            mode: LaunchMode.platformDefault);
                      },
                      child: SvgPicture.asset(
                        'assets/logos/instagram.svg',
                        height: 40,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(
                            Uri.parse('https://twitter.com/SultanAbbas018'),
                            mode: LaunchMode.platformDefault);
                      },
                      child: SvgPicture.asset(
                        'assets/logos/twitter.svg',
                        height: 40,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(
                            Uri.parse(
                                'https://www.facebook.com/sultanabbas018/'),
                            mode: LaunchMode.platformDefault);
                      },
                      child: SvgPicture.asset(
                        'assets/logos/facebook.svg',
                        height: 50,
                      ),
                    ),
                  ],
                ))
          ]),
        )
      ],
    );
  }
}

class Ellipse extends StatelessWidget {
  const Ellipse({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius(250.r),
        color: color,
      ),
      height: 195.h,
      width: 310.w,
    );
  }
}
