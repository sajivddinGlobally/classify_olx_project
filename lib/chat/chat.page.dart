import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/chat/chating.page.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 46.w,
                    height: 46.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(child: Icon(Icons.arrow_back)),
                  ),
                ),
                SizedBox(width: 100.w),
                Text(
                  "Message",
                  style: GoogleFonts.dmSans(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 36, 33, 38),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 49.h,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 13.h,
                      horizontal: 13.w,
                    ),
                    prefixIcon: Icon(Icons.search, size: 20.sp),

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
                    hintText: "Search chats...",
                    hintStyle: GoogleFonts.dmSans(fontSize: 19.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => ChatingPage()),
                      );
                    },
                    child: NameBody(
                      image: "assets/chatimage1.png",
                      name: "Robert Jackson",
                      txt: "Hi, How are you?",
                      time: "02:45pm",
                      isDivider: true,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  NameBody(
                    image: "assets/chatimage2.png",
                    name: "Emily Chen",
                    txt: "Looking forward to our meeting!",
                    time: "03:00pm",
                    isDivider: true,
                  ),
                  SizedBox(height: 18.h),
                  NameBody(
                    image: "assets/chatimage3.png",
                    name: "Michael Smith",
                    txt: "Could you send me the report?",
                    time: "02:45pm",
                    isDivider: true,
                  ),
                  SizedBox(height: 18.h),
                  NameBody(
                    image: "assets/chatimage4.png",
                    name: "Robert Jackson",
                    txt: "Hi, How are you?",
                    time: "03:15pm",
                    isDivider: true,
                  ),
                  SizedBox(height: 18.h),
                  NameBody(
                    image: "assets/chatimage5.png",
                    name: "Robert Jackson",
                    txt: "What time is our call?",
                    time: "03:30pm",
                    isDivider: true,
                  ),
                  SizedBox(height: 18.h),
                  NameBody(
                    image: "assets/chatimage6.png",
                    name: "James Wilson",
                    txt: "Are you free this weekend?",
                    time: "03:45pm",
                    isDivider: true,
                  ),
                  SizedBox(height: 18.h),
                  NameBody(
                    image: "assets/chatimage7.png",
                    name: "Olivia Brown",
                    txt: "Let's catch up later!",
                    time: "04:00pm",
                    isDivider: true,
                  ),
                  SizedBox(height: 18.h),
                  NameBody(
                    image: "assets/chatimage8.png",
                    name: "Ethan Davis",
                    txt: "I have a question about the project.",
                    time: "04:15pm",
                    isDivider: true,
                  ),
                  SizedBox(height: 18.h),
                  NameBody(
                    image: "assets/chatimage9.png",
                    name: "Ava Johnson",
                    txt: "Can we reschedule our meeting?",
                    time: "04:30pm",
                    isDivider: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NameBody extends StatefulWidget {
  final String image;
  final String name;
  final String txt;
  final String time;
  final bool isDivider;
  const NameBody({
    super.key,
    required this.image,
    required this.name,
    required this.txt,
    required this.time,
    required this.isDivider,
  });

  @override
  State<NameBody> createState() => _NameBodyState();
}

class _NameBodyState extends State<NameBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 44.w,
              height: 44..h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(widget.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.dmSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 36, 33, 38),
                  ),
                ),
                Text(
                  widget.txt,
                  style: GoogleFonts.dmSans(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 97, 91, 104),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              widget.time,
              style: GoogleFonts.dmSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 97, 91, 104),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        widget.isDivider ? Divider() : SizedBox(),
      ],
    );
  }
}
