import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transit_track_flutter/apps/admin_app/main.dart';
import 'package:transit_track_flutter/core/router/admin/app_router.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final route = AppRouter();
  testWidgets('Admin App loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(AdminApp(router: route));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
