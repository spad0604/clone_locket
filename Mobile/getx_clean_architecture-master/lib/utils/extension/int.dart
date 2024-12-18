import 'package:jbbase_app/utils/config/app_constants.dart';
import 'package:jiffy/jiffy.dart';

extension IntExtension on int {
  DateTime get dateTime => Jiffy.parseFromMillisecondsSinceEpoch(this).dateTime;

  String get dateTimeString => Jiffy.parseFromMillisecondsSinceEpoch(this)
      .format(pattern: AppConstants.dateTimeFormat);
}
