
import 'package:flutter/material.dart';
class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color.fromARGB(255, 203, 197, 197),width: 1.0),
        color:Color.fromARGB(255, 203, 197, 197),
      ),
      child: CustomPaint(
        painter: _PlayButtonPainter(),
      ),
    );
  }
}

class _PlayButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 107, 105, 105)!
      ..style = PaintingStyle.fill;

    double radius = size.width / 2;
    Offset center = Offset(radius, radius - 20);

    // Calculate triangle points
    double triangleSize = radius / 1.5;
    double triangleHeight = triangleSize * math.sqrt(3);
    List<Offset> trianglePoints = [
      Offset(center.dx - triangleSize / 2, center.dy - triangleHeight / 2),
      Offset(center.dx + triangleSize / 1.5, center.dy),
      Offset(center.dx - triangleSize / 2, center.dy + triangleHeight / 2),
    ];

    // Draw triangle
    Path path = Path();
    path.moveTo(trianglePoints[0].dx, trianglePoints[0].dy);
    path.lineTo(trianglePoints[1].dx, trianglePoints[1].dy);
    path.lineTo(trianglePoints[2].dx, trianglePoints[2].dy);
    path.close();

    canvas.drawPath(path, paint);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
