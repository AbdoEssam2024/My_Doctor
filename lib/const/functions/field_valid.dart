import 'package:get/get_utils/get_utils.dart';

validFields({
  required String val,
  required String type,
  required String fieldName,
  required int minVal,
  required int maxVal,
}) {
  if (val.isEmpty) {
    return "Please fill the required field: $fieldName.";
  }

  if (val.length > maxVal) {
    return "$fieldName can't be more than $maxVal characters.";
  }

  if (val.length < minVal) {
    return "$fieldName can't be less than $minVal characters.";
  }

  switch (type) {
    case "mobile":
      if (!GetUtils.isPhoneNumber(val)) {
        return "Please enter a valid $fieldName.";
      }
      break;

    case "email":
      if (!GetUtils.isEmail(val)) {
        return "Please enter a valid $fieldName.";
      }
      break;

    case "name":
      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(val)) {
        return "Please enter a valid $fieldName.";
      }
      break;
  }

  return null;
}
