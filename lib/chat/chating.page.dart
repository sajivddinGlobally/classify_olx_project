import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app_olx/chat/controller/inboxProvider.provider.dart';
import 'package:shopping_app_olx/chat/model/mesagesList.response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatingPage extends ConsumerStatefulWidget {
  final String userid;
  final String name;
  const ChatingPage({super.key, required this.userid, required this.name});

  @override
  ConsumerState<ChatingPage> createState() => _ChatingPageState();
}

class _ChatingPageState extends ConsumerState<ChatingPage> {
  final controller = TextEditingController();
  late WebSocketChannel channel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final box = Hive.box("data");
    final id = box.get("id");

    // Connect WebSocket
    channel = WebSocketChannel.connect(
      Uri.parse('ws://classfiy.onrender.com/chat/ws/$id'),
    );

    // Page open hone ke turant baad scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messagesList = ref.watch(messageProvider(widget.userid));
    final box = Hive.box("data");
    final id = box.get("id");

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 242, 247),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Container(
          height: 34.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.45.r),
            color: const Color.fromARGB(25, 137, 26, 255),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                widget.name,
                style: GoogleFonts.dmSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 137, 26, 255),
                ),
              ),
            ),
          ),
        ),
      ),
      body: messagesList.when(
        data: (snap) {
          // Jab bhi data load ho, scroll to bottom
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom();
          });

          return Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: channel.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      log("Incoming: ${snapshot.data}");

                      try {
                        final data = jsonDecode(snapshot.requireData);
                        if (!snap.chat.any((m) => m.id == data['id'])) {
                          snap.chat.add(
                            Chat(
                              id: data["id"],
                              sender: int.parse(data['sender_id']),
                              message: data['message'],
                              timestamp: DateTime.now(),
                            ),
                          );
                          _scrollToBottom();
                        }

                        _scrollToBottom();
                      } catch (e) {
                        log("Error parsing: $e");
                      }
                    }

                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: snap.chat.length,
                      itemBuilder: (context, index) {
                        final e = snap.chat[index];
                        return ChatBubble(
                          isUserMessage: e.sender.toString() != id.toString(),
                          message: e.message,
                        );
                      },
                    );
                  },
                ),
              ),
              MessageInput(
                controller: controller,
                onSend: () {
                  if (controller.text.trim().isEmpty) return;

                  channel.sink.add(
                    jsonEncode({
                      "receiver_id": widget.userid,
                      "message": controller.text,
                    }),
                  );

                  setState(() {
                    snap.chat.add(
                      Chat(
                        id: "sender",
                        sender: int.parse(id.toString()),
                        message: controller.text,
                        timestamp: DateTime.now(),
                      ),
                    );
                    controller.clear();
                  });
                  _scrollToBottom();
                },
              ),
            ],
          );
        },
        error: (err, stack) => Center(child: Text("$err")),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isUserMessage;
  final String message;
  const ChatBubble({
    super.key,
    required this.isUserMessage,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color:
                isUserMessage
                    ? Colors.white
                    : const Color.fromARGB(255, 137, 26, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
              bottomRight: isUserMessage ? Radius.circular(20.r) : Radius.zero,
              bottomLeft: isUserMessage ? Radius.zero : Radius.circular(20.r),
            ),
          ),
          child: Text(
            message,
            style: GoogleFonts.dmSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color:
                  isUserMessage
                      ? const Color.fromARGB(255, 97, 91, 104)
                      : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.w),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 15.h, left: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: GestureDetector(
                  onTap: onSend,
                  child: Icon(
                    Icons.send,
                    color: const Color.fromARGB(255, 137, 26, 255),
                    size: 25.sp,
                  ),
                ),
                hintText: "Type Message...",
                hintStyle: GoogleFonts.dmSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 97, 91, 104),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
