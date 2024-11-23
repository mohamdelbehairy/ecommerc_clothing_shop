import 'package:e_clot_shop/features/notification/data/models/notification_model.dart';

abstract class NotificationRepo {
  Future<void> storeNotification(NotificationModel notifyModel);
}
