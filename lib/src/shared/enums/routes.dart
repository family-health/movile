// ignore_for_file: constant_identifier_names

class ROUTES {
  // storage
  static const String USER_STORAGE = "user";

  // Routes
  static const String ROUTE_SING_IN = "/auth/signin";
  static const String ROUTE_SING_UP = "/auth/signup";
  static const String ROUTE_HOME = "/home";

  static const String ROUTE_SETTINGS_PROFILE_INFO = "/settings/profile/info";
  static const String ROUTE_SETTINGS_PROFILE_UPDATE =
      "/settings/profile/update";

  static const String ROUTE_FAMILY_LIST_FAMILIES = "/family/list_families";

  static const String ROUTE_FAMILY_EDIT = "/family/edit/:id";

  String routeFamilyEdit(String id) {
    var route = ROUTE_FAMILY_EDIT;
    return route.replaceFirst(":id", id);
  }
}
