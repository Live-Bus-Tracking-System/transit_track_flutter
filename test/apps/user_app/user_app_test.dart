import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transit_track_flutter/apps/user_app/main.dart';

void main() {
  testWidgets('User App loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const UserApp());

    // Example check
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}