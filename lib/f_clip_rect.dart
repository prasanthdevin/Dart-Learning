import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClipFixDemo(),
    );
  }
}

class ClipFixDemo extends StatelessWidget {
  const ClipFixDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FINAL ClipRect Difference")),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 20),

            // 🔴 WITHOUT ClipRect
            const Text(
              "WITHOUT ClipRect (Overflow clearly visible)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              height: 120,
              width: 200,
              color: Colors.grey.shade300,
              child: Stack(
                clipBehavior: Clip.none, // 🔥 IMPORTANT
                children: [
                  Positioned(
                    top: -50, // force overflow OUTSIDE
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.red, // solid color → easy to see
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),

            // 🟢 WITH ClipRect
            const Text(
              "WITH ClipRect (Overflow CUT)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ClipRect(
              child: Container(
                height: 120,
                width: 200,
                color: Colors.grey.shade300,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -50,
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50),

            // 🔵 CLIPPATH
            const Text(
              "ClipPath (Wave Shape)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Wave Shape",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}







/*

ClipRect works ONLY if content goes OUTSIDE bounds

❌ Without ClipRect → overflow visible
✅ With ClipRect → cropped properly

❌ Without ClipRect
Image tries to reduce height
But extra part is still visible (overflow)

✅ With ClipRect
Only top 50% is visible
Bottom part is completely CUT
*/
