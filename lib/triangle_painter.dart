import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  TrianglePainter(this._pageController) : super(repaint: _pageController);
  final PageController _pageController;
  @override
  void paint(Canvas canvas, Size size) {
    final pos = _pageController.position;
    double fullExtent =
        (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);
    double pageCount = fullExtent / pos.viewportDimension;
    double pageOffset = pos.extentBefore / fullExtent;

    final double indicatorHeight = size.height * 0.25;
    final Offset centerPoint =
        Offset((size.width / pageCount) * 0.5, size.height - indicatorHeight);

    Path path = Path()
      ..moveTo(centerPoint.dx, centerPoint.dy)
      ..relativeLineTo(indicatorHeight, indicatorHeight)
      ..relativeLineTo(-indicatorHeight * 2, 0.0)
      ..close();
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.save();
    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => true;
}
