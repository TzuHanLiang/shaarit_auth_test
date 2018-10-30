import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import '../widgets/gradient_appbar.dart';
import '../widgets/text_style/headline.dart';
import '../widgets/buttons/primary_setting_button.dart';
import '../widgets/inputs/masked_text.dart';
import '../widgets/buttons/secondary_setting_button.dart';
import '../widgets/inputs/verification_code.dart';
import '../widgets/text_style/subhead.dart';
import '../widgets/reactive_refresh_indicator.dart';
import '../style/colors.dart';

enum AuthStatus { PHONE_AUTH, SMS_AUTH, PROFILE_AUTH }

class RegisterScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  //String _imei;
  AuthStatus status = AuthStatus.PHONE_AUTH;

  //keys
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<MaskedTextFieldState> _maskedPhoneKey =
      GlobalKey<MaskedTextFieldState>();

  // controllers
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();

  // Variables
  String _errorMessage;
  String _verificationId;
  Timer _codeTimer;

  bool _codeTimedOut = false;
  bool _codeVerified = false;
  bool _isRefreshing = false;
  Duration _timeOut = const Duration(minutes: 1);

  // Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // PhoneVerificationCompleted
  // This will be only executed in Android. It happens when the code is automatically retrieved from the SMS, without any user input.
  verificationCompleted(FirebaseUser user) async {
    print('onVerificationCompleted, user: $user');
    if (await _onCodeVerified(user)) {
      await _finishSignIn(user);
    } else {
      setState(() {
        this.status = AuthStatus.SMS_AUTH;
        print('Changed status to $status');
      });
    }
  }

  // PhoneVerificationFailed
  verificationFailed(AuthException authException) {
    _showErrorSnackbar(
        "We couldn't verify your code for now, please try again.");
    print(
        'message: onVerificationFailed, code: ${authException.code}, message:${authException.message}');
  }

  // PhoneCodeSent
  codeSent(String verificationId, [int forceResendingToken]) async {
    print('Verification code sent to number ${phoneNumberController.text}');
    _codeTimer = Timer(_timeOut, () {
      setState(() {
        _codeTimedOut = true;
      });
    });
    _updateRefreshing(false);
    setState(() {
      this._verificationId = verificationId;
      this.status = AuthStatus.SMS_AUTH;
      print('Changed status to $status');
    });
  }

  // PhoneCodeAutoRetrievalTimeout
  codeAutoRetrievalTimeout(String verificationId) {
    print('onCodeTimeout');
    _updateRefreshing(false);
    setState(() {
      this._verificationId = verificationId;
      this._codeTimedOut = true;
    });
  }

  @override
  void dispose() {
    _codeTimer?.cancel();
    super.dispose();
  }

  // async
  Future<Null> _updateRefreshing(bool isRefreshing) async {
    print('Setting _isRefreshing ($_isRefreshing) to $isRefreshing');
    if (_isRefreshing) {
      setState(() {
        this._isRefreshing = false;
      });
    }
    setState(() {
      this._isRefreshing = isRefreshing;
    });
  }

  _showErrorSnackbar(String message) {
    _updateRefreshing(false);
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<Null> _submitPhoneNumber() async {
    final error = _phoneInputValidator();
    if (error != null) {
      _updateRefreshing(false);
      setState(() {
        _errorMessage = error;
      });
      return null;
    } else {
      _updateRefreshing(false);
      setState(() {
        _errorMessage = null;
      });
      final result = await _verifyPhoneNumber();
      print('message: Returning $result from _submitPhoneNumber');
      return result;
    }
  }

  String get phoneNumber {
    String unmaskedText = _maskedPhoneKey.currentState.unmaskedText;
    String formatted = '+886$unmaskedText'.trim();
    return formatted;
  }

  Future<Null> _verifyPhoneNumber() async {
    print('got phone number as: ${this.phoneNumber}');
    await _auth.verifyPhoneNumber(
        phoneNumber: this.phoneNumber,
        timeout: _timeOut,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed);
    print('message: returning null from _verifyPhoneNumber');
    return null;
  }

  Future<Null> _submitSmsCode() async {
    final error = _smsInputValidator();
    if (error != null) {
      _updateRefreshing(false);
      _showErrorSnackbar(error);
      return null;
    } else {
      if (this._codeVerified) {
        await _finishSignIn(await _auth.currentUser());
      } else {
        print(' message: _signInWithPhoneNumber called');
        await _signInWithPhoneNumber();
      }
      return null;
    }
  }

  Future<void> _signInWithPhoneNumber() async {
    final errorMessage = "We couldn't verify your code, please try again!";
    await _auth
        .signInWithPhoneNumber(
            verificationId: _verificationId, smsCode: smsCodeController.text)
        .then((user) async {
      await _onCodeVerified(user).then((codeVerified) async {
        this._codeVerified = codeVerified;
        print(
          'message: Returning ${this._codeVerified} from _onCodeVerified',
        );
        if (this._codeVerified) {
          await _finishSignIn(user);
        } else {
          _showErrorSnackbar(errorMessage);
        }
      });
    }, onError: (error) {
      print("Failed to verify SMS code: $error");
      _showErrorSnackbar(errorMessage);
    });
  }

  Future<bool> _onCodeVerified(FirebaseUser user) async {
    final isUserValid = (user != null &&
        (user.phoneNumber != null && user.phoneNumber.isNotEmpty));
    if (isUserValid) {
      setState(() {
        // Here we change the status once more to guarantee that the SMS's
        // text input isn't available while you do any other request
        // with the gathered data
        this.status = AuthStatus.PROFILE_AUTH;
        print('message: "Changed status to $status');
      });
    } else {
      _showErrorSnackbar("We couldn't verify your code, please try again!");
    }
    return isUserValid;
  }

  String _phoneInputValidator() {
    if (phoneNumberController.text.isEmpty) {
      return 'Your phone number can\'t be empty';
    } else if (phoneNumberController.text.length < 10) {
      return 'This phone number is invalid!';
    }
    return null;
  }

  String _smsInputValidator() {
    if (smsCodeController.text.isEmpty) {
      return "Your verification code can't be empty!";
    } else if (smsCodeController.text.length < 6) {
      return "This verification code is invalid!";
    }
    return null;
  }

  _finishSignIn(FirebaseUser user) async {
    await _onCodeVerified(user).then((result) {
      if (result) {
        // Here, instead of navigating to another screen, you should do whatever you want
        // as the user is already verified with Firebase from both
        // Google and phone number methods
        // Example: authenticate with your own API, use the data gathered
        // to post your profile/user, etc.
      } else {
        setState(() {
          this.status = AuthStatus.SMS_AUTH;
        });
        _showErrorSnackbar(
            "We couldn't create your profile for now, please try again later");
      }
    });
  }

  Widget _buildBody() {
    Widget body;
    switch (this.status) {
      case AuthStatus.PHONE_AUTH:
        body = _buildPhoneAuthBody();
        break;
      case AuthStatus.SMS_AUTH:
      case AuthStatus.PROFILE_AUTH:
        body = _buildSmsAuthBody();
        break;
    }
    return body;
  }

  Widget _buildPhoneAuthBody() {
    return Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
        ),
        GradientAppBar('Register'),
        Positioned(
          top: 40.0,
          left: 0.0,
          child: BackButton(
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 128.0,
          left: 125.0,
          child: Headline("請輸入電話號碼"),
        ),
        Positioned(
          top: 186.0,
          left: 32.0,
          child: DropdownButton<String>(
            items: <String>[
              '+886',
              '+86',
              '+55',
            ].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
        Positioned(top: 186.0, right: 20.0, child: _buildPhoneNumberInput()),
        Positioned(
          top: 260.0,
          left: 48.0,
          child: PrimarySettingButton(
            // 把code跟controller.text傳到varification or userBloc
            '取得驗證碼',
            onPressed: (this.status == AuthStatus.PROFILE_AUTH)
                ? null
                : () => _updateRefreshing(true),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberInput() {
    return MaskedTextField(
      key: _maskedPhoneKey,
      mask: "xxx xxx xxx",
      keyboardType: TextInputType.number,
      maskedTextFieldController: phoneNumberController,
      onSubmitted: (text) => _updateRefreshing(true),
      inputDecoration: InputDecoration(
        errorText: _errorMessage,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: grey),
          borderRadius: BorderRadius.circular(22.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13.0, horizontal: 12.0),
      ),
    );
  }

  Widget _buildSmsAuthBody() {
    return Column(
      children: <Widget>[
        GradientAppBar('Register'),
        Container(
          margin: EdgeInsets.only(top: 50.0),
        ),
        Headline('請輸入驗證碼'),
        Container(
          margin: EdgeInsets.only(top: 6.0),
        ),
        Subhead("已發送至 ${phoneNumberController.text}.."),
        Container(
          margin: EdgeInsets.only(top: 18.0),
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30.0),
            ),
            VerificationCode(),
            VerificationCode(),
            VerificationCode(),
            VerificationCode(),
            VerificationCode(),
            VerificationCode(),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 24.0),
        ),
        PrimarySettingButton(
          'Next',
          onPressed: () => Navigator.pushReplacementNamed(context, '/settings'),
        ),
        Container(
          margin: EdgeInsets.only(top: 7.0),
        ),
        SecondarySettingButton(
          label: '沒收到？重新發送(??)',
          onPressed: () async {
            if (_codeTimedOut) {
              await _verifyPhoneNumber();
            } else {
              _showErrorSnackbar("You can't retry yet!");
            }
          },
        ),
      ],
    );
  }

  Future<Null> _onRefresh() async {
    switch (this.status) {
      case AuthStatus.PHONE_AUTH:
        return await _submitPhoneNumber();
        break;
      case AuthStatus.SMS_AUTH:
        return await _submitSmsCode();
        break;
      case AuthStatus.PROFILE_AUTH:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ReactiveRefreshIndicator(
          onRefresh: _onRefresh,
          isRefreshing: _isRefreshing,
          child: Container(child: _buildBody()),
        ),
      ),
    );
  }
}
