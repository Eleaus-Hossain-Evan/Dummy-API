class APIRoute {
  static const String dummyAvatar = 'https://i.pravatar.cc/300';

  static const String baseURL = "https://dummyapi.io/data/v1/";
  static const String appId = "61c74a1797e6fe20b5557de7";

  static const String apiV1 = "api/v1";

  static const String config = "$apiV1/setting/view";
  static const String home = "$apiV1/home/fetch-products?inWhere=mobile";
  static const String productDetails = "$apiV1/product/single-product/";

  static Map<String, String> appIdHeaders = {"app-id": appId};
  static Map<String, String> homePostQuery = {"limit": "10"};

  //'==================== Category ===================='
  static const String post = "post";
}
