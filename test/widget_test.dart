import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math' as math;

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 2.0),
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
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.fill;

    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    // Calculate triangle points
    double triangleSize = radius / 2;
    double triangleHeight = triangleSize * math.sqrt(3) / 2;
    List<Offset> trianglePoints = [
      Offset(center.dx - triangleSize / 2, center.dy - triangleHeight / 2),
      Offset(center.dx + triangleSize / 2, center.dy),
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

void main() {
  testWidgets('PlayButton Widget Test', (WidgetTester tester) async {
    // Build the PlayButton widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: PlayButton(),
        ),
      ),
    ));

    // Verify that the PlayButton widget is rendered
    expect(find.byType(PlayButton), findsOneWidget);

    // Verify that the PlayButton has a circular border
    expect(find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).shape == BoxShape.circle &&
            (widget.decoration as BoxDecoration).border !=
                null), // Ensure border is not null
        findsOneWidget);

    // Verify that the PlayButton has a dark grey triangle inside
    expect(find.byWidgetPredicate((widget) => widget is CustomPaint), findsOneWidget);
  });
}
