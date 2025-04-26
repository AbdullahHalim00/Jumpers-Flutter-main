mixin ApiNames {
  static const String baseUrl = "https://jumpersksa.com/api/";

  final String uRLLogin = "${baseUrl}login";
  final String uRLSetOrganizationInfo = "${baseUrl}company_set_account_info";
  final String uRLSetJumperPersonalInfo = "${baseUrl}set_jumper_first_info";
  final String uRLSetJumperEmploymentInfo = "${baseUrl}set_jumper_second_info";
  final String uRLLoginWithEmail = "${baseUrl}login_with_gmail";
  final String uRLRegister = "${baseUrl}register";
  final String uRLEditAccountName = "${baseUrl}edit_account_name";
  final String uRLEditAccountEmail = "${baseUrl}change_account_email";
  final String uRLCheckEmail = "${baseUrl}check_phone";
  final String uRLCheckCode = "${baseUrl}check_code";
  final String uRLResetPassword = "${baseUrl}reset_password";
  final String uRLChangePassword = "${baseUrl}change_password";
  final String uRLCheckPhone = "${baseUrl}check_phone";
  final String uRLVerifyPhone = "${baseUrl}verify_phone";
  final String uRLContactUs = "${baseUrl}send-contact";
  final String uRLAbout = "${baseUrl}about";
  final String uRLFaq = "${baseUrl}fetch_questions";
  final String uRLFetchContractTerms = "${baseUrl}fetch_contract_terms";
  final String uRLTerms = "${baseUrl}fetch_terms";
  final String uRLPrivacy = "${baseUrl}fetch_privacy";
  final String uRLEditProfile = "${baseUrl}edit_profile";
  final String uRLChangeNotifyStatus = "${baseUrl}change_notify_status";
  final String uRLSetUserImage = "${baseUrl}set_user_image";
  final String uRLFetchNotifications = "${baseUrl}fetch_notifications";
  final String uRLLogout = "${baseUrl}logout";

  // requests
  final String uRLFetchCities = "${baseUrl}fetch_cities";
  final String uRLFetchServices = "${baseUrl}fetch_services";
  final String uRLFetchSkills = "${baseUrl}fetch_skills";
  final String uRLFetchLanguages = "${baseUrl}fetch_languages";
  final String uRLFetchResponsibleRoles = "${baseUrl}fetch_responsible_roles";
  final String uRLFetchNationalities = "${baseUrl}fetch_nationalities";
  final String uRLFetchActivities = "${baseUrl}fetch_work_activies";
  final String uRLFetchTimeTypes = "${baseUrl}fetch_time_types";
  final String uRLFetchIdentities = "${baseUrl}fetch_identities";
  final String uRLFetchInfoForCompanyReg =
      "${baseUrl}fetch_information_for_company_register";
  final String uRLFetchAddJobInfo = "${baseUrl}fetch_add_job_informations";
  final String uRLFetchWorkTypes = "${baseUrl}fetch_work_types";
  final String uRLFetchWorkTimeTypes = "${baseUrl}fetch_time_types";
  final String uRLFetchWorkReasons = "${baseUrl}fetch_finish_work_reasons";
  final String uRLRefusingReasons = "${baseUrl}fetch_refusing_reasons";

  // company --
  final String uRLAddJob = "${baseUrl}add_job";
  final String uRLEditJob = "${baseUrl}edit_job";
  final String uRLFetchMyJobs = "${baseUrl}fetch_myjobs";
  final String uRLDeleteJobRequests = "${baseUrl}delete_job_request";
  final String uRLAcceptEmployee = "${baseUrl}accept_employee";
  final String uRLRateEmployee = "${baseUrl}rate-job-jumper";
  final String uRLReturnEmployee = "${baseUrl}return_employee";
  final String uRLJobEmployees = "${baseUrl}job_employees";
  final String uRLRefuseEmployee = "${baseUrl}refuse_employee";
  final String uRLCancelJobRequests = "${baseUrl}cancel_job_request";
  final String uRLCompanyStatics = "${baseUrl}company_statics";
  final String uRLMyEmployees = "${baseUrl}my_employees";
  final String uRLMyFavEmployees = "${baseUrl}my_fav_employees";
  final String uRLFavEmployee = "${baseUrl}fav_employee";
  final String uRLTermExtension = "${baseUrl}employee_term_extension";
  final String uRLFinishEmployeeWork = "${baseUrl}finish_employee_work";
  final String uRLFetchMoreForJob = "${baseUrl}fetch_more_for_job";
  final String uRLPublishJob = "${baseUrl}publish_job";

  // jumper
  final String uRLCompanyDetails = "${baseUrl}company_details";
  final String uRLJumperJobs = "${baseUrl}junmper_jobs";
  final String uRLAcceptJob = "${baseUrl}accept_job";
  final String uRLRefuseJob = "${baseUrl}refuse_job";
  final String uRLChangeOffersStatus = "${baseUrl}change_offers_status";
  final String uRLDeleteJumperCv = "${baseUrl}delete_jumper_cv";

  // button_sheet
  final String uRLAdminRoles = "${baseUrl}fetch_responsible_roles";
  final String uRLWorkActivity = "${baseUrl}fetch_work_activies";
  final String uRLSectors = "${baseUrl}fetch_sectors";
  final String uRLCities = "${baseUrl}fetch_cities";
  final String uRLIdentities = "${baseUrl}fetch_identities";

  /// NEW ADDED

  final String uRLFetchWallet = "${baseUrl}your_wallet";
  final String uRLSaveAccountSetting = "${baseUrl}save_account_setting";
  final String uRLFetchBankAccounts = "${baseUrl}fetch_bank_account_types";
  final String uRLWithdrawMoney = "${baseUrl}withdraw_money";

  final String uRLFetchChats = "${baseUrl}fetch_chats";
  final String uRLFetchMessages = "${baseUrl}fetch-message";
  final String uRLStopJobRequest = "${baseUrl}stop_employees_order";
  final String uRLContactUsers = "${baseUrl}get-contacts-users";
  final String uRLGroupContactUsers = "${baseUrl}get-groups-users";

//*last add
  final String uRLSendMessage = "${baseUrl}send-message";
}
