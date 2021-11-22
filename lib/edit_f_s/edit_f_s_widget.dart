import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../profile/profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditFSWidget extends StatefulWidget {
  EditFSWidget({Key key}) : super(key: key);

  @override
  _EditFSWidgetState createState() => _EditFSWidgetState();
}

class _EditFSWidgetState extends State<EditFSWidget> {
  String section1Value;
  String section2Value;
  String section3Value;
  bool _loadingButton = false;
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
        final editFSUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            iconTheme: IconThemeData(color: FlutterFlowTheme.primaryColor),
            automaticallyImplyLeading: true,
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.volleyballBall,
                          color: FlutterFlowTheme.primaryColor,
                          size: 90,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 60),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Choisir vos sports préférés',
                          style: FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                    child: FlutterFlowChoiceChips(
                      initialOption: section1Value ??=
                          editFSUsersRecord.sportType1,
                      options: [
                        ChipData('Cyclisme'),
                        ChipData('Course à pied'),
                        ChipData('Tennis')
                      ],
                      onChanged: (val) => setState(() => section1Value = val),
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
                          color: Color(0xFF262D34),
                        ),
                        iconColor: Color(0xFF262D34),
                        iconSize: 18,
                        elevation: 4,
                      ),
                      chipSpacing: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                    child: FlutterFlowChoiceChips(
                      initialOption: section2Value ??=
                          editFSUsersRecord.sportType2,
                      options: [
                        ChipData('Randonné'),
                        ChipData('Golf'),
                        ChipData('Yoga')
                      ],
                      onChanged: (val) => setState(() => section2Value = val),
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
                          color: Color(0xFF262D34),
                        ),
                        iconColor: Color(0xFF262D34),
                        iconSize: 18,
                        elevation: 4,
                      ),
                      chipSpacing: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                    child: FlutterFlowChoiceChips(
                      initialOption: section3Value ??=
                          editFSUsersRecord.sportType3,
                      options: [
                        ChipData('Paddel'),
                        ChipData('Boot Camp'),
                        ChipData('Natation')
                      ],
                      onChanged: (val) => setState(() => section3Value = val),
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
                          color: Color(0xFF262D34),
                        ),
                        iconColor: Color(0xFF262D34),
                        iconSize: 18,
                        elevation: 4,
                      ),
                      chipSpacing: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton = true);
                            try {
                              final usersUpdateData = createUsersRecordData(
                                sportType1: section1Value,
                                sportType2: section2Value,
                                sportType3: section3Value,
                              );
                              await currentUserReference
                                  .update(usersUpdateData);
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: ProfileWidget(),
                                ),
                              );
                            } finally {
                              setState(() => _loadingButton = false);
                            }
                          },
                          text: 'Mettre à jour',
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
          ),
        );
      },
    );
  }
}
