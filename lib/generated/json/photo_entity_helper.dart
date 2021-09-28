import 'package:flutter_test2/model/photo_entity.dart';

photoEntityFromJson(PhotoEntity data, Map<String, dynamic> json) {
	if (json['albumId'] != null) {
		data.albumId = json['albumId'] is String
				? double.tryParse(json['albumId'])
				: json['albumId'].toDouble();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? double.tryParse(json['id'])
				: json['id'].toDouble();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['thumbnailUrl'] != null) {
		data.thumbnailUrl = json['thumbnailUrl'].toString();
	}
	return data;
}

Map<String, dynamic> photoEntityToJson(PhotoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['albumId'] = entity.albumId;
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['thumbnailUrl'] = entity.thumbnailUrl;
	return data;
}