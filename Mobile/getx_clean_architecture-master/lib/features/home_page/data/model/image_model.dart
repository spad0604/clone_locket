import '../../../../base/base.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(ignoreNullMembers: true)
class ImageModel {
    final int? id;
    final String? imageUrl;
    final String? account;
    final String? dateTime;
    final String? message;

    ImageModel({
        this.id,
        this.imageUrl,
        this.account,
        this.dateTime,
        this.message
    });

    ImageModel copyWith({
        int? id,
        String? imageUrl,
        String? account,
        String? dateTime,
        String? message
    }) => 
        ImageModel(
            id: id ?? this.id,
            imageUrl: imageUrl ?? this.imageUrl,
            account: account ?? this.account,
            dateTime: dateTime ?? this.dateTime,
            message: message ?? this.message
        );
}
