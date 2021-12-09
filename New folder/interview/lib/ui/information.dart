import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/bloc/database_bloc/database_bloc.dart';
import 'package:interview/ui/widget/rounded_loading_button.dart';
import 'package:interview/ui/widget/shakeTransition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  TextEditingController textEditingController = TextEditingController();
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  bool isFullyFilled = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    textEditingController.text = '9323';
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  ///To display error button
  void _buttonerror() async {
    _btnController.error();
    errorController!.add(ErrorAnimationType.shake);
    await Future.delayed(Duration(seconds: 3));
    _btnController.reset();
  }

  ///To display success button
  void _buttonsucces() async {
    _btnController.success();
    await Future.delayed(Duration(seconds: 3));
    _btnController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: ShakeTransition(
                duration: Duration(milliseconds: 500),
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_new_rounded,
                  color: Color(0xffB0B0B0), size: 16)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 91),
              ShakeTransition(
                duration: Duration(milliseconds: 500),
                child: Text(
                  'Код из сообщения',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 43),
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,

                length: 4,
                autoFocus: true,
                obscureText: true,
                obscuringCharacter: '*',
                useHapticFeedback: true,
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                hapticFeedbackTypes: HapticFeedbackTypes.medium,
                validator: (v) {
                  if (v!.length < 4) {
                    return "Неправильный код. Повторите пожалуйста еще раз.";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  activeColor: Colors.black,
                  inactiveColor: Colors.black,
                  selectedColor: Colors.black,
                  errorBorderColor: Colors.red,
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  activeFillColor: Colors.transparent,
                ),
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                onCompleted: (v) {
                  setState(() {
                    isFullyFilled = true;
                  });
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  return true;
                },
              ),
              SizedBox(height: 380),
              BlocListener<DatabaseBloc, DatabaseState>(
                listener: (context, state) {
                  if (state is DatabaseLoading)
                    _btnController.start();
                  else if (state is DatabaseError)
                    _buttonerror();
                  else if (state is DatabaseSuccess) _buttonsucces();
                },
                child: ShakeTransition(
                duration: Duration(milliseconds: 500),
                left: false,
                  child: RoundedLoadingButton(
                      onPressed: () {
                        if (!isFullyFilled && formKey.currentState!.validate()) {
                          BlocProvider.of<DatabaseBloc>(context)
                            ..add(SavePassword(
                                password: textEditingController.text.trim()));
                        }
                      },
                      animateOnTap: false,
                      controller: _btnController,
                      height: 48,
                      width: 264,
                      color: Colors.transparent,
                      child: Container(
                          height: 48,
                          width: 264,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(14)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: isFullyFilled
                                      ? ([Color(0xff1E315A), Color(0xff182647)])
                                      : [Color(0xffE9E9E9), Color(0xffE9E9E9)])),
                          child: Center(
                            child: Text('Продолжить',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: isFullyFilled
                                        ? Color(0xffFBFBFB)
                                        : Color(0xffBBBBBB))),
                          ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}