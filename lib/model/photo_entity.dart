import 'package:flutter_test2/generated/json/base/json_convert_content.dart';
import 'package:flutter_test2/model/base_entity.dart';

class PhotoEntity extends BaseEntity with JsonConvert<PhotoEntity> {
	late double albumId;
	late double id;
	late String title;
	late String url;
	late String thumbnailUrl;

}
