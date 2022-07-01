import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/registration/user_signup.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/localization_button.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:restart_app/restart_app.dart';

import '../../../../business_logic/global_cubit/global_cubit.dart';
import '../../../../componants/applocal.dart';
import '../../../styles/colors.dart';
import '../../../widget/Image.dart';
import '../../../widget/material_button.dart';
import '../../../widget/text_field.dart';
import '../../../widget/toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>GlobalCubit(),
      child: BlocConsumer <GlobalCubit, GlobalState>(
        listener: (BuildContext context, GlobalState state) {
          if (state is UserLoginErrorGlobalState){
            toast(msg: state.error,backColor: AppColor.red);
            print(state.error);
          }
          else if (state is UserLoginSuccessGlobalState){
            toast(msg: getLang(context, 'login_success'));
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile( accountModel: state.accountModel,)));
          }
        },
        builder: (BuildContext context, GlobalState state) {
          GlobalCubit globalCubit = GlobalCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.blue,
              body: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.topLeft,
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
                                SizedBox(height: 20,),
                                textField(context: context,
                                  control: emailController,
                                  hint: getLang(context, 'email'),
                                  keyboardType: TextInputType.emailAddress,
                                  isPassword: false,
                                  isArabic: globalCubit.isArabic,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return getLang(context, 'login_error');
                                    }
                                    return null;
                                  },
                                  onSubmit: (value) {

                                  },
                                ),

                                SizedBox(height: 20,),

                                textField(context: context,
                                  control: passwordController,
                                  hint: getLang(context, 'password'),
                                  icon: globalCubit.loginPassObscure ? Icons.visibility : Icons.visibility_off,
                                  keyboardType: TextInputType.emailAddress,
                                  isPassword: true,
                                  isArabic: globalCubit.isArabic,
                                  obscure: globalCubit.loginPassObscure,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return getLang(context, 'login_error');
                                    }
                                    return null;
                                  },
                                  onPressPrefixIcon: () {
                                    globalCubit.changeLoginPassObscure(!globalCubit.loginPassObscure);
                                    print(globalCubit.loginPassObscure);
                                  },
                                ),

                                SizedBox(height: 80,),
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width/18,),
                                    Expanded(
                                      child:  materialButton(
                                          text: getLang(context, 'login'),
                                          onPress: (){
                                            if (formKey.currentState!.validate()){
                                              globalCubit.userLogin(email: emailController.text,
                                                        password: passwordController.text);}

                                          }

                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width/18,),
                                    Expanded(
                                      child: materialButton(
                                        text: getLang(context, 'register'),
                                        onPress: () {

                                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                                        },


                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width/18,),
                                  ],

                                )

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: localizationButton(context: context,
                        onPress: () async {
                          globalCubit.changeIsArabic(!globalCubit.isArabic);
                          await CacheHelper.saveDataSharedPreference(key: 'language', value: globalCubit.isArabic?'ar':'en');
                          Restart.restartApp();

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
