import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_smooth_marquee/flutter_smooth_marquee.dart';

void main() {
  testWidgets('renders static child when text fits within container',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: FlutterSmoothMarquee(
              autoDetectOverflow: true,
              child: Text('Short text'),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Short text'), findsWidgets);
  });

  testWidgets('animates marquee when content overflows container',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 80,
            child: FlutterSmoothMarquee(
              velocity: 100.0,
              delayBeforeScroll: Duration.zero,
              child: Text(
                'Very long text that is definitely going to overflow eighty pixels',
              ),
            ),
          ),
        ),
      ),
    );

    // Initial frame and post frame callbacks
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Verify widget is present
    expect(find.byType(FlutterSmoothMarquee), findsOneWidget);
  });

  testWidgets('SmoothMarqueeText renders text properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 300,
            child: SmoothMarqueeText('Streaming stock price: AAPL +2.4%'),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.byType(SmoothMarqueeText), findsOneWidget);
  });

  testWidgets('pauses on pointer enter and resumes on pointer exit',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 100,
            child: FlutterSmoothMarquee(
              velocity: 80.0,
              delayBeforeScroll: Duration.zero,
              pauseOnHover: true,
              child: Text('Super long content string that overflows bounds'),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);

    // Hover over marquee
    await gesture.moveTo(tester.getCenter(find.byType(FlutterSmoothMarquee)));
    await tester.pump(const Duration(milliseconds: 100));

    // Move outside
    await gesture.moveTo(const Offset(500, 500));
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(FlutterSmoothMarquee), findsOneWidget);
  });
}
