import 'package:first_app/BMI_APP/Core/features/presentation/Ui_srcreen/bmi_home_screen.dart';
import 'package:first_app/BMI_APP/Core/features/presentation/compoments/constants/app_image.dart';
import 'package:first_app/BMI_APP/Core/features/presentation/compoments/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BmiWelcomeScreen extends StatelessWidget {
  const BmiWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      backgroundColor: AppColor.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 80),
            SvgPicture.asset(
              AppImage.firstImg,
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
            ),
            const Spacer(),
            _buildBottomSheet(context, textScaler),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context, TextScaler textScaler) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: AppColor.purpl2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Know Your Body Better,\nGet Your BMI Score in Less\nThan a Minute!',
            style: TextStyle(
              color: AppColor.white,
              fontSize: textScaler.scale(22),
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'It takes just 30 seconds - and your health is\nworth it!',
            style: TextStyle(
              color: AppColor.white.withOpacity(0.9),
              fontSize: textScaler.scale(15),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 2,
            color: AppColor.white.withOpacity(0.3),
          ),
          const SizedBox(height: 20),
          _GetStartedButton(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BmiHomeScreen()),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppColor.buttonColor,
          border: Border.all(color: AppColor.buttonBorder),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            'Get Started',
            style: TextStyle(
              color: AppColor.white,
              fontSize: textScaler.scale(20),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
