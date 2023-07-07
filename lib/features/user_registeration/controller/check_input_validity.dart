bool validData(name, phone) {
  String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  RegExp regExp = RegExp(pattern);
  if (name != null) {
    //Implement Regex
    return true;
  } else {
    return false;
  }
}
