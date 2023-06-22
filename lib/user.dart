class User {
  String name = "";
  String id = ""; //Mac Address for now, OTP Later

  User(String id, String name) {
    this.id = id;
    this.name = name;
  }

  String getName() {
    return name;
  }

  String getID() {
    return id;
  }

  void setName(name) {
    this.name = name;
  }

  void setID(id) {
    this.id = id;
  }
}
