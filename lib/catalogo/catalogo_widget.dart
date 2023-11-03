import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'catalogo_model.dart';
export 'catalogo_model.dart';

class CatalogoWidget extends StatefulWidget {
  const CatalogoWidget({super.key});

  @override
  _CatalogoWidgetState createState() => _CatalogoWidgetState();
}

class _CatalogoWidgetState extends State<CatalogoWidget> {
  late CatalogoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatalogoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'Catalogo',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF9F3F3),
            body: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 16.0),
                    child: Image.asset(
                      'assets/images/Recurso_2.png',
                      width: double.infinity,
                      height: 80.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: double.infinity,
                          constraints: const BoxConstraints(
                            maxWidth: 400.0,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: StreamBuilder<List<ArtistasRecord>>(
                            stream: queryArtistasRecord(
                              queryBuilder: (artistasRecord) =>
                                  artistasRecord.orderBy('orden'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<ArtistasRecord>
                                  staggeredViewArtistasRecordList =
                                  snapshot.data!;
                              return MasonryGridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                itemCount:
                                    staggeredViewArtistasRecordList.length,
                                itemBuilder: (context, staggeredViewIndex) {
                                  final staggeredViewArtistasRecord =
                                      staggeredViewArtistasRecordList[
                                          staggeredViewIndex];
                                  return SizedBox(
                                    width: 140.0,
                                    height: 140.0,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.00, -1.00),
                                          child: Container(
                                            width: 130.0,
                                            height: 130.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'Pasarela',
                                                  queryParameters: {
                                                    'artista': serializeParam(
                                                      staggeredViewArtistasRecord
                                                          .artista,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Image.network(
                                                staggeredViewArtistasRecord
                                                    .preview,
                                                width: 129.0,
                                                height: 129.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.00, 1.00),
                                          child: Container(
                                            width: 100.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  staggeredViewArtistasRecord
                                                      .artista,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Mono',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 7.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: StreamBuilder<List<ArtistasRecord>>(
                            stream: queryArtistasRecord(
                              queryBuilder: (artistasRecord) =>
                                  artistasRecord.orderBy('orden'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<ArtistasRecord>
                                  staggeredViewArtistasRecordList =
                                  snapshot.data!;
                              return MasonryGridView.count(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                itemCount:
                                    staggeredViewArtistasRecordList.length,
                                itemBuilder: (context, staggeredViewIndex) {
                                  final staggeredViewArtistasRecord =
                                      staggeredViewArtistasRecordList[
                                          staggeredViewIndex];
                                  return SizedBox(
                                    width: 175.0,
                                    height: 175.0,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.00, -1.00),
                                          child: Container(
                                            width: 160.0,
                                            height: 160.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'Artes',
                                                  queryParameters: {
                                                    'artista': serializeParam(
                                                      staggeredViewArtistasRecord
                                                          .artista,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Image.network(
                                                staggeredViewArtistasRecord
                                                    .preview,
                                                width: 129.0,
                                                height: 129.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.00, 1.00),
                                          child: Container(
                                            width: 120.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  staggeredViewArtistasRecord
                                                      .artista,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Mono',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 10.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 1.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pop();
                        },
                        child: Container(
                          width: 220.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'BACK',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
