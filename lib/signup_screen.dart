import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizard/signin_screen.dart';
import 'package:quizard/verification_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SignupScreen(),
    );
  }
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color(0xFFFBE9E7);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipPath(
              clipper: _TopBarClipper(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.deepPurple, Colors.purpleAccent],
                  ),
                ),
                child: Column(
                  children: [
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (_, double value, __) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 50 * (1 - value)),
                            child: const Text(
                              'Sign up now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (_, double value, __) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 30 * (1 - value)),
                            child: Text(
                              'Join Quizard and invite friends',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 18,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                      child: const SignupForm(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool useEmail = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late FocusNode _emailFocusNode;
  late FocusNode _phoneFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: useEmail ? _emailController : _phoneController,
          focusNode: useEmail ? _emailFocusNode : _phoneFocusNode,
          keyboardType: useEmail ? TextInputType.emailAddress : TextInputType.phone,
          textInputAction: TextInputAction.next, // Add this line
          decoration: InputDecoration(
            hintText: useEmail ? 'Email' : '+880',
            prefixIcon: Icon(useEmail ? Icons.email_outlined : Icons.phone_outlined, color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            hintStyle: const TextStyle(
              fontSize: 18,
              fontFamily: 'Nunito',
            ),
          ),
          obscureText: false,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              useEmail = !useEmail;

              // Clear the text in the controllers when switching between email and phone fields
              if (useEmail) {
                _phoneController.clear(); // Clear phone field
                FocusScope.of(context).requestFocus(_emailFocusNode);
              } else {
                _emailController.clear(); // Clear email field
                FocusScope.of(context).requestFocus(_phoneFocusNode);
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              useEmail ? 'Use your phone instead' : 'Use your email instead',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            hintStyle: const TextStyle(
              fontSize: 18,
              fontFamily: 'Nunito',
            ),
          ),
          obscureText: true,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            hintStyle: const TextStyle(
              fontSize: 18,
              fontFamily: 'Nunito',
            ),
          ),
          obscureText: true,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
        ),
        const SizedBox(height: 30),
        TweenAnimationBuilder(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          tween: Tween<double>(begin: 0, end: 1),
          builder: (_, double value, __) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VerificationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Nunito', color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider(color: Colors.grey)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "or signup using",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            const Expanded(child: Divider(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialIcon('assets/images/google.svg'),
            _buildSocialIcon('assets/images/facebook.svg'),
            _buildSocialIcon('assets/images/twitter.svg'),
          ],
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SigninScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Already have an account? Sign in',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildSocialIcon(String assetName) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: SvgPicture.asset(
          assetName,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regExp = RegExp(r'^[0-9\+]*$');
    if (regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

class _TopBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
