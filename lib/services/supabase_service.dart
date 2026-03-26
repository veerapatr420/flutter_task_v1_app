import 'dart:io';

import 'package:flutter_task_v1_app/models/task.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  //สร้างตัวแทนของ Supabase
  final supabase = Supabase.instance.client;

  //สร้างคำสั่งการทำงานต่างๆกับ Supabase
  //เมธอดดึงข้อมูลทั้งหมดจาก task_tb

  Future<List<Task>> getTasks() async {
    //ดึงข้อมูลจาก task_tb
    final data = await supabase.from('task_tb').select('*');

    //return ค่าข้อมูลที่ได้จากการดึงไปใช้งาน
    return data.map((task) => Task.fromJson(task)).toList();
  }

  //เมธอดอัปโหลดไฟล์ไปยัง task_bk และ return ค่าข้อมูลที่อยู่รูปที่ได้จากการอัปโหลดไปใช้งาน
  Future<String> uploadFile(File file) async {
    //สร้างชื่อไฟล์ใหม่ให้ไฟล์เพื่อไม่ให้ซ้ำกัน
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';

    //อัปโหลดไฟล์ไปยัง task_bk
    await supabase.storage.from('task_bk').upload(fileName, file);

    //return ค่าข้อมูลที่ได้จากการอัปโหลดไปใช้งาน
    return supabase.storage.from('task_bk').getPublicUrl(fileName);
  }

  //เมธอดเพิ่มข้อมูลใน task_tb
  Future<void> insertTask(Task task) async {
    //เพิ่มข้อมูลใน task_tb
    await supabase.from('task_tb').insert(task.toJson());
  }
  //เมธอดไฟล์ที่อัปโหลดไปยัง task_bk
  //เมธอดแก้ไขข้อมูลใน task_tb
  //เมธอดลบข้อมูลใน task_tb
}
