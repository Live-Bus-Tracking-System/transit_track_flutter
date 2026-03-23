import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transit_track_flutter/apps/admin_app/main.dart';

void main() {
  testWidgets('Admin App loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const AdminApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}