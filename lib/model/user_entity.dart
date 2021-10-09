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

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company}';
  }
}

class UserAddress with JsonConvert<UserAddress> {
	late String street;
	late String suite;
	late String city;
	late String zipcode;
	late UserAddressGeo geo;

  @override
  String toString() {
    return 'UserAddress{street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo}';
  }
}

class UserAddressGeo with JsonConvert<UserAddressGeo> {
	late String lat;
	late String lng;

  @override
  String toString() {
    return 'UserAddressGeo{lat: $lat, lng: $lng}';
  }
}

class UserCompany with JsonConvert<UserCompany> {
	late String name;
	late String catchPhrase;
	late String bs;

  @override
  String toString() {
    return 'UserCompany{name: $name, catchPhrase: $catchPhrase, bs: $bs}';
  }
}
