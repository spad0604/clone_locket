import '../../../../base/base.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(caseStyle: CaseStyle.camel, ignoreNullMembers: true)
class HistoryModel {
    final int? imageId;
    final String? account;
    final int? isSeen;

    HistoryModel({
        this.imageId,
        this.account,
        this.isSeen,
    });

    HistoryModel copyWith({
        int? imageId,
        String? account,
        int? isSeen,
    }) => 
        HistoryModel(
            imageId: imageId ?? this.imageId,
            account: account ?? this.account,
            isSeen: isSeen ?? this.isSeen,
        );
}
