import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../story_page/story_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoriesWidget extends StatefulWidget {
  StoriesWidget({
    Key key,
    this.storyReference,
    this.userStory,
  }) : super(key: key);

  final DocumentReference storyReference;
  final UsersRecord userStory;

  @override
  _StoriesWidgetState createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        final storiesUserStoriesRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Stories',
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
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
            child: StreamBuilder<List<UserStoriesRecord>>(
              stream: queryUserStoriesRecord(
                queryBuilder: (userStoriesRecord) =>
                    userStoriesRecord.orderBy('storyCreated', descending: true),
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
                List<UserStoriesRecord> gridViewUserStoriesRecordList =
                    snapshot.data;
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: gridViewUserStoriesRecordList.length,
                  itemBuilder: (context, gridViewIndex) {
                    final gridViewUserStoriesRecord =
                        gridViewUserStoriesRecordList[gridViewIndex];
                    return StreamBuilder<UserStoriesRecord>(
                      stream: UserStoriesRecord.getDocument(
                          storiesUserStoriesRecord.reference),
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
                        final containerUserStoriesRecord = snapshot.data;
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                                reverseDuration: Duration(milliseconds: 0),
                                child: StoryPageWidget(
                                  storyReference:
                                      containerUserStoriesRecord.reference,
                                ),
                              ),
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.tertiaryColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  containerUserStoriesRecord.storyPhoto,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
