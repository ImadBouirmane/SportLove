import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPageWidget extends StatefulWidget {
  ChatPageWidget({
    Key key,
    this.chatUser,
  }) : super(key: key);

  final UsersRecord chatUser;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessagesRecord>>(
      stream: queryChatMessagesRecord(
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
        List<ChatMessagesRecord> chatPageChatMessagesRecordList = snapshot.data;
        final chatPageChatMessagesRecord =
            chatPageChatMessagesRecordList.isNotEmpty
                ? chatPageChatMessagesRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_sharp,
                color: FlutterFlowTheme.primaryColor,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              widget.chatUser.displayName,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          body: FutureBuilder<FFChatInfo>(
            future: FFChatManager.instance.getChatInfo(
              currentUserReference,
              widget.chatUser.reference,
              ChatUser(
                uid: widget.chatUser.reference.id,
                name: widget.chatUser.displayName,
                avatar: widget.chatUser.photoUrl,
              ),
            ),
            builder: (context, snapshot) => snapshot.hasData
                ? FFChatPage(
                    chatInfo: snapshot.data,
                    allowImages: true,
                    backgroundColor: FlutterFlowTheme.tertiaryColor,
                    timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                    currentUserBoxDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    otherUserBoxDecoration: BoxDecoration(
                      color: FlutterFlowTheme.primaryColor,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    currentUserTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Color(0xFF1E2429),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                    ),
                    otherUserTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    inputHintTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Color(0xFF95A1AC),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    inputTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  )
                : const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
