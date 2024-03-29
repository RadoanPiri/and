class Connection {
  static const hostConnect =
      "https://watheqplatform.com/watheq_api"; // ip of the host device

  static const signUp = "$hostConnect/authentication/sign_up.php";

  static const validateEmail = "$hostConnect/authentication/validation.php";
  static const logIn = "$hostConnect/authentication/log_in.php";

  static const jobOffersData = "$hostConnect/Data/getdata.php";
  static const jobSeekerData = "$hostConnect/Data/jobseeker_data.php";
  static const jobDetailData = "$hostConnect/Data/getdetaildata.php";
  static const jobSeekerName = "$hostConnect/Data/getName.php";
  static const jobSeekerApplication =
      "$hostConnect/Application/jobSeekerApplications.php";
  static const getCities = "$hostConnect/Data/getCities.php";

  static const forgetPassword = "$hostConnect/Reset/forget_password.php";
  static const verifyToken = "$hostConnect/Reset/verify_code.php";
  static const resetPassword = "$hostConnect/Reset/reset_password.php";

  static const checkApplication =
      "$hostConnect/Application/checkApplication.php";
  static const apply = "$hostConnect/Application/apply.php";
  static const cancelApplication =
      "$hostConnect/Application/cancelApplication.php";
}
