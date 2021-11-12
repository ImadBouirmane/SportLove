import '../all_chats_page/all_chats_page_widget.dart';
import '../annonces/annonces_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login/login_widget.dart';
import '../profile/profile_widget.dart';
import '../settings/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountWidget extends StatefulWidget {
  AccountWidget({Key key}) : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  double ratingBarValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        List<UsersRecord> accountUsersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final accountUsersRecord = accountUsersRecordList.isNotEmpty
            ? accountUsersRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Compte',
              style: FlutterFlowTheme.subtitle1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.tertiaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: ProfileWidget(),
                          ),
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFFC3C2C2),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    accountUsersRecord.photoUrl,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                accountUsersRecord.displayName,
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            RatingBar.builder(
                                              onRatingUpdate: (newValue) =>
                                                  setState(() =>
                                                      ratingBarValue =
                                                          newValue),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star_rounded,
                                                color: FlutterFlowTheme
                                                    .secondaryColor,
                                              ),
                                              direction: Axis.horizontal,
                                              initialRating: ratingBarValue ??=
                                                  3,
                                              unratedColor: Color(0xFF9E9E9E),
                                              itemCount: 5,
                                              itemSize: 20,
                                              glowColor: FlutterFlowTheme
                                                  .secondaryColor,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: AnnoncesWidget(),
                          ),
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFFC3C2C2),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.ad_units,
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    'Mes annonces',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.black,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: AllChatsPageWidget(),
                          ),
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFFC3C2C2),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.message,
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    'Messages',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.black,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFFC3C2C2),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.rate_review_outlined,
                                color: FlutterFlowTheme.primaryColor,
                                size: 25,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Expanded(
                              child: Text(
                                'Notes et Avis',
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.black,
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.chevron_right,
                                color: FlutterFlowTheme.primaryColor,
                                size: 25,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: SettingsWidget(),
                          ),
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFFC3C2C2),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.settings,
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    'Paramètres',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.black,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 10),
                    child: InkWell(
                      onTap: () async {
                        await signOut();
                        await Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: LoginWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFFC3C2C2),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.logout,
                                    color: Color(0xFFC30F0F),
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    'Déconnexion',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
