import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/registration/user_login.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';

import '../../../../business_logic/global_cubit/global_cubit.dart';
import '../../../../componants/applocal.dart';
import '../../../styles/colors.dart';
import '../../../widget/Image.dart';
import '../../../widget/custom_container.dart';
import '../../../widget/material_button.dart';
import '../../../widget/text_field.dart';
import '../../../widget/toast.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (BuildContext context, GlobalState state) {
            if (state is UserSignUpErrorGlobalState) {
              print(state.error);
              toast(msg: state.error, backColor: AppColor.red);
            } else if (state is UserSignUpSuccessGlobalState) {

              if(state.userModel.status==200){
                toast(msg: getLang(context, 'register_success'),);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }
              else{
                toast(msg: state.userModel.message, backColor: AppColor.red);
              }
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginScreen()));
            }
          },
          builder: (BuildContext context, GlobalState state) {
            GlobalCubit globalCubit = GlobalCubit.get(context);
            return SafeArea(
              child: Scaffold(
                backgroundColor: AppColor.blue,
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            logoImage(context),
                            customContainer(
                              context: context,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 15,),
                                  textField(context: context,
                                    control: nameController,
                                    hint:getLang(context, 'name'),
                                    keyboardType: TextInputType.name,
                                    isPassword: false,
                                    isArabic: globalCubit.isArabic,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return getLang(context, 'error');
                                      }
                                      return null;
                                    },
                                    onSubmit: (value) {

                                    },
                                  ),
                                  SizedBox(height: 15,),
                                  textField(context: context,
                                    control: emailController,
                                    hint: getLang(context, 'email'),
                                    keyboardType: TextInputType.emailAddress,
                                    isPassword: false,
                                    isArabic: globalCubit.isArabic,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return getLang(context, 'error');
                                      }
                                      return null;
                                    },
                                    onSubmit: (value) {

                                    },
                                  ),
                                  SizedBox(height: 15,),
                                  textField(context: context,
                                    control: phoneController,
                                    hint: getLang(context, 'phone'),
                                    keyboardType: TextInputType.phone,
                                    isPassword: false,
                                    isArabic: globalCubit.isArabic,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return getLang(context, 'error');
                                      }
                                      return null;
                                    },
                                    onSubmit: (value) {

                                    },
                                  ),

                                  SizedBox(height: 15,),

                                  textField(context: context,
                                    control: passwordController,
                                    hint: getLang(context, 'password'),
                                    icon: globalCubit.signUpPassObscure ? Icons.visibility : Icons.visibility_off,
                                    keyboardType: TextInputType.emailAddress,
                                    isPassword: true,
                                    isArabic: globalCubit.isArabic,
                                    obscure: globalCubit.signUpPassObscure,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return getLang(context, 'error');
                                      }
                                      return null;
                                    },
                                    onPressPrefixIcon: () {
                                      globalCubit.changeSignUpPassObscure(!globalCubit.signUpPassObscure);
                                      print(globalCubit.signUpPassObscure);
                                    },
                                  ),
                                  SizedBox(height: 15,),
                                  textField(context: context,
                                    control: confirmPasswordController,
                                    hint: getLang(context, 'password_confirmation'),
                                    icon: globalCubit.signUpConfirmObscure ? Icons.visibility : Icons.visibility_off,
                                    keyboardType: TextInputType.emailAddress,
                                    isPassword: true,
                                    isArabic: globalCubit.isArabic,
                                    obscure: globalCubit.signUpConfirmObscure,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return getLang(context, 'error');
                                      }
                                      return null;
                                    },
                                    onPressPrefixIcon: () {
                                      globalCubit.changeSignUpConfirmObscure(!globalCubit.signUpConfirmObscure);
                                      print(globalCubit.signUpConfirmObscure);
                                    },
                                  ),

                                  SizedBox(height: 50,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 20),
                                          child: materialButton(
                                            text: getLang(context, 'login'),
                                            onPress: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 10),
                                          child: materialButton(
                                            text: getLang(context, 'register'),
                                            onPress: () {
                                              if (formKey.currentState!.validate()) {
                                                globalCubit.userSignUp(
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  phone: phoneController.text,
                                                  password: passwordController.text,
                                                );
                                              }
                                            },

                                          ),
                                        ),
                                      ),
                                    ],

                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
