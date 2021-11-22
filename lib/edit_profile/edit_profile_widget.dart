import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../profile/profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileWidget extends StatefulWidget {
  EditProfileWidget({Key key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  String genderValue;
  String uploadedFileUrl = '';
  bool _loadingButton1 = false;
  TextEditingController fullNameController;
  TextEditingController numberPhoneController;
  TextEditingController ageController;
  TextEditingController addressController;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    ageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final editProfileUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Modifier votre profile',
              style: FlutterFlowTheme.subtitle1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.tertiaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 4,
          ),
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        uploadedFileUrl,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton1 = true);
                          try {
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
                          } finally {
                            setState(() => _loadingButton1 = false);
                          }
                        },
                        text: 'Inserez votre photo',
                        options: FFButtonOptions(
                          width: 200,
                          height: 30,
                          color: FlutterFlowTheme.tertiaryColor,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                        loading: _loadingButton1,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 10),
                  child: TextFormField(
                    controller: fullNameController ??= TextEditingController(
                      text: editProfileUsersRecord.displayName,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Nom Complet',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.black,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.black,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: TextFormField(
                    controller: numberPhoneController ??= TextEditingController(
                      text: editProfileUsersRecord.phoneNumber,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Numéro de téléphone',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.black,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.black,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 30, 0),
                        child: Text(
                          'Sexe: ',
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: FlutterFlowRadioButton(
                          options: ['Masculin', 'Feminin'],
                          onChanged: (value) {
                            setState(() => genderValue = value);
                          },
                          optionHeight: 25,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.horizontal,
                          radioButtonColor: FlutterFlowTheme.primaryColor,
                          inactiveRadioButtonColor: FlutterFlowTheme.black,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: TextFormField(
                    controller: ageController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: editProfileUsersRecord.birthDate,
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.black,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.black,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: TextFormField(
                    controller: addressController ??= TextEditingController(
                      text: editProfileUsersRecord.address,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Adresse',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.black,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.black,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    keyboardType: TextInputType.streetAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton2 = true);
                          try {
                            final usersUpdateData = createUsersRecordData(
                              photoUrl: uploadedFileUrl,
                              phoneNumber: numberPhoneController?.text ?? '',
                              birthDate: ageController.text,
                              gender: genderValue,
                              address: addressController?.text ?? '',
                              userUpdate: getCurrentTimestamp,
                            );
                            await editProfileUsersRecord.reference
                                .update(usersUpdateData);
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                                reverseDuration: Duration(milliseconds: 0),
                                child: ProfileWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton2 = false);
                          }
                        },
                        text: 'Enregistrer',
                        options: FFButtonOptions(
                          width: 200,
                          height: 50,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.tertiaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 5,
                        ),
                        loading: _loadingButton2,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
