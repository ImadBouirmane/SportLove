import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnoncePageWidget extends StatefulWidget {
  AnnoncePageWidget({Key key}) : super(key: key);

  @override
  _AnnoncePageWidgetState createState() => _AnnoncePageWidgetState();
}

class _AnnoncePageWidgetState extends State<AnnoncePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AnnoncesRecord>>(
      stream: queryAnnoncesRecord(
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
        List<AnnoncesRecord> annoncePageAnnoncesRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final annoncePageAnnoncesRecord =
            annoncePageAnnoncesRecordList.isNotEmpty
                ? annoncePageAnnoncesRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Annonce',
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
          body: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(annoncePageAnnoncesRecord.user),
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
              final columnUsersRecord = snapshot.data;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            columnUsersRecord.photoUrl,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    annoncePageAnnoncesRecord.titre,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    annoncePageAnnoncesRecord.typeSport,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Text(
                              dateTimeFormat('relative',
                                  annoncePageAnnoncesRecord.timeCreated),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 40, 30, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  dateTimeFormat(
                                      'Hm', annoncePageAnnoncesRecord.heure),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  '-',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  dateTimeFormat(
                                      'd/M/y', annoncePageAnnoncesRecord.date),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.black,
                              size: 24,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                annoncePageAnnoncesRecord.lieu
                                    .maybeHandleOverflow(maxChars: 40),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 60, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Partticipants',
                          style: FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                        child: Text(
                          annoncePageAnnoncesRecord.nbrParticipants,
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
