import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../sport_level/sport_level_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteSportsWidget extends StatefulWidget {
  const FavoriteSportsWidget({Key key}) : super(key: key);

  @override
  _FavoriteSportsWidgetState createState() => _FavoriteSportsWidgetState();
}

class _FavoriteSportsWidgetState extends State<FavoriteSportsWidget> {
  String section1Value;
  String section2Value;
  String section3Value;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                    ),
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
                      'Choisir vos sports pr??f??r??s',
                      style: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                child: FlutterFlowChoiceChips(
                  initialOption: section1Value ??= 'Cyclisme',
                  options: [
                    ChipData('Cyclisme'),
                    ChipData('Course ?? pied'),
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
                  initialOption: section2Value ??= 'Randonn??',
                  options: [
                    ChipData('Randonn??'),
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
                  initialOption: section3Value ??= 'Paddel',
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
                        final usersUpdateData = createUsersRecordData(
                          sportType1: section1Value,
                          sportType2: section2Value,
                          sportType3: section3Value,
                        );
                        await currentUserReference.update(usersUpdateData);
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: SportLevelWidget(),
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
      ),
    );
  }
}
