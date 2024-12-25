import '../../../../base/base.dart';

@jsonSerializable
@Json(caseStyle: CaseStyle.snake, ignoreNullMembers: true)
class ImageModel {
  final int? id;
  @JsonProperty(name: 'imageUrl')
  final String? imageUrl;
  final String? account;
  @JsonProperty(name: 'dateTime')
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

  @override
  String toString() {
    return 'ImageModel{id: $id, imageUrl: $imageUrl, account: $account, dateTime: $dateTime}';
  }
}
