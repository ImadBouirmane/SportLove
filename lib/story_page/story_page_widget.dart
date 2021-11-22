import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryPageWidget extends StatefulWidget {
  StoryPageWidget({
    Key key,
    this.storyReference,
    this.userStory,
  }) : super(key: key);

  final DocumentReference storyReference;
  final UsersRecord userStory;

  @override
  _StoryPageWidgetState createState() => _StoryPageWidgetState();
}

class _StoryPageWidgetState extends State<StoryPageWidget> {
  TextEditingController commentController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserStoriesRecord>(
      stream: UserStoriesRecord.getDocument(widget.storyReference),
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
        final storyPageUserStoriesRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          body: Stack(
            children: [
              Image.network(
                storyPageUserStoriesRecord.storyPhoto,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                child: StreamBuilder<UsersRecord>(
                  stream:
                      UsersRecord.getDocument(storyPageUserStoriesRecord.user),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              columnUsersRecord.displayName
                                  .maybeHandleOverflow(maxChars: 15),
                              style: FlutterFlowTheme.subtitle1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.tertiaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: commentController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Ecrire...',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.send,
                                    color: FlutterFlowTheme.primaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    final storyCommentCreateData =
                                        createStoryCommentRecordData(
                                      user: currentUserReference,
                                      storyUser:
                                          storyPageUserStoriesRecord.reference,
                                      comment: commentController.text,
                                      timeCreated: getCurrentTimestamp,
                                    );
                                    await StoryCommentRecord.collection
                                        .doc()
                                        .set(storyCommentCreateData);
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                        reverseDuration:
                                            Duration(milliseconds: 0),
                                        child:
                                            NavBarPage(initialPage: 'HomePage'),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
