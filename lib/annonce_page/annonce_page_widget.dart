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
              width: 30,
              height: 30,
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
              'Details',
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                child: StreamBuilder<UsersRecord>(
                  stream:
                      UsersRecord.getDocument(annoncePageAnnoncesRecord.user),
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
                    final rowUsersRecord = snapshot.data;
                    return Row(
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
                            rowUsersRecord.photoUrl,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      rowUsersRecord.displayName,
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          dateTimeFormat('relative',
                              annoncePageAnnoncesRecord.timeCreated),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.primaryColor,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              Image.network(
                'https://picsum.photos/seed/803/600',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(
                  annoncePageAnnoncesRecord.titre
                      .maybeHandleOverflow(maxChars: 25),
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.primaryColor,
                  ),
                ),
                subtitle: Text(
                  annoncePageAnnoncesRecord.description
                      .maybeHandleOverflow(maxChars: 25),
                  style: FlutterFlowTheme.subtitle2,
                ),
                tileColor: Color(0xFFE7F0FC),
                dense: false,
              )
            ],
          ),
        );
      },
    );
  }
}
