class ApisPaths {
  // BASE URL
  // static const baseUrl = "http://localhost:8080";
  // static const baseUrl = "http://10.0.2.2:8080";
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

  // GET AGENT TRANSFERS WITH ID
  static String getAgentTransfersWithAgentID({required String agentId}) => "$transactionsUrl/get-agent-transfers/$agentId";

  // GET AGENT CASHOUTS WITH ID
  static String getAgentCashoutsWithAgentID({required String agentId}) => "$transactionsUrl/get-agent-cashouts/$agentId";

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

}