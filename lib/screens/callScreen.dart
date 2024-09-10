import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegesha_client/provider/auth.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PrebuiltCallPage extends StatefulWidget {
  final String callId;
  const PrebuiltCallPage({required this.callId});

  @override
  State<StatefulWidget> createState() => PrebuiltCallPageState();
}

class PrebuiltCallPageState extends State<PrebuiltCallPage> {
  String? id;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUniqueUserId().then((value) {
      setState(() {
        id = value;
        isLoading = false;
      });
    });
  }

  ZegoUIKitPrebuiltCallConfig config =
      ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..chatView = ZegoCallInRoomChatViewConfig(
          itemBuilder: (context, message, extraInfo) => Text(message.message),
        )
        ..turnOnCameraWhenJoining = true
        ..turnOnMicrophoneWhenJoining = true;

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<Auth>(context).userProfile;
    print(userProfile.id);
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: ZegoUIKitPrebuiltCall(
                appID: 1278021714,
                appSign:
                    "ccafe86f42e6de1f616ab905b351b02e0e7f69a896c0c299c3699f3ef741421c",
                userID: userProfile.email,
                userName: "${userProfile.firstName} ${userProfile.lastName}",
                callID: "${widget.callId}",
                config: config,
              ),
            ),
    );
  }
}

Future<String> getUniqueUserId() async {
  String? deviceID;
  final deviceInfo = DeviceInfoPlugin();
  try {
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      deviceID = iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      deviceID = androidDeviceInfo.id; // unique ID on Android
    }
  } catch (e) {
    print("Failed to get device ID: $e");
  }

  if (deviceID != null && deviceID.length < 4) {
    if (Platform.isAndroid) {
      deviceID += '_android';
    } else if (Platform.isIOS) {
      deviceID += '_ios___';
    }
  }
  if (Platform.isAndroid) {
    deviceID ??= 'flutter_user_id_android';
  } else if (Platform.isIOS) {
    deviceID ??= 'flutter_user_id_ios';
  }

  final userID = md5
      .convert(utf8.encode(deviceID!))
      .toString()
      .replaceAll(RegExp(r'[^0-9]'), '');
  return userID.substring(userID.length - 6);
}
