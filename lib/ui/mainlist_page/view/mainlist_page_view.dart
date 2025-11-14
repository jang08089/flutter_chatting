import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class MainListPageView extends StatelessWidget {
  const MainListPageView({super.key});

  // ✔ (1) 가짜 채팅방 생성 함수
  Future<void> _createDummyChatRoom() async {
    try {
      const uid1 = "uid_aaa111";
      const uid2 = "uid_bbb222";

      final members = [uid1, uid2]..sort();
      final roomId = "${members[0]}_${members[1]}";
      final now = DateTime.now().toIso8601String();

      await FirebaseFirestore.instance
          .collection("chat_rooms")
          .doc(roomId)
          .set({
        "member_ids": members,
        "member_info": {
          uid1: {"nickname": "수진", "sport": "헬스"},
          uid2: {"nickname": "혜린", "sport": "요가"},
        },
        "created_at": now,
        "updated_at": now,
      }, SetOptions(merge: true));

      debugPrint("🔥 chat_rooms/$roomId 만들기 성공!");
    } catch (e) {
      debugPrint("❌ 채팅방 생성 오류: $e");
    }
  }

  // ✔ (2) 메시지 Firestore 저장
  Future<void> _sendMessage(String roomId, String senderId, String content) async {
    try {
      final messageId = const Uuid().v4();
      final now = DateTime.now().toIso8601String();

      await FirebaseFirestore.instance
          .collection("chat_messages")
          .doc(roomId)
          .collection("messages")
          .doc(messageId)
          .set({
        "id": messageId,
        "room_id": roomId,
        "sender_id": senderId,
        "content": content,
        "created_at": now,
      });

      debugPrint("🔥 메시지 저장됨 → chat_messages/$roomId/messages/$messageId");
    } catch (e) {
      debugPrint("❌ 메시지 전송 오류: $e");
    }
  }

  // ✔ (3) 인풋창 띄우기 (showDialog)
  void _openMessageDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("메시지 보내기 테스트"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "메시지를 입력하세요",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("취소"),
            ),
            TextButton(
              onPressed: () async {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  const roomId = "uid_aaa111_uid_bbb222"; // 가짜 채팅방 ID
                  const senderId = "uid_aaa111"; // 가짜 보낸 사람

                  await _sendMessage(roomId, senderId, text);
                }

                Navigator.pop(context);
              },
              child: const Text("전송"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainListPage 테스트'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '여기가 MainListPageView 입니다!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),

            // 🔥 채팅방 생성 버튼
            ElevatedButton(
              onPressed: () {
                _createDummyChatRoom();
              },
              child: const Text("채팅방 생성하기 (더미 데이터)"),
            ),

            const SizedBox(height: 20),

            // 🔥 메시지 보내기 버튼
            ElevatedButton(
              onPressed: () {
                _openMessageDialog(context);
              },
              child: const Text("메시지 보내기 테스트"),
            ),
          ],
        ),
      ),
    );
  }
}