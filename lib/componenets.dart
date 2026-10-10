import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color color;
  final VoidCallback?onpressed;

  const MyButton({
    super.key,
    required this.title,
    this.color = const Color(0xff2563EB),
    this.onpressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onpressed,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: bluecolor,
            borderRadius: BorderRadius.circular(12),
          ),
          child:  Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon ,size: 27,color: Colors.white,),
              SizedBox(width: 10,),
              Text(title,style: TextStyle(fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Colors.white)),
            ],
          )),
        ),
      ),
    );
  }
}


final Color bluecolor = Color(0xff2563EB);
final Color bordercolor = Color(0xffE2E8F0);
final Color titlecolor = Color(0xff0F172A);
final Color iconecolor = Color(0xff64748b);
final Color subtitlecolor = Color(0xff475569);
final Color cardcolor = Color(0xffFFFFFF);
final Color avatarcolor = Color(0xffDBEAFE);
final Color formborder = Color(0xffDBEAFE);
final Color hinttextcolor = Color(0xff94A3B8);
