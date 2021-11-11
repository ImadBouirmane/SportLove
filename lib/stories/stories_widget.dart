import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoriesWidget extends StatefulWidget {
  StoriesWidget({Key key}) : super(key: key);

  @override
  _StoriesWidgetState createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                userStoriesRecord.orderBy('storyCreated'),
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
                return StreamBuilder<UsersRecord>(
                  stream:
                      UsersRecord.getDocument(gridViewUserStoriesRecord.user),
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
                    final containerUsersRecord = snapshot.data;
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: NavBarPage(initialPage: 'Profile'),
                          ),
                        );
                      },
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
  }
}