import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Text(
                        'Mindfulness Breathing',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Merriweather',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w900,
                                ),
                      ),
                    ),
                    Text(
                      '4',
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Work Sans',
                                color: colorFromCssString(
                                  random_data.randomInteger(0, 10).toString(),
                                  defaultColor: Color(0xFF10B00C),
                                ),
                                fontSize: 100,
                                letterSpacing: 0,
                              ),
                    ),
                    Container(
                      width: 206,
                      height: 152,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Inhale...',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Merriweather',
                                        color: colorFromCssString(
                                          'Inhale...',
                                          defaultColor: Color(0xFF1CA90C),
                                        ),
                                        fontSize: 20,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/playbutton.png',
                              width: 69,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '5',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Antic Slab',
                                      color: Color(0xFF6D7479),
                                      fontSize: 22,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              Text(
                                ' mins',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Merriweather',
                                      color: Color(0xFF5D6A74),
                                      fontSize: 16,
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                '  04',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Zilla Slab',
                                      color: Color(0xFF73787D),
                                      fontSize: 22,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                ' secs',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Merriweather',
                                      color: Color(0xFF697177),
                                      fontSize: 16,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Divider(
                        thickness: 1,
                        color: Color(0xCCE2DCDC),
                      ),
                    ),
                    Transform.rotate(
                      angle: 270 * (math.pi / 180),
                    ),
                  ].addToStart(SizedBox(height: 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
