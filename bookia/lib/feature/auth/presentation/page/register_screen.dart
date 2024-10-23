import 'package:bookia/core/function/dialogs.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/nav_bar.dart';
import 'package:bookia/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia/feature/auth/presentation/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscureText1 = true;
  bool obscureText2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            CustomBackButton(),
          ],
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              showLoadingDialog(context);
            } else if (state is RegisterSuccessState) {
              pushAndRemoveUntil(context, const NavBarWidget());
            } else if (state is RegisterErrorState) {
              Navigator.pop(context);
              showErrorDialog(context, 'Something went wrong');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Form(
              key: formKey,
              child: Column(children: [
                Text(
                  'Hello! Register to get started',
                  style: getHeadlineTextStyle(context),
                ),
                const Gap(30),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle:
                        getSmallTextStyle(context, color: AppColors.greyColor),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const Gap(15),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle:
                        getSmallTextStyle(context, color: AppColors.greyColor),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const Gap(15),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle:
                        getSmallTextStyle(context, color: AppColors.greyColor),
                    suffixIconConstraints:
                        const BoxConstraints(maxWidth: 54, maxHeight: 22),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText1 = !obscureText1;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/eye.svg',
                        ),
                      ),
                    ),
                  ),
                  obscureText: obscureText1,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const Gap(15),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your confirm password',
                    hintStyle:
                        getSmallTextStyle(context, color: AppColors.greyColor),
                    suffixIconConstraints:
                        const BoxConstraints(maxWidth: 54, maxHeight: 22),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText2 = !obscureText2;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/eye.svg',
                        ),
                      ),
                    ),
                  ),
                  obscureText: obscureText2,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your confirm password';
                    }
                    return null;
                  },
                ),
                const Gap(30),
                CustomButton(
                  width: double.infinity,
                  text: 'Register',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(RegisterEvent(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            password_confirmation:
                                confirmPasswordController.text,
                          ));
                    }
                  },
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: getSmallTextStyle(context)),
                    TextButton(
                      onPressed: () {
                        pushReplacement(context, const LoginScreen());
                      },
                      child: Text('Login Now',
                          style: getSmallTextStyle(context,
                              color: AppColors.primaryColor)),
                    ),
                  ],
                ),
              ]),
            ),
          )),
    );
  }
}
