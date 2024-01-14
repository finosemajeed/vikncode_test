import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vikncode_test/application/login_controller/controller/login_controller.dart';
import 'package:vikncode_test/domain/routes/app_pages.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20).w,
            child:
                // Stack(
                //   children: [
                // SizedBox(
                //   width: 507.w,
                //   height: 714.h,
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         left: 383.w,
                //         top: 187.h,
                //         child: Container(
                //           width: 124.w,
                //           height: 124.h,
                //           decoration: const ShapeDecoration(
                //             color: Color.fromRGBO(0, 208, 253, 1),
                //             shape: OvalBorder(),
                //           ),
                //           // child: SvgPicture.asset('assets/bluebg.svg'),
                //         ),
                //       ),
                //       Positioned(
                //         left: 0,
                //         top: 0,
                //         child: Container(
                //           width: 124.w,
                //           height: 124.h,
                //           decoration: const ShapeDecoration(
                //             color: Color.fromRGBO(238, 242, 35, 1),
                //             shape: OvalBorder(),
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         left: 62.w,
                //         top: 486.h,
                //         child: Container(
                //           width: 124.w,
                //           height: 124.h,
                //           decoration: const ShapeDecoration(
                //             color: Color(0xFFFC6BFF),
                //             shape: OvalBorder(),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/language-hiragana.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      'English',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF080808),
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 195.h),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.26.w,
                  ),
                ),
                Text(
                  'Login to your vikn account',
                  style: TextStyle(
                    color: const Color(0xFF828282),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 27.h),
                Form(
                  key: controller.formKey,
                  child: Container(
                    // height: 119.h,
                    width: 358.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE6E6E6)),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(11).r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 19.w),
                            const Icon(
                              Icons.person_outline_outlined,
                              color: Color(0xFF0A9EF3),
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: TextFormField(
                                controller: controller.usernameController,
                                decoration: InputDecoration(
                                  labelText: 'UserName',
                                  labelStyle: TextStyle(
                                    color: const Color(0xFF7D7D7D),
                                    fontSize: 16.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: -0.84,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return null;
                                  } else {
                                    return 'Enter your username';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 358,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 19.w),
                            const Icon(
                              Icons.key_outlined,
                              color: Color(0xFF0A9EF3),
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Obx(() {
                                return TextFormField(
                                  controller: controller.passwordController,
                                  obscureText: controller.obscurePassword.value,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          controller.showPassword();
                                        },
                                        child: !controller.obscurePassword.value
                                            ? const Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: Color(0xFF0A9EF3),
                                              )
                                            : const Icon(
                                                Icons.remove_red_eye,
                                                color: Color(0xFF0A9EF3),
                                              )),
                                    labelStyle: TextStyle(
                                      color: const Color(0xFF7D7D7D),
                                      fontSize: 16.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: -0.84,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return null;
                                    } else {
                                      return 'Please enter your password!';
                                    }
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 29.h),
                Text(
                  'Forgotten Password?',
                  style: TextStyle(
                    color: const Color(0xFF0A9EF3),
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.96.w,
                  ),
                ),
                SizedBox(height: 35.h),
                Obx(() {
                  return InkWell(
                    onTap: controller.isLoading.value
                        ? null
                        : () {
                            // controller.onLoginClick();
                            Get.toNamed(Routes.MAIN_SCREEN);
                          },
                    child: Container(
                        width: 125.w,
                        height: 48.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF0E74F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(120).r,
                          ),
                        ),
                        child: controller.isLoading.value
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.96.w,
                                    ),
                                  ),
                                  SizedBox(width: 9.w),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              )),
                  );
                }),
                // SizedBox(height: 168.h),
                const Spacer(),
                Text(
                  'Don’t have an Account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Sign up now!',
                  style: TextStyle(
                    color: const Color(0xFF0A9EF3),
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: -0.96,
                  ),
                )
              ],
            ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
