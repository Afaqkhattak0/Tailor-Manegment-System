

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_manegment/componenets.dart';

class EditCustomer extends StatefulWidget {
  const EditCustomer({super.key});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Color(0xff0F172A), // Drawer icon color
          ),
          actions: [
            Icon(CupertinoIcons.ellipsis_vertical,color: Color(0xff0F172A),),
            SizedBox(width: 20,)
          ],
          title: Text('Edit Customer',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Color(0xff0F172A),),
          ),
        ),
        backgroundColor: Color(0xffF8FAFC),
        body:SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration:InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.person,color: iconecolor,),
                        hintText: 'Search Customer...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 15,),
                  MyButton(title: 'EDIT CUSTOMER',icon: Icons.edit,),
                ],
              )
          ),
        ),
      ),
    );
  }
}
