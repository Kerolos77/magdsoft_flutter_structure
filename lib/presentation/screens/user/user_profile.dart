import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/registration/user_login.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/font_styles.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/material_button.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../componants/applocal.dart';
import '../../widget/toast.dart';
import '../../widget/user_data_row.dart';

class UserProfile extends StatelessWidget {
  AccountModel accountModel;
  UserProfile({Key? key, required this.accountModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (BuildContext context, GlobalState state) {},
        builder: (BuildContext context, GlobalState state) {
          GlobalCubit globalCubit = GlobalCubit.get(context);
          return Scaffold(
              backgroundColor: AppColor.white,
              appBar: AppBar(
                backgroundColor: AppColor.blue,
                title: Center(child: Text(
                    "User Data", style: FontStyles.titleUserDataFont)),
                automaticallyImplyLeading: false,

              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: materialButton(text: "Logout", onPress: () {
                          globalCubit.userLogout();
                          toast(msg: getLang(context, 'logout_success'));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                          color: AppColor.red,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 50,),
                          userDataRow(
                            context: context,
                            title: "user_name",
                            value: accountModel.name,
                            isArabic: globalCubit.isArabic,
                          ),
                          SizedBox(height: 10,),
                          userDataRow(
                            context: context,
                            title: "user_email",
                            value: accountModel.email,
                            isArabic: globalCubit.isArabic,

                          ),
                          SizedBox(height: 10,),
                          userDataRow(
                            context: context,
                            title: "phone",
                            value: accountModel.phone,
                            isArabic: globalCubit.isArabic,

                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              )
          );
        }
    );
  }
}
