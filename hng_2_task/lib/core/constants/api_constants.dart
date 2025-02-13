class ApiConstants {
  static const String baseUrl = 'https://restfulcountries.com/api/v1';
  static const String countries = '/countries';
  static String states(String country) => '/countries/$country/states';
}
