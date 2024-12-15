part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class ChangeIndex extends AppState {}

final class ChooseTimeIndex extends AppState {}

final class ChangeScreenIndex extends AppState {}

final class ServerError extends AppState {}

final class Timeoutt extends AppState {}

final class GetIntroLoading extends AppState {}

final class GetIntroSuccess extends AppState {}

final class GetIntroFailure extends AppState {
  final String error;

  GetIntroFailure({required this.error});
}

final class GetHomeDataLoading extends AppState {}

final class GetHomeDataSuccess extends AppState {
  final String message;

  GetHomeDataSuccess({required this.message});
}

final class GetHomeDataFailure extends AppState {
  final String error;

  GetHomeDataFailure({required this.error});
}

final class GetServicesLoading extends AppState {}

final class GetServicesSuccess extends AppState {
  final String message;
  GetServicesSuccess({required this.message});
}

final class GetServicesFailure extends AppState {
  final String error;

  GetServicesFailure({required this.error});
}

final class GetDepartmentLoading extends AppState {}

final class GetDepartmentSuccess extends AppState {
  final String message;

  GetDepartmentSuccess({required this.message});
}

final class GetDepartmentFailure extends AppState {
  final String error;

  GetDepartmentFailure({required this.error});
}

final class ShowDepartmentLoading extends AppState {}

final class ShowDepartmentSuccess extends AppState {
  final String message;

  ShowDepartmentSuccess({required this.message});
}

final class ShowDepartmentFailure extends AppState {
  final String error;

  ShowDepartmentFailure({required this.error});
}

final class GetOrdersLoading extends AppState {}

final class GetOrdersSuccess extends AppState {
  final String message;

  GetOrdersSuccess({required this.message});
}

final class GetOrdersFailure extends AppState {
  final String error;

  GetOrdersFailure({required this.error});
}

final class StoreOrderLoading extends AppState {}

final class StoreOrderSuccess extends AppState {}

final class StoreOrderFailure extends AppState {
  final String error;
  StoreOrderFailure({required this.error});
}

final class ShowProviderLoading extends AppState {}

final class ShowProviderSuccess extends AppState {}

final class ShowProviderFailure extends AppState {
  final String error;
  ShowProviderFailure({required this.error});
}

final class ShowOrderLoading extends AppState {}

final class ShowOrderSuccess extends AppState {}

final class ShowOrderFailure extends AppState {
  final String error;
  ShowOrderFailure({required this.error});
}

final class ChangeOrderStatusLoading extends AppState {}

final class ChangeOrderStatusSuccess extends AppState {}

final class ChangeOrderStatusFailure extends AppState {
  final String error;
  ChangeOrderStatusFailure({required this.error});
}

final class ShowUserLoading extends AppState {}

final class ShowUserSuccess extends AppState {}

final class ShowUserFailure extends AppState {
  final String error;
  ShowUserFailure({required this.error});
}

final class GetNotificationsLoading extends AppState {}

final class GetNotificationsSuccess extends AppState {}

final class GetNotificationsFailure extends AppState {
  final String error;
  GetNotificationsFailure({required this.error});
}

final class DeleteNotificationLoading extends AppState {}

final class DeleteNotificationSuccess extends AppState {}

final class DeleteNotificationFailure extends AppState {
  final String error;
  DeleteNotificationFailure({required this.error});
}

final class UploadImagesLoading extends AppState {}

final class UploadImagesSuccess extends AppState {}

final class UploadImagesFailure extends AppState {}

final class ChooseImageSuccess extends AppState {}

final class RemoveImageSuccess extends AppState {}

final class UpdateProfileLoading extends AppState {}

final class UpdateProfileSuccess extends AppState {
  final String message;
  UpdateProfileSuccess({required this.message});
}

final class UpdateProfileFailure extends AppState {
  final String error;
  UpdateProfileFailure({required this.error});
}

final class GetSectionsLoading extends AppState {}

final class GetSectionsSuccess extends AppState {
  final String message;
  GetSectionsSuccess({required this.message});
}

final class GetSectionsFailure extends AppState {
  final String error;
  GetSectionsFailure({required this.error});
}

final class AboutUsLoading extends AppState {}

final class AboutUsSuccess extends AppState {}

final class AboutUsFailure extends AppState {
  final String error;
  AboutUsFailure({required this.error});
}

final class ContactUsLoading extends AppState {}

final class ContactUsSuccess extends AppState {
  final String message;
  ContactUsSuccess({required this.message});
}

final class ContactUsFailure extends AppState {
  final String error;
  ContactUsFailure({required this.error});
}

final class GetSearchLoading extends AppState {}

final class GetSearchSuccess extends AppState {
  final String message;
  GetSearchSuccess({required this.message});
}

final class GetSearchFailure extends AppState {
  final String error;
  GetSearchFailure({required this.error});
}

final class GetRoomsLoading extends AppState {}

final class GetRoomsSuccess extends AppState {
  final String message;
  GetRoomsSuccess({required this.message});
}

final class GetRoomsFailure extends AppState {
  final String error;
  GetRoomsFailure({required this.error});
}

final class GetRoomChatLoading extends AppState {}

final class GetRoomChatSuccess extends AppState {
  final String message;
  GetRoomChatSuccess({required this.message});
}

final class GetRoomChatFailure extends AppState {
  final String error;
  GetRoomChatFailure({required this.error});
}

final class SendMessageLoading extends AppState {}

final class SendMessageSuccess extends AppState {
  final String message;
  SendMessageSuccess({required this.message});
}

final class SendMessageFailure extends AppState {
  final String error;
  SendMessageFailure({required this.error});
}

final class PrivacyPolicyLoading extends AppState {}

final class PrivacyPolicySuccess extends AppState {}

final class PrivacyPolicyFailure extends AppState {
  final String error;
  PrivacyPolicyFailure({required this.error});
}
