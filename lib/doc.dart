/// * fetch_wallet
// input
// output   => WalletResource

//-----------------------------------------------------------------
// * WalletResource

// String balance
// BankAccountResource account
// List<TransactionHistoryResource> transactions

/// ------------------------------------- Auh ----------------------------------
/// * login
//
// - input
// -- email
// -- password
// -- device_token
// -- device_id
// - output
// -- status
// -- message
// -- data                      => UserResource
//
//
//
/// * register
//
// - input
// -- account_name
// -- email
// -- phone
// -- password
// -- device_token
// -- device_id
// -- user_type
//
// - output
//
// -- status
// -- message
// -- data                     => UserResource
//
//
/// * check_email
//
// - input
// -- email
//
// - output
// -- status
// -- message
// -- data                      => bool
//
//
/// * check_code
//
// - input
// -- email
// -- code
//
// - output
//
// -- status
// -- message
// -- data                     => bool
//
/// * reset_password
//
// - input
//
// -- email
// -- password
//
// - output
//
// -- status
// -- message
//
//
//
/// * change_password              => auth
//
// - input
//
// -- old_password
// -- new_password
//
// - output
//
// -- status
// -- message
//
//
/// ------------------------------------- Auh ----------------------------------
// * company_set_account_info             => auth
//
// - input
//
// -- company_type
// // this data for type 0
// -- identity_type_id
// -- identity_number
// // this data for type 1
// -- work_activity_id
// -- sector_id
// -- commercial_register_number
// -- address
// -- head_quarters_city_id
// // this data for responsible
// -- responsible_name
// -- responsible_role_id
// -- responsible_phone
// -- responsible_email
//
// - output
//
// -- status
// -- message
// -- data                          => UserResource
//
//
// // data for responsible
//
// * fetch_responsible_roles
//
// - input
// - output
//
// -- status
// -- message
// -- data                         => List<TitleResource>
//
//
// * fetch_cities
//
// - input
// - output
// -- status
// -- message
// -- data                        => List<TitleResource>
//
//
// * edit_responsible
//
// - input
// -- responsible_name
// -- responsible_role_id
// -- responsible_phone
// -- responsible_email
// - output
// -- status
// -- message
// -- data                       => UserResource
//
//
// * edit_account_name
//
// - input
// -- name
//
// - output
// -- status
// -- message
// -- data                       => UserResource
//
// * change_account_email
// - input
// -- email
// -- password
//
// - output
// -- status
// -- message
// -- data                       => UserResource
//
// * edit_company_info
//
// - input
// -- company_type
// // this data for type 0
// -- identity_type_id
// -- identity_number
// // this data for type 1
// -- work_activity_id
// -- sector_id
// -- commercial_register_number
// -- address
// -- head_quarters_city_id
//
// - output
//
// -- status
// -- message
// -- data                          => UserResource
//
//
//
//
//
// * change_notify_status
//
// - input
// - output
// -- status
// -- message
// -- data                       => bool
//
//
//
// * fetch_questions
//
// - input
// - output
//
// -- status
// -- message
// -- data                      => List<QuestionResource>
//
//
//
// * privacy
// - input
// - output
//
// -- status
// -- message
// -- data                      => List<QuestionResource>
//
//
// * usage
// - input
// - output
//
// -- status
// -- message
// -- data                      => List<QuestionResource>
//
//
//
//
//
//
// * fetch_information_for_company_register
//
// - input
// - output
// -- status
// -- message
// -- work_activities                  => List<TitleResource>
// -- sections                         => List<TitleResource>
// -- identities                       => List<TitleResource>
//
//
//
//
//
// * company_statics                   => auth
//
// - input
// - output
//
// -- status
// -- message
// -- data                         =>
// {
// 'total_jobs' : int,
// 'completed_jobs' : int,
// 'under_review_jobs' : int,
// 'current_jobs' : int,
// 'employees' : int,
// }
//
//
//
// * add_job
//
// - input
//
// -- request_status
//
// -- service_id
// -- jumber_numbers
// -- nationality_id
// -- gender
// -- age
// -- skils_ids
// -- woork_type_id
// -- language_ids
// -- company_address
// -- company_lat
// -- company_lon
// -- full_Address
//
// -- aacount_type
// -- work_duration_id
// -- start_date
// -- end_date
// -- time_type_id
// -- start_time
// -- end_time
// -- price
// -- price_for_id
// -- description
//
// -- output
//
// -- status
// -- message
// -- data                => JobResource
//
//
//
//
//
// * fetch_services
// - input
// - output
//
// -- status
// -- message
// -- data                 => List<ServiceResource>
//
//
// * fetch_skills
//
// - input
// - output
// -- status
// -- message
// -- data                  => List<TitleResource>
//
// * fetch_languages
//
// - input
// - output
// -- status
// -- message
// -- data                  => List<TitltResource>
//
//
// * fetch_work_types
//
// - input
// - output
// -- status
// -- message
// -- data                    => List<TitleResource>
//
//
// * fetch_add_job_informations
//
// - input
// - output
//
// -- status
// -- message
// -- account_types          => List<TitleResource>
// -- work_durations         => List<TitleResource>
// -- time_types             => List<TitleResource>
// -- price_types            => List<TitleResource>
//
//
// * fetch_my_jobs
//
// - input
// - output
// -- status
// -- message
// -- data                   => List<JobResource>
//
//
// * delete_job_request
//
// - input
// -- job_id
// - output
// -- status
// -- message
//
//
// * job_Employees
//
// - input
// -- job_id
// - output
//
// -- status
// -- message
// -- all_employees                 => List<EmployeeResource>
// -- accepted_employees            => List<EmployeeResource>
// -- refused_employees             => List<EmployeeResource>
//
//
// * accept_employee
//
// - input
// -- job_id
// -- employee_id
//
// - output
// -- status
// -- message
//
//
// * refuse_employee
//
// - input
// -- job_id
// -- employee_id
//
// - output
// -- status
// -- message
//
//
//
// * request_more_employees
//
// - input
// -- job_id
// -- jumper_numbers
//
// - output
// -- status
// -- message
// -- data                          => JobResource
//
// * my_employees
//
// - input
// - output
//
// -- status
// -- message
// -- data                         => List<EmployeeResource>
//
// * my_fav_employees
//
// - input
// - output
//
// -- status
// -- message
// -- data                         => List<EmployeeResource>
//
//
//
// * fav_employee
//
// - input
// -- emplyee_id
//
// - output
//
// -- status
// -- message
// -- data                           => EmployeeResource
//
//
//
// * employee_term_extension
//
// - input
// -- employee_id
// -- time_type_id
// -- start_time
// -- end_time
// -- duration
// - output
// -- status
// -- message
// -- data                         => EmployeeResource
//
//
// * fetch_time_types
//
// - input
// - output
// -- status
// -- message
// -- data                           => List<TitleResource>
//
//
//
// * fetch_finish_work_reasons
//
// - input
// - output
//
// -- status
// -- message
// -- data                          => List<TitleResource>
//
//
// * finish_employee_work
//
// - input
// -- employee_id
// -- finish_work_reason_id
// -- finish_work_reason_text
//
// - output
// -- status
// -- message
//
//
//
//
//
//
//
//
//
// ---------------- Resources ---------------------
//
// كله String الا اللي اكتب عليه
//
//
// * UserResource
// -- id                         => int
// -- user_type
// -- email
// -- phone
// -- api_token
// -- device_token
// -- email_verify               => int
// -- info_compelete             => int
//
// -- image
//
// -- company_type
//
// -- work_activity_id              => int
// -- work_activity_title
// -- section_id                    => int
// -- section_title
// -- commercial_register_number
// -- full_address
// -- head_quarters_city_id          => int
// -- head_quarters_city_title
//
// -- identity_type_id               => int
// -- identity_type_title
// -- identity_number
//
// -- responsible_name
// -- responsible_role_id            => int
// -- responsible_role_title
// -- responsible_phone
// -- responsible_email
//
// * TitleResource
//
// -- id                   => int
// -- title
//
// * QuestionResource
// -- id                   => int
// -- question
// -- answer
//
// * JobResource
//
// -- id                     => int
// -- service_id             => int
// -- service_title
// -- service_description
// -- nationality_id          => int
// -- nationality_title
// -- gender
// -- age
// -- skills                            => List<TitleResource>
// -- woork_type_id             => int
// -- woork_type_title
// -- languages                         => List<TitleResource>
// -- company_address
// -- company_lat
// -- company_lon
// -- full_Address
// -- work_duration_id       => int
// -- work_duration_title
// -- acount_type_id          => int
// -- acount_type_title
// -- start_date
// -- end_date
// -- time_type_id            => int
// -- time_type_title
// -- start_time
// -- end_time
// -- price
// -- price_for_id            => int
// -- price_for_title
// -- description
// -- request_status
// -- employee_numbers
// -- request_date
//
// * ServiceResource
//
// -- id                        => int
// -- title
// -- price
//
// * EmployeeResource
//
// -- id                      => int
// -- name
// -- image
// -- nationality
// -- service
// -- age
// -- cv
// -- about
// -- city
// -- gender
// -- address
// -- languages                 => List<String>
// -- لسه هزود كام فيلد هنا
//
//
//
//
//
//
//
//
//
//
//
//
//
//
