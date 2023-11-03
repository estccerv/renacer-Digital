import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'q_rresonar_model.dart';
export 'q_rresonar_model.dart';

class QRresonarWidget extends StatefulWidget {
  const QRresonarWidget({super.key});

  @override
  _QRresonarWidgetState createState() => _QRresonarWidgetState();
}

class _QRresonarWidgetState extends State<QRresonarWidget> {
  late QRresonarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QRresonarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.00, 0.00),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.pop(context);
        },
        child: Container(
          width: 500.0,
          height: 450.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Toca para cerrar',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto Mono',
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
                child: StreamBuilder<List<LandingRecord>>(
                  stream: queryLandingRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitRipple(
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<LandingRecord> imageLandingRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final imageLandingRecord = imageLandingRecordList.isNotEmpty
                        ? imageLandingRecordList.first
                        : null;
                    return CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 500),
                      fadeOutDuration: const Duration(milliseconds: 500),
                      imageUrl: valueOrDefault<String>(
                        imageLandingRecord?.resonar,
                        'https://firebasestorage.googleapis.com/v0/b/nftslatam-123.appspot.com/o/renacer%2FRECURSOS%20GRAFICOS%2FRESONAR.webp?alt=media&token=3f305145-c0f2-4c57-ad52-779d5cf13930',
                      ),
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  '1. Conéctate a la red de Wi-fi “HTTPSIS” o “HTTPSIS[5G]”\n2. Escanea el código QR para entrar a la app web.\n3. Acepta todos los permisos.\n4. Al tocar una vez la pantalla, ya estás dentro de la obra.\n5. Te invitamos a interactuar; todo lo que hagas afecta lo que ven y escuchan los demás dispositivos conectados.',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto Mono',
                        fontSize: 12.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
