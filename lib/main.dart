import 'package:flutter/material.dart';

void main() {
  runApp(const OperationWebApp());
}

class OperationWebApp extends StatelessWidget {
  const OperationWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بطاقة التشغيل',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
      ),
      home: const OperationCardPage(),
    );
  }
}

class OperationCardPage extends StatelessWidget {
  const OperationCardPage({super.key});

  // ✅ تعديل النصوص لتكون يمين
  Widget buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              label,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection(String title, List<Widget> fields) {
    return Container(
      width: 750,
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.teal.shade100, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006F94),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...fields,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'تفاصيل بطاقة التشغيل',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF006F94),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // ✅ بيانات المنشأة
                buildSection("بيانات المنشأة/الفرد", [
                  buildField("الاسم", "مؤسسة زمان الفارس للخدمات اللوجستية"),
                ]),

                // ✅ معلومات الترخيص الرئيسي
                buildSection("معلومات الترخيص الرئيسي", [
                  buildField("رقم الترخيص", "38/00015062"),
                  buildField("نوع الترخيص / النشاط", "النقل الخفيف للبضائع على الطرق البرية"),
                  buildField("المدينة", "القصيم"),
                ]),

                // ✅ بيانات بطاقة التشغيل
                buildSection("بيانات بطاقة التشغيل", [
                  buildField("رقم البطاقة", "38-00376272"),
                  buildField("نوع بطاقة التشغيل", "النقل الخفيف للبضائع على الطرق البرية"),
                  buildField("تاريخ الإصدار", "2025-05-08"),
                  buildField("تاريخ الانتهاء", "2026-05-08"),
                ]),

                // ✅ معلومات المركبة
                buildSection("معلومات المركبة", [
                  buildField("نوع السيارة - الماركة و الطراز", "نيسان صني"),
                  buildField("رقم اللوحة", "ر و ن 3148"),
                  buildField("سنة الصنع", "2020"),
                  buildField("لون المركبة", "أبيض"),
                  buildField("الرقم التسلسلي", "427238120"),
                ]),

                const SizedBox(height: 30),
                Container(
                  width: 750,
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.teal,
                      side: const BorderSide(color: Colors.teal),
                    ),
                    child: const Text("رجوع"),
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
