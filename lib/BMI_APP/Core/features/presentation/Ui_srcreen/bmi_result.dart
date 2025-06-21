import 'package:first_app/BMI_APP/Core/features/data/model/bmi_data_model.dart';
import 'package:first_app/BMI_APP/Core/features/presentation/Ui_srcreen/bmi_home_screen.dart';
import 'package:first_app/BMI_APP/Core/features/presentation/compoments/constants/app_image.dart';
import 'package:first_app/BMI_APP/Core/features/presentation/compoments/theme/app_color.dart';
import 'package:first_app/BMI_APP/Core/features/presentation/controllers/git_bmi/cubit/bmi_result_cubit.dart';
import 'package:first_app/BMI_APP/Core/features/presentation/controllers/git_bmi/cubit/bmi_result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiResult extends StatelessWidget {
  final BmiDataModel bmiModel;
  final String gender;
  final String name;

  const BmiResult({
    super.key,
    required this.bmiModel,
    required this.gender,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiResultCubit, BmiResultState>(
      listener: (context, state) {
        if (state is BmiResError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'BMI Result',
              style: TextStyle(color: AppColor.white),
            ),
            centerTitle: true,
            backgroundColor: AppColor.purpl2,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.sizeOf(context).height * 0.15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.purpl2,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25,
                                    color: AppColor.white,
                                  ),
                                ),
                                Text(
                                  gender.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: AppColor.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          bmiModel.bmi.toStringAsFixed(1),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 30,
                                            color: AppColor.white,
                                          ),
                                        ),
                                        const Text(
                                          'BMI Value',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          bmiModel.height.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: AppColor.white,
                                          ),
                                        ),
                                        const Text(
                                          'Height (cm)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: VerticalDivider(
                                        color: AppColor.white,
                                        thickness: 2,
                                        width: 20,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          bmiModel.weight.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: AppColor.white,
                                          ),
                                        ),
                                        const Text(
                                          'Weight (kg)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SvgPicture.asset(AppImage.body),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.statusCardBg,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Status',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: AppColor.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          bmiModel.risk,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: AppColor.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          bmiModel.summary,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          bmiModel.recommendation,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BmiHomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColor.purpl2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Back to Home',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
