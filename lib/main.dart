import 'package:flutter/material.dart';

void main() {
  runApp(const PkAutoCutApp());
}

class PkAutoCutApp extends StatelessWidget {
  const PkAutoCutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pk AutoCut ai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0F1D), // लग्जरी नेवी-ब्लू थीम
        primaryColor: const Color(0xFFFFD700), // गोल्ड एक्सेंट
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFD700),
          surface: Color(0xFF131B2E),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearAnimationGradient(),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFD700).withOpacity(0.35),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF0A0F1D),
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 65,
                      color: Color(0xFFFFD700),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              'pk AutoCut ai',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Upload • AI Edits • Done',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1.2,
                color: Color(0xFFFFD700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinearAnimationGradient extends RadialGradient {
  const LinearAnimationGradient()
      : super(
          colors: const [Color(0xFFFFD700), Color(0xFFFFA500), Color(0xFF0A0F1D)],
          stops: const [0.6, 0.85, 1.0],
        );
}
