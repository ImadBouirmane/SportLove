import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../search_maps/search_maps_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class NouveauAnnonceWidget extends StatefulWidget {
  NouveauAnnonceWidget({Key key}) : super(key: key);

  @override
  _NouveauAnnonceWidgetState createState() => _NouveauAnnonceWidgetState();
}

class _NouveauAnnonceWidgetState extends State<NouveauAnnonceWidget> {
  DateTime datePicked1;
  String sportTypeValue;
  TextEditingController descriptionController;
  TextEditingController titleController;
  TextEditingController lieuController;
  DateTime datePicked2;
  String hoursValue;
  TextEditingController nbrParticipantsController;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    titleController = TextEditingController();
    lieuController = TextEditingController();
    nbrParticipantsController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Créer une annonce',
          style: FlutterFlowTheme.subtitle1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: TextFormField(
                  controller: titleController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Titre',
                    hintStyle: FlutterFlowTheme.subtitle2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  ),
                  style: FlutterFlowTheme.subtitle2,
                ),
              ),
              Divider(
                thickness: 1,
                indent: 10,
                color: Color(0xFFC3C2C2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: TextFormField(
                  controller: descriptionController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: FlutterFlowTheme.subtitle2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                  ),
                  style: FlutterFlowTheme.subtitle2,
                  maxLines: 3,
                ),
              ),
              Divider(
                thickness: 1,
                indent: 10,
                color: Color(0xFFC3C2C2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Type de sport',
                        style: FlutterFlowTheme.subtitle2,
                      ),
                    ),
                    FlutterFlowDropDown(
                      options: [
                        'Cyclisme',
                        'Course à pied',
                        'Tennis',
                        'Randonné',
                        'Golf',
                        'Yoga',
                        'Paddel',
                        'Boot Camp',
                        'Natation'
                      ].toList(),
                      onChanged: (val) => setState(() => sportTypeValue = val),
                      width: 130,
                      height: 40,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                      hidesUnderline: true,
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 10,
                color: Color(0xFFC3C2C2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                        child: TextFormField(
                          controller: lieuController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Lieu',
                            hintStyle: FlutterFlowTheme.subtitle2,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          ),
                          style: FlutterFlowTheme.subtitle2,
                          keyboardType: TextInputType.streetAddress,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                              reverseDuration: Duration(milliseconds: 0),
                              child: SearchMapsWidget(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.location_pin,
                          color: FlutterFlowTheme.primaryColor,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 10,
                color: Color(0xFFC3C2C2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat('d/M/y', datePicked1),
                          'Date',
                        ),
                        style: FlutterFlowTheme.subtitle2,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.calendar_today,
                        color: FlutterFlowTheme.primaryColor,
                        size: 25,
                      ),
                      onPressed: () async {
                        await DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (date) {
                            setState(() => datePicked1 = date);
                          },
                          currentTime: getCurrentTimestamp,
                        );
                      },
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 10,
                color: Color(0xFFC3C2C2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat('Hm', datePicked2),
                          'Heure',
                        ),
                        style: FlutterFlowTheme.subtitle2,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.access_time_outlined,
                        color: FlutterFlowTheme.primaryColor,
                        size: 25,
                      ),
                      onPressed: () async {
                        await DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (date) {
                            setState(() => datePicked2 = date);
                          },
                          currentTime: getCurrentTimestamp,
                        );
                      },
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 10,
                color: Color(0xFFC3C2C2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Durée',
                        style: FlutterFlowTheme.subtitle2,
                      ),
                    ),
                    FlutterFlowDropDown(
                      options: [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9',
                        '10'
                      ].toList(),
                      onChanged: (val) => setState(() => hoursValue = val),
                      width: 80,
                      height: 40,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                      hidesUnderline: true,
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 10,
                color: Color(0xFFC3C2C2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: TextFormField(
                  controller: nbrParticipantsController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Nombre des participants',
                    hintStyle: FlutterFlowTheme.subtitle2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                  ),
                  style: FlutterFlowTheme.subtitle2,
                  maxLines: 3,
                ),
              ),
              Divider(
                thickness: 1,
                indent: 10,
                color: Color(0xFFC3C2C2),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton = true);
                        try {
                          final annoncesCreateData = createAnnoncesRecordData(
                            titre: titleController.text,
                            description: descriptionController.text,
                            typeSport: sportTypeValue,
                            date: datePicked1,
                            heure: datePicked2,
                            duree: hoursValue,
                            nbrParticipants: nbrParticipantsController.text,
                            timeCreated: getCurrentTimestamp,
                            user: currentUserReference,
                            lieu: lieuController.text,
                          );
                          await AnnoncesRecord.collection
                              .doc()
                              .set(annoncesCreateData);
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
                          setState(() => _loadingButton = false);
                        }
                      },
                      text: 'Créer',
                      options: FFButtonOptions(
                        width: 300,
                        height: 50,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 5,
                      ),
                      loading: _loadingButton,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
