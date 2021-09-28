import 'package:flutter_test2/model/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? double.tryParse(json['id'])
				: json['id'].toDouble();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['address'] != null) {
		data.address = UserAddress().fromJson(json['address']);
	}
	if (json['phone'] != null) {
		data.phone = json['phone'].toString();
	}
	if (json['website'] != null) {
		data.website = json['website'].toString();
	}
	if (json['company'] != null) {
		data.company = UserCompany().fromJson(json['company']);
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['address'] = entity.address.toJson();
	data['phone'] = entity.phone;
	data['website'] = entity.website;
	data['company'] = entity.company.toJson();
	return data;
}

userAddressFromJson(UserAddress data, Map<String, dynamic> json) {
	if (json['street'] != null) {
		data.street = json['street'].toString();
	}
	if (json['suite'] != null) {
		data.suite = json['suite'].toString();
	}
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['zipcode'] != null) {
		data.zipcode = json['zipcode'].toString();
	}
	if (json['geo'] != null) {
		data.geo = UserAddressGeo().fromJson(json['geo']);
	}
	return data;
}

Map<String, dynamic> userAddressToJson(UserAddress entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['street'] = entity.street;
	data['suite'] = entity.suite;
	data['city'] = entity.city;
	data['zipcode'] = entity.zipcode;
	data['geo'] = entity.geo.toJson();
	return data;
}

userAddressGeoFromJson(UserAddressGeo data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat'].toString();
	}
	if (json['lng'] != null) {
		data.lng = json['lng'].toString();
	}
	return data;
}

Map<String, dynamic> userAddressGeoToJson(UserAddressGeo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

userCompanyFromJson(UserCompany data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['catchPhrase'] != null) {
		data.catchPhrase = json['catchPhrase'].toString();
	}
	if (json['bs'] != null) {
		data.bs = json['bs'].toString();
	}
	return data;
}

Map<String, dynamic> userCompanyToJson(UserCompany entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['catchPhrase'] = entity.catchPhrase;
	data['bs'] = entity.bs;
	return data;
}