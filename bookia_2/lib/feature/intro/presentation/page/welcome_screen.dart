import 'package:bookia_2/core/function/navigation.dart';
import 'package:bookia_2/core/utils/colors.dart';
import 'package:bookia_2/core/utils/text_style.dart';
import 'package:bookia_2/core/widgets/custom_button.dart';
import 'package:bookia_2/feature/auth/presentation/page/login_screen.dart';
import 'package:bookia_2/feature/auth/presentation/page/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/welcome_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                const Spacer(flex: 2),
                SizedBox(
                    width: 250,
                    child: SvgPicture.asset('assets/images/logo.svg')),
                const Gap(9),
                Text(
                  'Order Your Book Now!',
                  style: getBodyTextStyle(context),
                ),
                const Spacer(flex: 5),
                CustomButton(
                  width: double.infinity,
                  text: 'Login',
                  onTap: () {
                    push(context, const LoginScreen());
                  },
                ),
                const Gap(15),
                CustomButton(
                  width: double.infinity,
                  text: 'Register',
                  color: AppColors.whiteColor,
                  textStyle: getSmallTextStyle(context),
                  onTap: () {
                    push(context, const RegisterScreen());
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
