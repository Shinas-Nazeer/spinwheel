


class ValidateTextForm {
  static validate(value) {
    if (value!.isEmpty) {
      return 'Plesae Enter Details';
    } else {
      return null;
    }
  }
 static validatePhone(value) {
   final phoneExp = RegExp(r'^\d{10}$');
     if (!phoneExp.hasMatch(value))  {
      return 'Please enter a valid phone number';
    } else {
      return null;
    }
  }

 static validateEmail(value) {
     if (!RegExp(r'^(?=.*@)(?=.*\.com).+$').hasMatch(value)) {
          return 'Invalid email format';
        } else {
      return null;
    }
  }


}
