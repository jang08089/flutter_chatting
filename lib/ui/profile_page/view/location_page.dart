import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  final VoidCallback onTap;

   LocationPage({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,  // 클릭 기능 (나중에 VWorld 연결)    ui만  구성 
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.location_on, color: Colors.black54),
            SizedBox(width: 12),
            Text(
              "위치 정보 가져오기",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
