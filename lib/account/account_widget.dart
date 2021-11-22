import '../annonces/annonces_widget.dart';
import '../auth/auth_util.dart';
import '../avis/avis_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../friends/friends_widget.dart';
import '../login/login_widget.dart';
import '../main.dart';
import '../profile/profile_widget.dart';
import '../user_annonces/user_annonces_widget.dart';
import '../user_avis/user_avis_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountWidget extends StatefulWidget {
  AccountWidget({Key key}) : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AuthUserStreamWidget(
                              child: Container(
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  currentUserPhoto,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          AuthUserStreamWidget(
                                            child: Text(
                                              currentUserDisplayName
                                                  .maybeHandleOverflow(
                                                maxChars: 30,
                                                replacement: '…',
                                              ),
                                              style: FlutterFlowTheme.subtitle1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: ProfileWidget(),
                                  ),
                                );
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
                        child: UserAnnoncesWidget(),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Icon(
                                Icons.ad_units_outlined,
                                color: FlutterFlowTheme.primaryColor,
                                size: 24,
                              ),
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
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: AnnoncesWidget(),
                                  ),
                                );
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
                        child: FriendsWidget(),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: FaIcon(
                                FontAwesomeIcons.userFriends,
                                color: FlutterFlowTheme.primaryColor,
                                size: 24,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Amis',
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
                        child: NavBarPage(initialPage: 'AllChatsPage'),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Icon(
                                Icons.message,
                                color: FlutterFlowTheme.primaryColor,
                                size: 24,
                              ),
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
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child:
                                        NavBarPage(initialPage: 'AllChatsPage'),
                                  ),
                                );
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
                        child: UserAvisWidget(),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Icon(
                                Icons.speaker_notes,
                                color: FlutterFlowTheme.primaryColor,
                                size: 24,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Notes & Avis',
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
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: AvisWidget(),
                                  ),
                                );
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Icon(
                                Icons.logout,
                                color: Color(0xFFC30F0F),
                                size: 24,
                              ),
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
  }
}
