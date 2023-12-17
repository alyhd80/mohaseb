class FormValidator {
  static FormValidator? _instance;

  factory FormValidator() => _instance ?? new FormValidator._();

  FormValidator._();

  String? validatePhoneNumber(String? value) {
    print('data is $value');
    if (value?.isEmpty == true) {
      return notEmpty(value);
    } else if (value?.length != 11) {
      return "شماره همراه باید ۱۱ رقم باشد.";
    } else {
      return null;
    }
  }

  String? validateOtpCode(String? value) {
    if (value?.isEmpty == true) {
      return notEmpty(value);
    } else if (value?.length != 4) {
      return "لطفا در وارد کردن کد احراز هویت دقت فرمایید";
    } else {
      return null;
    }
  }

  String? validateNationalCode(String? value,{String? type,int? length}) {
    if (value?.isEmpty == true) {
      return notEmpty(value);
    } else if (value!.length != (length==null?10:length)) {
      return "لطفا در وارد کردن ${type??"کد ملی"} دقت فرمایید";
    } else {
      return null;
    }
  }

  String? passwordChecker(String? value,{int? minCount,String? type,bool}) {
    if (value?.isEmpty == true) {
      return "لطفا اطلاعات  فیلد را تکمیل نمایید.";
    } else if (value != null){
      if (value.isNotEmpty){
        if (value.length < (minCount==null?8:minCount)){
          return "${type==null?"پسوورد":type} نباید کمتر از ${(minCount==null?8:minCount)} کاراکتر باشد.";
        }
      }
      return null;
    }
    else {
      return null;
    }
  }

  String? notEmpty(String? value,{String? type}) {
    if (value?.isEmpty == true) {
      return "لطفا اطلاعات فیلد ${type??""}را تکمیل نمایید.";
    } else {
      return null;
    }
  }

  String? userNameChecker(String? value,{String? type , int? minCount}) {
    print(minCount);
    if (value?.isEmpty == true) {
      return "لطفا اطلاعات  فیلد را تکمیل نمایید.";
    } else if (value != null){
      if (value.isNotEmpty){
        if (value.length < (minCount ?? 4)){
          return " ${type??"نام کاربری"} نباید کمتر از ${(minCount ?? 4)} کاراکتر باشد.";
        }
      }
      return null;
    }
    else {
      return null;
    }
  }

  String ? mobileValid(mobile){
    if (mobile.isEmpty) {
      return 'فیلد خالی است.';
    } else if (mobile.isNotEmpty) {
      //bool mobileValid = RegExp(r"^(?:\+88||01)?(?:\d{10}|\d{13})$").hasMatch(value);

      bool mobileValid =
      RegExp(r'09[0-9]{9}$').hasMatch(mobile);
      return mobileValid ? null : "شماره اشتباه است.";
    }
    return null;
  }

}
