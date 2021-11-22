import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  DateTime datePicked;
  String sportTypeValue;
  TextEditingController textController;
  double sliderValue;
  List<AnnoncesRecord> algoliaSearchResults = [];
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Recherche',
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Type de sport',
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateTimeFormat('M/d H:m', datePicked),
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
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
                      await DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() => datePicked = date);
                        },
                        currentTime: datePicked,
                        minTime: datePicked,
                      );
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Tapez votre addresse',
                        hintStyle: FlutterFlowTheme.bodyText1,
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
                      ),
                      style: FlutterFlowTheme.bodyText1,
                      maxLines: 3,
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.location_pin,
                      color: FlutterFlowTheme.primaryColor,
                      size: 25,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Distance',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Slider(
                activeColor: FlutterFlowTheme.primaryColor,
                inactiveColor: Color(0xFFA9C8F4),
                min: 0,
                max: 10,
                value: sliderValue ??= 0,
                onChanged: (newValue) {
                  setState(() => sliderValue = newValue);
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 30, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '0 - 30 KM',
                    style: FlutterFlowTheme.bodyText1,
                  )
                ],
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
                      setState(() => _loadingButton = true);
                      try {
                        setState(() => algoliaSearchResults = null);
                        await AnnoncesRecord.search(
                          term: dateTimeFormat('relative', datePicked),
                        )
                            .then((r) => algoliaSearchResults = r)
                            .onError((_, __) => algoliaSearchResults = [])
                            .whenComplete(() => setState(() {}));
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: NavBarPage(initialPage: 'Search'),
                          ),
                        );
                      } finally {
                        setState(() => _loadingButton = false);
                      }
                    },
                    text: 'Trouver',
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
    );
  }
}
