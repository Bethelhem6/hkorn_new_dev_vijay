import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/model/create_view_model.dart';
import 'package:hkorn_new_dev_vijay/service/auth_service.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  bool passwordVisible = false;
  bool passwordVisibleConfirm = false;
  final emailCont = TextEditingController();
  final confirmEmailCont = TextEditingController();
  final passwordController = TextEditingController();
  final passwordControllerConfirm = TextEditingController();
  final firstNameCont = TextEditingController();
  final lastNameCont = TextEditingController();
  final surNameCon = TextEditingController();
  final nickNameCont = TextEditingController();
  final chinesNameCont = TextEditingController();
  final postCont = TextEditingController();
  final remarkCont = TextEditingController();
  final contactNumberCont = TextEditingController();

  final _navService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();

  bool checkBoxVal = false;
  String genderSelected = '';
  String hospitalSelected = '';
  String rankSelected = '';
  String postSelected = '';
  String depSelected = '';
  String memberShipType = '';

  List<String> items = ['One', "Two", "Three", "Four", "Five"];
  List<String> dep = [
    'OT/OR',
    "Pain",
    "Day Surgery Center",
  ];
  List<String> hospitals = [
    'ADVENTIST MEDICAL CENTRE (TAI KOO)',
    'ALICE HO MIU LING NETHERSOLE HOSPITAL',
    'CANOSSA HOSPITAL',
    'CARITAS MEDICAL CENTRE',
    'CUHK Medical Centre',
    "DUCHESS OF KENT CHILDREN'S HOSPITAL",
    'EVANGEL HOSPITAL',
    'GLENEAGLES HONG KONG HOSPITAL',
    'HAVEN OF HOPE HOSPITAL',
    'HONG KONG ADVENTIST HOSPITAL',
    'HONG KONG BAPTIST HOSPITAL',
    'HONG KONG BUDDHIST HOSPITAL',
    'HONG KONG CHILDREN\'S HOSPITAL',
    'HONG KONG FAMILY PLANNING ASSOCIATION',
    'HONG KONG SANATORIUM & HOSPITAL',
    'HOSPITAL AUTHORITY HEAD OFFICE',
    'KOWLOON HOSPITAL',
    'KWONG WAH HOSPITAL',
    'MATILDA INTERNATIONAL HOSPITAL',
    'NORTH DISTRICT HOSPITAL',
    'NORTH LANTAU HOSPITAL',
    'OT & P Healthcar',
    'OUR LADY OF MARYKNOLL HOSPITAL',
    'PAMELA YOUDE NETHERSOLE EASTERN HOSPITAL',
    'POK OI HOSPITAL',
    'PRECIOUS BLOOD HOSPITAL',
    'PRINCE OF WALES HOSPITAL',
    'PRINCESS MARGARET HOSPITAL',
    'QUEEN ELIZABETH HOSPITAL',
    'QUEEN MARY HOSPITAL',
    'RETIRED (PREVIOUS MEMBER)',
    'RUTTONJEE HOSPITAL',
    'ST. PAUL\'S HOSPITAL',
    'T. TERESA\'S HOSPITAL',
    'TANG SIU KIN HOSPITAL',
    'TSEUNG KWAN O HOSPITAL',
    'TSUEN WAN ADVENTIST HOSPITAL',
    'TUEN MUN EYE CENTRE',
    'TUEN MUN HOSPITAL',
    'TUNG WAH HOSPITAL',
    'UNION HOSPITAL',
    'UNITED CHRISTIAN HOSPITAL',
    'YAN CHAI HOSPITAL',
  ];
  List<String> gender = ['Male', "Female", "Rather not Say"];
  List<String> rank = ['EN', "RN"];
  List<String> membership = [
    'Associated Member',
    "Associated non-local Member",
    "Associated student Member",
    "Ordinary Member",
    "Retired Member",
  ];

  final _sharedService = locator<SharedPrefService>();
  final _key = StackedService.navigatorKey!;

  final _authService = locator<AuthService>();

  void goToSignIn() {
    _navService.back();
  }

  toggelPassword() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  toggelPasswordConfirm() {
    passwordVisibleConfirm = !passwordVisibleConfirm;
    notifyListeners();
  }

  void createAccount() async {
    if (checkBoxVal == false) {
      FlushbarHelper.createInformation(
              message:
                  "Please agree to terms and service before you create account.")
          .show(_key.currentContext!);
      return;
    }
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      CreateUserModel userModel = CreateUserModel(
          email: emailCont.text.trim(),
          password: passwordController.text.trim(),
          first_name: firstNameCont.text.trim(),
          last_name: surNameCon.text.trim(),
          nickname: nickNameCont.text.trim(),
          chinese_name: chinesNameCont.text.trim(),
          gender: genderSelected,
          hospital: hospitalSelected,
          rank: rankSelected,
          post: postCont.text.trim(),
          dept: depSelected,
          membership: memberShipType,
          remark: remarkCont.text.trim(),
          contact_number: contactNumberCont.text.trim());
      setBusy(true);
      Map? data = await _authService.createAccount(userModel);

      if (data != null && data['user_id'] != null) {
        var response = {
          'password': passwordController.text.trim(),
          'email': emailCont.text.trim(),
          'id': data['user_id'],
        };
        _sharedService.setData(response);
        FlushbarHelper.createSuccess(message: 'Register Succesfully');
        _navService.clearStackAndShow(Routes.mainView);
      } else {
        FlushbarHelper.createSuccess(
                message:
                    "Your Account is being created. Please wait for the account activation email and login again to pay this fee")
            .show(_key.currentContext!)
            .then((value) => _navService.navigateTo(Routes.signInView));
      }
      setBusy(false);
    }
  }

  String? validateEmail(String? val) {
    if (val.toString().isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }

  String? validateConfirmEmail(String? val) {
    if (val.toString().isEmpty) {
      return "Email can't be empty";
    } else if (val.toString().trim() != emailCont.text.trim()) {
      return "Emails don't match";
    }
    return null;
  }

  String? validateConfrimPassword(String? val) {
    if (val.toString().isEmpty) {
      return "Password can't be empty";
    } else if (val.toString().trim() != passwordControllerConfirm.text.trim()) {
      return "Password doesn't match";
    }
    return null;
  }

  String? validatePassword(String? val) {
    if (val.toString().isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }

  String? validateFirstName(String? val) {
    if (val.toString().isEmpty) {
      return "First name can't be empty";
    }
    return null;
  }

  validateSurName(String? val) {
    if (val.toString().isEmpty) {
      return "Sur name can't be empty";
    }
  }

  validateNickName(String? val) {
    if (val.toString().isEmpty) {
      return "Nick name can't be empty";
    }
  }

  onChangedGender(String val) {
    genderSelected = val;
  }

  onChangedHospital(String val) {
    hospitalSelected = val;
  }

  onChangedRank(String val) {
    rankSelected = val;
  }

  String? validatePost(String? val) {
    if (val.toString().isEmpty) {
      return "Post can't be empty";
    }
    return null;
  }

  changedSpecalist(String val) {}

  onChangeMembershipType(String val) {}

  changeCheckBox(bool? val) {
    checkBoxVal = val!;
    notifyListeners();
  }

  String? validateContact(String? val) {
    if (val.toString().isEmpty) {
      return "Contact number is required";
    }
    return null;
  }
}
