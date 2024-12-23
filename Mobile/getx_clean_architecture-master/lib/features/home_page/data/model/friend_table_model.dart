import '../../../../base/base.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(caseStyle: CaseStyle.snake, ignoreNullMembers: true)
class FriendTableModel {
    final int? id;
    final String? account1;
    final String? account2;

    FriendTableModel({
        this.id,
        this.account1,
        this.account2,
    });

    FriendTableModel copyWith({
        int? id,
        String? account1,
        String? account2,
    }) => 
        FriendTableModel(
            id: id ?? this.id,
            account1: account1 ?? this.account1,
            account2: account2 ?? this.account2,
        );
}
