import 'package:bookia_2/core/function/dialogs.dart';
import 'package:bookia_2/core/function/navigation.dart';
import 'package:bookia_2/core/utils/colors.dart';
import 'package:bookia_2/core/utils/text_style.dart';
import 'package:bookia_2/core/widgets/custom_back_button.dart';
import 'package:bookia_2/core/widgets/custom_button.dart';
import 'package:bookia_2/core/widgets/nav_bar.dart';
import 'package:bookia_2/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_2/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_2/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_2/feature/auth/presentation/page/register_screen.dart';
import 'package:bookia_2/feature/auth/presentation/widgets/social_auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool obscureText = true;

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
          if (state is LoginLoadingState) {
            showLoadingDialog(context);
          } else if (state is LoginSuccessState) {
            pushAndRemoveUntil(context, const NavBarWidget());
          } else if (state is LoginErrorState) {
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
                'Welcome back! Glad to see you, Again!',
                style: getHeadlineTextStyle(context),
              ),
              const Gap(30),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle:
                      getSmallTextStyle(context, color: AppColors.greyColor),
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
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
                          obscureText = !obscureText;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/icons/eye.svg',
                      ),
                    ),
                  ),
                ),
                controller: passwordController,
                obscureText: obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              const Gap(13),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?', style: getSmallTextStyle(context)),
                ],
              ),
              const Gap(30),
              CustomButton(
                width: double.infinity,
                text: 'Login',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(LoginEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ));
                  }
                },
              ),
              const Gap(30),
              Row(children: [
                const Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child:
                      Text('Or Login with', style: getSmallTextStyle(context)),
                ),
                const Expanded(
                  child: Divider(),
                )
              ]),
              const Gap(30),
              const SocialAuthButtons(),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: getSmallTextStyle(context)),
                  TextButton(
                    onPressed: () {
                      pushReplacement(context, const RegisterScreen());
                    },
                    child: Text('Register Now',
                        style: getSmallTextStyle(context,
                            color: AppColors.primaryColor)),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
