import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SportLevelWidget extends StatefulWidget {
  const SportLevelWidget({Key key}) : super(key: key);

  @override
  _SportLevelWidgetState createState() => _SportLevelWidgetState();
}

class _SportLevelWidgetState extends State<SportLevelWidget> {
  String sportLevel1Value;
  String sportLevel2Value;
  String sportLevel3Value;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final sportLevelUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            iconTheme: IconThemeData(color: FlutterFlowTheme.primaryColor),
            automaticallyImplyLeading: true,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: FaIcon(
                    FontAwesomeIcons.laravel,
                    color: FlutterFlowTheme.primaryColor,
                    size: 30,
                  ),
                ),
                Text(
                  'Selectionner votre niveau',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      sportLevelUsersRecord.sportType1,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF2E2C2C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                  child: FlutterFlowChoiceChips(
                    initialOption: sportLevel1Value ??= 'D??butant ',
                    options: [
                      ChipData('D??butant '),
                      ChipData('Amateur'),
                      ChipData('Interm??diaire'),
                      ChipData('Professionnel')
                    ],
                    onChanged: (val) => setState(() => sportLevel1Value = val),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      iconColor: Colors.white,
                      iconSize: 18,
                      elevation: 4,
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Colors.white,
                      textStyle: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryColor,
                      ),
                      iconColor: FlutterFlowTheme.primaryColor,
                      iconSize: 18,
                      elevation: 4,
                    ),
                    chipSpacing: 20,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      sportLevelUsersRecord.sportType2,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF2E2C2C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                  child: FlutterFlowChoiceChips(
                    initialOption: sportLevel2Value ??= 'D??butant ',
                    options: [
                      ChipData('D??butant '),
                      ChipData('Amateur'),
                      ChipData('Interm??diaire'),
                      ChipData('Professionnel')
                    ],
                    onChanged: (val) => setState(() => sportLevel2Value = val),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      iconColor: Colors.white,
                      iconSize: 18,
                      elevation: 4,
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Colors.white,
                      textStyle: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryColor,
                      ),
                      iconColor: FlutterFlowTheme.primaryColor,
                      iconSize: 18,
                      elevation: 4,
                    ),
                    chipSpacing: 20,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      sportLevelUsersRecord.sportType3,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF2E2C2C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                  child: FlutterFlowChoiceChips(
                    initialOption: sportLevel3Value ??= 'D??butant ',
                    options: [
                      ChipData('D??butant '),
                      ChipData('Amateur'),
                      ChipData('Interm??diaire'),
                      ChipData('Professionnel')
                    ],
                    onChanged: (val) => setState(() => sportLevel3Value = val),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      iconColor: Colors.white,
                      iconSize: 18,
                      elevation: 4,
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Colors.white,
                      textStyle: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryColor,
                      ),
                      iconColor: FlutterFlowTheme.primaryColor,
                      iconSize: 18,
                      elevation: 4,
                    ),
                    chipSpacing: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final usersUpdateData = createUsersRecordData(
                            sportLevel1: sportLevel1Value,
                            sportLevel2: sportLevel2Value,
                            sportLevel3: sportLevel3Value,
                          );
                          await currentUserReference.update(usersUpdateData);
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: NavBarPage(initialPage: 'HomePage'),
                            ),
                          );
                        },
                        text: 'Continuer',
                        options: FFButtonOptions(
                          width: 300,
                          height: 50,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
