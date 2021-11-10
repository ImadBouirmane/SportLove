import 'dart:async';
import 'dart:convert';

import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../login/login_widget.dart';
import '../../sign_up/sign_up_widget.dart';
import '../../input_profile/input_profile_widget.dart';
import '../../favorite_sports/favorite_sports_widget.dart';
import '../../sport_level/sport_level_widget.dart';
import '../../search/search_widget.dart';
import '../../list_amies/list_amies_widget.dart';
import '../../new_post/new_post_widget.dart';
import '../../annonces/annonces_widget.dart';
import '../../annonce_page/annonce_page_widget.dart';
import '../../list_annonces/list_annonces_widget.dart';
import '../../chat_page/chat_page_widget.dart';
import '../../profile/profile_widget.dart';
import '../../settings/settings_widget.dart';
import '../../phone_o_t_p/phone_o_t_p_widget.dart';
import '../../password_reset/password_reset_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.primaryColor,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Login': (data) async => LoginWidget(),
  'SignUp': (data) async => SignUpWidget(),
  'inputProfile': (data) async => InputProfileWidget(),
  'FavoriteSports': (data) async => FavoriteSportsWidget(),
  'SportLevel': (data) async => SportLevelWidget(),
  'Search': (data) async => SearchWidget(),
  'listAmies': (data) async => ListAmiesWidget(),
  'NewPost': (data) async => NewPostWidget(),
  'Annonces': (data) async => AnnoncesWidget(),
  'AnnoncePage': (data) async => AnnoncePageWidget(),
  'listAnnonces': (data) async => ListAnnoncesWidget(),
  'ChatPage': (data) async => ChatPageWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
      ),
  'AllChatsPage': (data) async => NavBarPage(initialPage: 'AllChatsPageWidget'),
  'Account': (data) async => NavBarPage(initialPage: 'AccountWidget'),
  'Profile': (data) async => ProfileWidget(),
  'Settings': (data) async => SettingsWidget(),
  'PhoneOTP': (data) async => PhoneOTPWidget(),
  'PasswordReset': (data) async => PasswordResetWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return json.decode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

T getParameter<T>(Map<String, dynamic> data, String paramName) {
  try {
    if (!data.containsKey(paramName)) {
      return null;
    }
    final param = data[paramName];
    switch (T) {
      case String:
        return param;
      case double:
        return param.toDouble();
      case DateTime:
        return DateTime.fromMillisecondsSinceEpoch(param) as T;
      case LatLng:
        return latLngFromString(param) as T;
    }
    if (param is String) {
      return FirebaseFirestore.instance.doc(param) as T;
    }
    return param;
  } catch (e) {
    print('Error parsing parameter "$paramName": $e');
    return null;
  }
}

Future<T> getDocumentParameter<T>(
    Map<String, dynamic> data, String paramName, Serializer<T> serializer) {
  if (!data.containsKey(paramName)) {
    return null;
  }
  return FirebaseFirestore.instance
      .doc(data[paramName])
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));
}

final latRegex = RegExp(
    r'^(+|-)?(?:90(?:(?:.0{1,7})?)|(?:[0-9]|[1-8][0-9])(?:(?:.[0-9]{1,7})?))$');
final lngRegex = RegExp(
    r'^(+|-)?(?:180(?:(?:.0{1,7})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:.[0-9]{1,7})?))$');

LatLng latLngFromString(String latLngStr) {
  final pieces = latLngStr.split(',');
  if (pieces.length != 2) {
    return null;
  }
  final lat = pieces[0].trim();
  final lng = pieces[1].trim();
  if (!latRegex.hasMatch(lat)) {
    return null;
  }
  if (!lngRegex.hasMatch(lng)) {
    return null;
  }
  return LatLng(double.parse(lat), double.parse(lng));
}
