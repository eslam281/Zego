import 'package:coursezego/constant.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class Callservices{
  /// on App's user login
  Future<void> onUserLogin(String id, String name) async {

    await ZegoUIKitPrebuiltCallInvitationService().init(
      appID: Constant.appID /*input your AppID*/,
      appSign: Constant.appSing /*input your AppSign*/,
      userID: id,
      userName: name,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }

  /// on App's user logout
  void onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}