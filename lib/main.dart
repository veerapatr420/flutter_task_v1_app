import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_task_v1_app/view/splash_screen_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //ตั้งค่าการใช้งาน Supabase ที่จะทำงานด้วย
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bjdqqtwiyrfppelbrtjr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJqZHFxdHdpeXJmcHBlbGJydGpyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM5MTUzNzgsImV4cCI6MjA4OTQ5MTM3OH0.r_WczhzFqW2mzWrm1PjR2UF60bamKeJpyITw_dgA4CU',
  );

  runApp(const FlutterTaskV1App());
}

class FlutterTaskV1App extends StatefulWidget {
  const FlutterTaskV1App({super.key});

  @override
  State<FlutterTaskV1App> createState() => _FlutterTaskV1AppState();
}

class _FlutterTaskV1AppState extends State<FlutterTaskV1App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
