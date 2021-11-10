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
  SportLevelWidget({Key key}) : super(key: key);

  @override
  _SportLevelWidgetState createState() => _SportLevelWidgetState();
}

class _SportLevelWidgetState extends State<SportLevelWidget> {
  String sportLevel1Value;
  String sportLevel2Value;
  String sportLevel3Value;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserRecord>>(
      stream: queryUserRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        List<UserRecord> sportLevelUserRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final sportLevelUserRecord = sportLevelUserRecordList.isNotEmpty
            ? sportLevelUserRecordList.first
            : null;
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
                )
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
                      sportLevelUserRecord.sportType1,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF2E2C2C),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                  child: FlutterFlowChoiceChips(
                    initialOption: sportLevel1Value ??= 'Débutant ',
                    options: [
                      ChipData('Débutant '),
                      ChipData('Amateur'),
                      ChipData('Intermédiaire'),
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
                      sportLevelUserRecord.sportType2,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF2E2C2C),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                  child: FlutterFlowChoiceChips(
                    initialOption: sportLevel2Value ??= 'Débutant ',
                    options: [
                      ChipData('Débutant '),
                      ChipData('Amateur'),
                      ChipData('Intermédiaire'),
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
                      sportLevelUserRecord.sportType3,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF2E2C2C),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                  child: FlutterFlowChoiceChips(
                    initialOption: sportLevel3Value ??= 'Débutant ',
                    options: [
                      ChipData('Débutant '),
                      ChipData('Amateur'),
                      ChipData('Intermédiaire'),
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
                          setState(() => _loadingButton = true);
                          try {
                            final userCreateData = createUserRecordData(
                              sportLevel1: sportLevel1Value,
                              sportLevel2: sportLevel2Value,
                              sportLevel3: sportLevel3Value,
                            );
                            await UserRecord.collection
                                .doc()
                                .set(userCreateData);
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: NavBarPage(initialPage: 'HomePage'),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton = false);
                          }
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
                        loading: _loadingButton,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}