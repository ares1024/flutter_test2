import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/page/base_page.dart';
import 'package:flutter_test2/routers/navigator_util.dart';
import 'package:flutter_test2/utils/log.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PageLoginSign extends StatefulWidget {
  const PageLoginSign({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginSignState();
}

class _LoginSignState extends State<PageLoginSign> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final maxPassCount = 6;
  bool _isShowPassWord = false;
  FocusNode blankNode = FocusNode();
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.userChanges().listen((event) {
      if (event != null) {
        NavigatorUtil.goMainPage(context, true);
      }
    });
  }

  ///点击控制密码是否显示
  void showPassWord() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录注册'),
        centerTitle: true,
      ),
      body: Center(
        child: buildForm(context),
      ),
    );
  }

  //构建表单
  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          const Center(
              heightFactor: 1.5,
              child: FlutterLogo(
                size: 64,
              )),
          TextFormField(
              autofocus: false,
              controller: _unameController,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入您的邮箱",
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {
                return v!.trim().isNotEmpty ? null : "用户名不能为空!";
              }),
          TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入您的密码",
                  hintStyle: const TextStyle(fontSize: 12),
                  icon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isShowPassWord
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: showPassWord)),
              obscureText: !_isShowPassWord,
              //校验密码
              validator: (v) {
                return v!.trim().length >= maxPassCount
                    ? null
                    : "密码不能少于$maxPassCount位!";
              }),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Builder(builder: (context) {
                  return ElevatedButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(15.0)),
                    child:
                        const Text("登录", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (Form.of(context)!.validate()) {
                        _signInByEmail();
                      }
                    },
                  );
                })),
              ],
            ),
          ),

          /// 分隔区域
          const SizedBox(height: 20),

          /// Google登录
          GestureDetector(
            onTap: _signInByGoogle,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Icon(Icons.android),
                SizedBox(width: 12),
                Text('Sign in with Google'),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _signInByGoogle() async {
    Log.i("_signInByGoogle start ----");

    /// 登录google
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      Log.d("googleUser = ${googleUser.toString()}");

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      Log.d("googleAuth = ${googleAuth.toString()}");

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      Log.d("credential = ${credential.toString()}");

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      Log.d("authResult = ${authResult.toString()}");

      final User? user = authResult.user;
      String idToken = await user!.getIdToken(true);
      Log.d("idToken = $idToken");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Log.e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Log.e('Wrong password provided for that user.');
      } else {
        Log.e("_signInWithGoogle e = ${e.toString()}");
      }
      BasePage().showErrorDialog(context, "_signInByGoogle", e);
    } finally {
      Log.i("_signInByGoogle end ----");
    }
  }

  void _signInByEmail() async {
    String email = _unameController.text;
    String pwd = _pwdController.text;

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
    } on FirebaseAuthException catch (e) {
      String msg = "";
      Log.e("_signInByEmail e = ${e.toString()}");
      if (e.code == "user-not-found") {
        msg = "没有此用户！";
      } else if (e.code == "invalid-email") {
        msg = "无效的email地址！";
      } else if (e.code == "user-disabled") {
        msg = "此账号被禁用！";
      } else if (e.code == "wrong-password") {
        msg = "密码错误！";
      }
      BasePage().showErrorDialog(context, "_signInByEmail", Exception(msg));
    }
  }
}
