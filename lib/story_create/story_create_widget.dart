import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryCreateWidget extends StatefulWidget {
  const StoryCreateWidget({Key key}) : super(key: key);

  @override
  _StoryCreateWidgetState createState() => _StoryCreateWidgetState();
}

class _StoryCreateWidgetState extends State<StoryCreateWidget> {
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Image.network(
            uploadedFileUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.clear,
                            color: FlutterFlowTheme.primaryColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.add_box,
                            color: FlutterFlowTheme.primaryColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                              textColor: FlutterFlowTheme.primaryColor,
                              pickerFontFamily: 'Poppins',
                            );
                            if (selectedMedia != null &&
                                validateFileFormat(
                                    selectedMedia.storagePath, context)) {
                              showUploadMessage(context, 'Uploading file...',
                                  showLoading: true);
                              final downloadUrl = await uploadData(
                                  selectedMedia.storagePath,
                                  selectedMedia.bytes);
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              if (downloadUrl != null) {
                                setState(() => uploadedFileUrl = downloadUrl);
                                showUploadMessage(context, 'Success!');
                              } else {
                                showUploadMessage(
                                    context, 'Failed to upload media');
                                return;
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1, 0),
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
                                final userStoriesCreateData =
                                    createUserStoriesRecordData(
                                  user: currentUserReference,
                                  storyPhoto: uploadedFileUrl,
                                  storyCreated: getCurrentTimestamp,
                                  storyOwner: true,
                                );
                                await UserStoriesRecord.collection
                                    .doc()
                                    .set(userStoriesCreateData);
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: NavBarPage(initialPage: 'HomePage'),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
