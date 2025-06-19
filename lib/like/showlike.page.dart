import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app_olx/like/service/showlikeController.dart';

class ShowlikePage extends ConsumerStatefulWidget {
  const ShowlikePage({super.key});

  @override
  ConsumerState<ShowlikePage> createState() => _ShowlikePageState();
}

class _ShowlikePageState extends ConsumerState<ShowlikePage> {
  @override
  Widget build(BuildContext context) {
    
    final likeCount = ref.watch(showLikeCountProvider("62"));

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFECD7FD), Color(0xFFF5F2F7)],
                  ),
                ),
              ),
              Image.asset("assets/bgimage.png"),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 60.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 46.w,
                    height: 46.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Positioned.fill(
                top: 160.h,
                left: 20,
                child: likeCount.when(
                  data: (data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Like : ${data.likes.toString()}",
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Dislike : ${data.dislikes.toString()}",
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                  error:
                      (error, stackTrace) =>
                          Center(child: Text(error.toString())),
                  loading: () => Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
