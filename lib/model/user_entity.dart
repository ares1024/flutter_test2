import 'package:flutter_test2/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	late double id;
	late String name;
	late String username;
	late String email;
	late UserAddress address;
	late String phone;
	late String website;
	late UserCompany company;
}

class UserAddress with JsonConvert<UserAddress> {
	late String street;
	late String suite;
	late String city;
	late String zipcode;
	late UserAddressGeo geo;
}

class UserAddressGeo with JsonConvert<UserAddressGeo> {
	late String lat;
	late String lng;
}

class UserCompany with JsonConvert<UserCompany> {
	late String name;
	late String catchPhrase;
	late String bs;
}
