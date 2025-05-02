import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatingPage extends StatefulWidget {
  const ChatingPage({super.key});

  @override
  State<ChatingPage> createState() => _ChatingPageState();
}

class _ChatingPageState extends State<ChatingPage> {
  final controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  void onSend() {
    setState(() {
      messages.add({
        "txt": controller.text.trim(),
        "time": TimeOfDay.now().format(context),
        "isMe": true,
      });
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 242, 247),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                Container(
                  width: 46.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(child: Icon(Icons.arrow_back)),
                ),
                SizedBox(width: 100.w),
                Container(
                  width: 132.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.45.r),
                    color: Color.fromARGB(25, 137, 26, 255),
                  ),
                  child: Center(
                    child: Text(
                      "Robert Jackson",
                      style: GoogleFonts.dmSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 137, 26, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ChatBubble(isUserMessage: true, message: "Hello, how are you?"),
                ChatBubble(
                  isUserMessage: true,
                  message:
                      "I wanted to check in about the shoe listing I saw. Could you let me know how old the shoes are and what condition they're in? I'm really interested and would love to get more details before making a decision. Thanks!",
                ),
              ],
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final mess = messages[index];
                return ChatScreen(
                  text: mess["txt"],
                  isMe: mess['isMe'],
                  time: mess['time'],
                );
              },
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 60.w,
        child: MessageInput(controller: controller, onSend: onSend),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String text;
  final bool isMe;
  final String time;
  const ChatScreen({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Container(
          // width: 200.w,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color:
                widget.isMe ? Color.fromARGB(255, 137, 26, 255) : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
              bottomRight: widget.isMe ? Radius.zero : Radius.circular(10.r),
              bottomLeft: widget.isMe ? Radius.circular(20.r) : Radius.zero,
            ),
          ),
          child: Text(
            widget.text,
            style: GoogleFonts.dmSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color:
                  widget.isMe ? Colors.white : Color.fromARGB(255, 97, 91, 104),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatefulWidget {
  final bool isUserMessage;
  final String message;
  const ChatBubble({
    super.key,
    required this.isUserMessage,
    required this.message,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Container(
          width: 200.w,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color:
                widget.isUserMessage
                    ? Colors.white
                    : Color.fromARGB(255, 137, 26, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
              bottomRight:
                  widget.isUserMessage ? Radius.circular(20.r) : Radius.zero,
              bottomLeft:
                  widget.isUserMessage ? Radius.zero : Radius.circular(20.r),
            ),
          ),
          child: Text(
            widget.message,
            style: GoogleFonts.dmSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color:
                  widget.isUserMessage
                      ? Color.fromARGB(255, 97, 91, 104)
                      : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MessageInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Icon(Icons.add, color: Color.fromARGB(255, 119, 112, 128)),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 15.h, left: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    widget.onSend();
                  },
                  child: Icon(
                    Icons.send,
                    color: Color.fromARGB(255, 137, 26, 255),
                    size: 25.sp,
                  ),
                ),
                hintText: "Type Message...",
                hintStyle: GoogleFonts.dmSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 97, 91, 104),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
