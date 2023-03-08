class ApisPaths {
  // BASE URL
  // static const baseUrl = "http://localhost:8080";
  // static const baseUrl = "http://10.0.2.2:8000";
  // static const baseUrl = "http://15.188.106.226:8080";
  static const baseUrl = "http://ec2-15-188-106-226.eu-west-3.compute.amazonaws.com:8080";

  // CORE URL
  static const coreUrl = "$baseUrl/v1";

  // VALIDATE CREDENTIALS
  static const validateCredentialsUrl = "$coreUrl/agent-credentials/validate";

  // Agent Urls
  static const agentUrl = "$coreUrl/agents";

  // GET AGENT BALANCE WITH ID
  static String getAgentBalanceWithID({required String agentId}) => "$agentUrl/get-agent-balance/$agentId";


  // Transactions Urls
  static const transactionsUrl = "$coreUrl/transactions";

  // GET AGENT TRANSACTIONS WITH ID
  static String getAgentTransactionsWithAgentID({required String agentId}) => "$transactionsUrl/get-agent-transactions/$agentId";

  // Get Cashout details
  static const cashoutDetailsUrl = "$transactionsUrl/cash-out-details";

  // Cashout
  static const cashoutUrl = "$transactionsUrl/cash-out";

  // GET USER
  static String getUserWithPhoneNumber({required String phoneNumber}) => "$coreUrl/get-user-with-phone-number?id=$phoneNumber";


  // REGISTER CUSTOMER
  static const registerCustomerUrl = "$coreUrl/api/register-customer/";

  // UPDATE CUSTOMER
  static const updateCustomerUrl = "$coreUrl/api/update-customer-details/";

  // GENERATE OTP CUSTOMER
  static const generateOTPUrl = "$coreUrl/api/generate-otp/";

  static const validateOTPUrl = "$coreUrl/api/validate-otp/";

  // HOST A SERVICE
  static const hostService = "$coreUrl/api/host-service/";

  // GET ESSENTIALS
  static const getEssentials = "$coreUrl/essentials/";

  // GET HOSTED SERVICES
  static const getHostedServices = "$coreUrl/hosted-services/";

  // GET HOSTED SERVICES BY CATEGORY
  static String getHostedServicesByCategory({required String serviceid}) => "$coreUrl/hosted-services-by-category?id=$serviceid";

  // ADD REVIEW
  static String addReview = "$coreUrl/api/add-service-review/";

  // GET REVIEWS
  static String getServiceReviews({required String serviceid}) => "$coreUrl/hosted-service-reviews?id=$serviceid";

// GET CUSTOMER API
// static String getCustomerApi({required String customerId}) => "$customersApiEndPointBase/$customerId";

}