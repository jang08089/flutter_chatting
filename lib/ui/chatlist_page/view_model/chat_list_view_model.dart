import 'package:flutter_chatting/data/model/chat_room.dart';
import 'package:flutter_chatting/data/model/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPageState {
  List<Profile> profiles;
  List<ChatRoom> chatrooms;
  ChatPageState({required this.profiles,required this.chatrooms});
}

class ChatPageViewModel extends Notifier<ChatPageState> {
  @override
  ChatPageState build() {
    return ChatPageState(profiles: [], chatrooms: []);
  }
 void getChattings() async{
  
 }

}
final ChatPageViewModelProvider = NotifierProvider<ChatPageViewModel,ChatPageState>((){
  return ChatPageViewModel();
});
