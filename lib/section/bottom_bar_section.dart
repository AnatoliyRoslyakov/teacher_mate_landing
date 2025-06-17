import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher_mate_landing/generated/l10n.dart';
import 'package:teacher_mate_landing/resource/svgs.dart';

class BottomBarSection extends StatelessWidget {
  const BottomBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Colors.black,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Svgs.logoNoBackground,
                color: Colors.white,
                height: 35,
                width: 35,
              ),
              SizedBox(width: 5),
              const Text(
                'TeacherMate',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).bottomBarEmergensy,
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.telegram, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.inbox, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
