import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

import '../../data/local/cache_helper.dart';
import '../../presentation/screens/user/user_profile.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);
  
  bool loginPassObscure = true;
  
  bool signUpPassObscure = true;
  
  bool signUpConfirmObscure = true;

  late AccountModel accountModel;

  late UserModel userModel;

  String locale =
      CacheHelper.getDataFromSharedPreference(key: 'language') ;
  late bool isArabic = locale == 'ar';



  void changeLoginPassObscure(bool flag) {
    loginPassObscure = flag;
    emit(ChangeLoginPassObscureGlobalState());
  }
  
  void changeSignUpPassObscure(bool flag) {
    signUpPassObscure = flag;
    emit(ChangeSignUpPassObscureGlobalState());
  }
  
  void changeSignUpConfirmObscure(bool flag) {
    signUpConfirmObscure = flag;
    emit(ChangeSignUpConfirmObscureGlobalState());
  }

  void changeIsArabic(bool flag) {
    isArabic = flag;
    emit(ChangeIsArabicGlobalState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(UserLoadingLoginGlobalState());
    DioHelper.postData(url: loginURL, body: {
      'email': email,
      'password': password,
    }).then((response) {
      accountModel = AccountModel.fromJson(response.data['account'][0]);
      emit(UserLoginSuccessGlobalState(accountModel));
    }).catchError((error){
      emit(UserLoginErrorGlobalState(error.toString()));
    });
  }

  void userSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,

  }) {
    emit(UserLoadingSignUpGlobalState());
    DioHelper.postData(url: registerURL, body: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    }).then((response) {
      userModel = UserModel.fromJson(response.data);
      emit(UserSignUpSuccessGlobalState(userModel));
    }).catchError((error){
      emit(UserSignUpErrorGlobalState(error.toString()));
    });
  }

  void userLogout() {
    emit(GlobalUserLogOut());
  }

}
