class ApiEndpoints {
  static const String baseUrl = "http://192.168.1.14:3000/";
  static const String signUpEndpoint = "auth";
  static const String logINEndpoint = "auth/signin";
  static const String forgerPasswordEndpoint = "auth/forget-password";
  static const String enterTheCodeEndpoint = "auth/verify-reset";
  static const String resetPasswordEndpoint = "auth/reset-password";
  static const String logoutEndpoint = "auth/logout";
  static const String getAllCategoriesEndpoint = "category";
  static const String getAllSubCategoriesEndpoint = "subcategory";

  // opportuinities
  static const String createAndGetALLOpportunitiesEndpoint = "opportunity";
  static const String getALLOpportunitiesinterestsEndpoint =
      "intersting-community";

  static const String getALLReactsEndpoint = "react";

  // static const String updateopportunityEndpoint = "opportunity";
  // static const String deleteopportunityEndpoint = "opportunity";

  static const String getALLCommunitiesEndpoint = "community";
  static const String getSpecificCommunitiesEndpoint = "specific";

  static const String joinRequestCommuntiyCommunitiesEndpoint = "join-request";
  static const String cancelJoinCommuntiyCommunitiesEndpoint = "cancel-join";
  static const String handleJoinRequestEndpoint = "handle-request";
  static const String leaveCommuntiyEndpoint = "leave-community";

  // USER
  static const String userEndpoint = "user";
  static const String becomeVolunteerEndpoint = "become-volunteer";

  static const String voulnteerEndpoint = "volunteer";
}
