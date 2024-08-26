import 'package:dynamic_languages/dynamic_languages.dart';

import '../../model/common/common_success_model.dart';
import '../../model/dashboard/dashboard_model.dart';
import '../../model/dashboard/gallery_model.dart';
import '../../model/dashboard/live_show_model.dart';
import '../../model/dashboard/notification_model.dart';
import '../../model/dashboard/profile_info_model.dart';
import '../../model/dashboard/show_schedule_model.dart';
import '../../model/dashboard/team_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../../utils/logger.dart';
import '../api_endpoint.dart';

final log = logger(DashboardService);

mixin DashboardService {
  ///* Get Notification api services
  Future<NotificationModel?> notificationProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.notificationURL}?lang=${DynamicLanguage.selectedLanguage.value}",
      );
      if (mapResponse != null) {
        NotificationModel result = NotificationModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(
          ':ladybug::ladybug::ladybug: err from Notification api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Get ProfileInfo api services
  Future<ProfileInfoModel?> profileInfoProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.profileInfoURL}?lang=${DynamicLanguage.selectedLanguage.value}",
      );
      if (mapResponse != null) {
        ProfileInfoModel result = ProfileInfoModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(
          ':ladybug::ladybug::ladybug: err from ProfileInfo api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* ProfileUpdate api services
  Future<CommonSuccessModel?> profileUpdateProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.profileUpdateURL}?lang=${DynamicLanguage.selectedLanguage.value}",
        body,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(
          ':ladybug::ladybug::ladybug: err from ProfileUpdate api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* ProfileDelete api services
  Future<CommonSuccessModel?> profileDeleteProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.profileDeleteURL,
        body,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from ProfileDelete api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* ProfileUpdate api services With Image
  Future<CommonSuccessModel?> profileUpdateProcessApiWithImage({
    required Map<String, String> body,
    required String filePath,
    required String fileName,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .multipart("${ApiEndpoint.profileUpdateURL}?lang=${DynamicLanguage.selectedLanguage.value}", body, filePath, fileName);
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(
          ':ladybug::ladybug::ladybug: err from ProfileUpdate api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///* PasswordChange api services
  Future<CommonSuccessModel?> passwordChangeProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        "${ApiEndpoint.passwordChangeURL}?lang=${DynamicLanguage.selectedLanguage.value}",
        body,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from PasswordChange api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///---------------------------------------------------- Others

  ///* Get Newsfeed api services
  Future<NewsfeedModel?> newsfeedProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.newsfeedURL}?lang=${DynamicLanguage.selectedLanguage.value}",
      );
      if (mapResponse != null) {
        NewsfeedModel result = NewsfeedModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from Dashboard api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Get LiveShow api services

  Future<LiveShowModel?> liveShowProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.liveShowURL}?lang=${DynamicLanguage.selectedLanguage.value}",
      );
      if (mapResponse != null) {
        LiveShowModel result = LiveShowModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from LiveShow api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Get Gallery api services
  Future<GalleryModel?> galleryProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.galleryURL}?lang=${DynamicLanguage.selectedLanguage.value}",
      );
      if (mapResponse != null) {
        GalleryModel result = GalleryModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from Gallery api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Get Team api services
  Future<TeamModel?> teamProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.teamURL}?lang=${DynamicLanguage.selectedLanguage.value}",
      );
      if (mapResponse != null) {
        TeamModel result = TeamModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from Team api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Get ShowSchedule api services
  Future<ShowScheduleModel?> showScheduleProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.showSchedulesURL}?lang=${DynamicLanguage.selectedLanguage.value}",
      );
      if (mapResponse != null) {
        ShowScheduleModel result = ShowScheduleModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(':ladybug::ladybug::ladybug: err from ShowSchedule api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

}