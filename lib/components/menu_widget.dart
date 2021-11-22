import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({
    Key key,
    this.annonceParameters,
  }) : super(key: key);

  final AnnoncesRecord annonceParameters;

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
      child: StreamBuilder<AnnoncesRecord>(
        stream: AnnoncesRecord.getDocument(widget.annonceParameters.reference),
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
          final containerAnnoncesRecord = snapshot.data;
          return Material(
            color: Colors.transparent,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton1 = true);
                            try {
                              Navigator.pop(context);
                            } finally {
                              setState(() => _loadingButton1 = false);
                            }
                          },
                          text: 'Annuler',
                          options: FFButtonOptions(
                            width: 250,
                            height: 40,
                            color: FlutterFlowTheme.tertiaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            elevation: 5,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.primaryColor,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                          loading: _loadingButton1,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton2 = true);
                              try {
                                await Share.share('');
                              } finally {
                                setState(() => _loadingButton2 = false);
                              }
                            },
                            text: 'Partager',
                            options: FFButtonOptions(
                              width: 250,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 5,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.primaryColor,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                            loading: _loadingButton2,
                          )
                        ],
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
                              setState(() => _loadingButton3 = true);
                              try {
                                await widget.annonceParameters.reference
                                    .delete();
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: NavBarPage(initialPage: 'HomePage'),
                                  ),
                                );
                              } finally {
                                setState(() => _loadingButton3 = false);
                              }
                            },
                            text: 'Supprimer',
                            options: FFButtonOptions(
                              width: 250,
                              height: 40,
                              color: Color(0xFFC30F0F),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 5,
                              borderSide: BorderSide(
                                color: Color(0xFFC30F0F),
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                            loading: _loadingButton3,
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
      ),
    );
  }
}
