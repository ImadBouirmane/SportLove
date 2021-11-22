import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersProfileWidget extends StatefulWidget {
  UsersProfileWidget({
    Key key,
    this.userDetails,
  }) : super(key: key);

  final UsersRecord userDetails;

  @override
  _UsersProfileWidgetState createState() => _UsersProfileWidgetState();
}

class _UsersProfileWidgetState extends State<UsersProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userDetails.reference),
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
        final usersProfileUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            iconTheme: IconThemeData(color: FlutterFlowTheme.primaryColor),
            automaticallyImplyLeading: true,
            actions: [],
            centerTitle: false,
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
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.tertiaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      usersProfileUsersRecord.photoUrl,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              usersProfileUsersRecord
                                                  .displayName
                                                  .maybeHandleOverflow(
                                                      maxChars: 20),
                                              style: FlutterFlowTheme.subtitle1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 2, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                usersProfileUsersRecord
                                                    .phoneNumber,
                                                style: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              usersProfileUsersRecord.birthDate,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF303030),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                usersProfileUsersRecord.gender,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      usersProfileUsersRecord.address
                                          .maybeHandleOverflow(maxChars: 40),
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.sports_soccer,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              usersProfileUsersRecord
                                                  .sportType1,
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 0, 0, 0),
                                              child: Text(
                                                ':',
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3, 0, 0, 0),
                                              child: Text(
                                                usersProfileUsersRecord
                                                    .sportLevel1,
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              usersProfileUsersRecord
                                                  .sportType2,
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 0, 0, 0),
                                              child: Text(
                                                ':',
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3, 0, 0, 0),
                                              child: Text(
                                                usersProfileUsersRecord
                                                    .sportLevel2,
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              usersProfileUsersRecord
                                                  .sportType3,
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 0, 0, 0),
                                              child: Text(
                                                ':',
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3, 0, 0, 0),
                                              child: Text(
                                                usersProfileUsersRecord
                                                    .sportLevel3,
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
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
