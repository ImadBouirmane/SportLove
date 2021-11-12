import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../input_profile/input_profile_widget.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>
    with TickerProviderStateMixin {
  TextEditingController emailAddressController;
  TextEditingController pwdController;
  bool pwdVisibility;
  TextEditingController pwdConfirmationController;
  bool pwdConfirmationVisibility;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, -48),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    emailAddressController = TextEditingController();
    pwdController = TextEditingController();
    pwdVisibility = false;
    pwdConfirmationController = TextEditingController();
    pwdConfirmationVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
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
        List<UsersRecord> signUpUsersRecordList = snapshot.data;
        final signUpUsersRecord = signUpUsersRecordList.isNotEmpty
            ? signUpUsersRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.tertiaryColor,
              iconTheme: IconThemeData(color: FlutterFlowTheme.primaryColor),
              automaticallyImplyLeading: true,
              actions: [],
              elevation: 0,
            ),
          ),
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.tertiaryColor,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/sportlove_logo_v2.png',
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30, 10, 30, 0),
                                child: TextFormField(
                                  controller: emailAddressController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Votre Email',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30, 10, 30, 0),
                                child: TextFormField(
                                  controller: pwdController,
                                  obscureText: !pwdVisibility,
                                  decoration: InputDecoration(
                                    hintText: 'Mot De Pass',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock_outlined,
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => pwdVisibility = !pwdVisibility,
                                      ),
                                      child: Icon(
                                        pwdVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: FlutterFlowTheme.tertiaryColor,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30, 10, 30, 0),
                                child: TextFormField(
                                  controller: pwdConfirmationController,
                                  obscureText: !pwdConfirmationVisibility,
                                  decoration: InputDecoration(
                                    hintText: 'Confirmer Le Mot De Pass',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock_outlined,
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => pwdConfirmationVisibility =
                                            !pwdConfirmationVisibility,
                                      ),
                                      child: Icon(
                                        pwdConfirmationVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: FlutterFlowTheme.tertiaryColor,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30, 10, 30, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        'En continuant vous acceptez notre Termes, \n Conditions et Politiques de Confidentialite',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.tertiaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => _loadingButton = true);
                                        try {
                                          if (pwdController.text !=
                                              pwdConfirmationController.text) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Passwords don't match!",
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          final user =
                                              await createAccountWithEmail(
                                            context,
                                            emailAddressController.text,
                                            pwdController.text,
                                          );
                                          if (user == null) {
                                            return;
                                          }

                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: InputProfileWidget(),
                                            ),
                                          );
                                        } finally {
                                          setState(
                                              () => _loadingButton = false);
                                        }
                                      },
                                      text: 'Inscription',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 50,
                                        color: FlutterFlowTheme.primaryColor,
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                        elevation: 5,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.tertiaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: 5,
                                      ),
                                      loading: _loadingButton,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Avez-vous un compte?',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.tertiaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .bottomToTop,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: LoginWidget(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Connexion',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ).animated(
                          [animationsMap['containerOnPageLoadAnimation']]),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
