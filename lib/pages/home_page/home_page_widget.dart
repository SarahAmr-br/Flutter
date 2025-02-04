import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (PaymentKeyCall.paymentToken(
                        (_model.paymengtKey?.jsonBody ?? ''),
                      ) !=
                      null &&
                  PaymentKeyCall.paymentToken(
                        (_model.paymengtKey?.jsonBody ?? ''),
                      ) !=
                      '')
                FlutterFlowWebView(
                  content:
                      'https://accept.paymob.com/api/acceptance/iframes/112063?payment_token=${PaymentKeyCall.paymentToken(
                    (_model.paymengtKey?.jsonBody ?? ''),
                  )}',
                  bypass: false,
                  height: 356.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              FFButtonWidget(
                onPressed: () async {
                  _model.authenticatioToken = await AuthenticationCall.call();

                  _model.orderID = await OrderIDCall.call(
                    token: AuthenticationCall.authenticationToken(
                      (_model.authenticatioToken?.jsonBody ?? ''),
                    ),
                    amount: '10000',
                  );

                  _model.paymengtKey = await PaymentKeyCall.call(
                    token: AuthenticationCall.authenticationToken(
                      (_model.authenticatioToken?.jsonBody ?? ''),
                    ),
                    orderID: OrderIDCall.orderID(
                      (_model.orderID?.jsonBody ?? ''),
                    )?.toString(),
                    amount: '1000',
                  );

                  safeSetState(() {});
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
