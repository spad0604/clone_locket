import '../../../../base/base.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(caseStyle: CaseStyle.snake, ignoreNullMembers: true)
class ImageModel {
    final int? id;
    final String? imageUrl;
    final String? account;
    final DateTime? dateTime;

    ImageModel({
        this.id,
        this.imageUrl,
        this.account,
        this.dateTime,
    });

    ImageModel copyWith({
        int? id,
        String? imageUrl,
        String? account,
        DateTime? dateTime,
    }) => 
        ImageModel(
            id: id ?? this.id,
            imageUrl: imageUrl ?? this.imageUrl,
            account: account ?? this.account,
            dateTime: dateTime ?? this.dateTime,
        );
}
