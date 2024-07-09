import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent, // Make Scaffold transparent
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 159, 203, 160), // Start color
                Colors.white, // End color
              ],
              stops: [0.0, 0.4],
            ),
          ),
          child: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, -1),
                        child: Text(
                          'Mindfulness Breathing',
                          style: GoogleFonts.merriweather(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Text(
                        '4',
                        style: GoogleFonts.workSans(
                          color: Color(0xFF10B00C),
                          fontSize: 100,
                        ),
                      ),
                      Container(
                        width: 206,
                        height: 152,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Inhale...',
                                    style: GoogleFonts.merriweather(
                                      color: Color(0xFF1CA90C),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
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
                                    style: GoogleFonts.anticSlab(
                                      color: Color(0xFF6D7479),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    ' mins',
                                    style: GoogleFonts.merriweather(
                                      color: Color(0xFF5D6A74),
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '  04',
                                    style: GoogleFonts.zillaSlab(
                                      color: Color(0xFF73787D),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    ' secs',
                                    style: GoogleFonts.merriweather(
                                      color: Color(0xFF697177),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Divider(
                          thickness: 1,
                          indent: 0,
                          color: Color(0xCCE2DCDC),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomPaint(
                    size: Size(MediaQuery.sizeOf(context).height,
                        MediaQuery.sizeOf(context).width),
                    painter: CurvePainter(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Background gradient

    Paint linePaint = Paint()
      ..color = Color.fromARGB(255, 233, 227, 227)
      ..strokeWidth = 6;
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.3),
      Offset(size.width * 0.5, size.height * 0.95),
      linePaint,
    );
    final Paint curvePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final Path leftCurvePath = Path();
    final Path rightCurvePath = Path();
    leftCurvePath.moveTo(size.width * 0.1, size.height * 0.5);
    leftCurvePath.quadraticBezierTo(
      size.width * 0.47,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.7,
    );
    leftCurvePath.quadraticBezierTo(
      size.width * 0.55,
      size.height * 0.9,
      size.width * 0.9,
      size.height * 0.9,
    );

// Draw the right curve path
    rightCurvePath.moveTo(size.width * 0.1, size.height * 0.9);
    rightCurvePath.quadraticBezierTo(
      size.width * 0.47,
      size.height * 0.9,
      size.width * 0.5,
      size.height * 0.7,
    );
    rightCurvePath.quadraticBezierTo(
      size.width * 0.55,
      size.height * 0.5,
      size.width * 0.9,
      size.height * 0.5,
    );

    canvas.drawPath(leftCurvePath, curvePaint);
    canvas.drawPath(rightCurvePath, curvePaint);

    final Paint pastCirclePaint = Paint()..color = Colors.red.withOpacity(1);
    final Paint futureCirclePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Color.fromARGB(255, 12, 17, 157).withOpacity(0.0),
          Colors.blue,
        ],
        stops: [0.0, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.8, size.height * 0.5),
        radius: 10,
      ));
    final Paint stressCirclePaint = Paint()
      ..color = Colors.yellow.withOpacity(1);

// Draw circles with opacity
    canvas.drawCircle(
        Offset(size.width * 0.2, size.height * 0.502), 12, pastCirclePaint);
    canvas.drawCircle(
        Offset(size.width * 0.8, size.height * 0.502), 12, futureCirclePaint);
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.38), 12, stressCirclePaint);

    final textPainter1 = TextPainter(
      text: TextSpan(
        text: 'STRESS',
        style: GoogleFonts.rokkitt(
          letterSpacing: 0,
          color: Color.fromARGB(255, 46, 45, 45),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter1.layout();

    canvas.save();
    canvas.translate(size.width / 2 + 1, size.height / 2 + 5);
    canvas.rotate(270 * (math.pi / 180));
    textPainter1.paint(
        canvas, Offset(-textPainter1.width / 2, -textPainter1.height / 2));
    canvas.restore();

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    // Draw "PAST"
    textPainter.text = TextSpan(
      text: 'PAST',
      style: GoogleFonts.rokkitt(
        color: const Color.fromARGB(255, 45, 45, 45),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width * 0.15, size.height * 0.67));

    // Draw "FUTURE"
    textPainter.text = TextSpan(
      text: 'FUTURE',
      style: GoogleFonts.rokkitt(
        color: const Color.fromARGB(255, 51, 50, 50),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width * 0.65, size.height * 0.67));

    // Draw "PRESENT"
    textPainter.text = TextSpan(
      text: 'PRESENT',
      style: GoogleFonts.rokkitt(
        color: const Color.fromARGB(255, 70, 69, 69),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width * 0.4, size.height * 0.97));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
