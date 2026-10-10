
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_manegment/componenets.dart';

class EmptyState extends StatefulWidget {
  const EmptyState({super.key});

  @override
  State<EmptyState> createState() => _EmptyStateState();
}

class _EmptyStateState extends State<EmptyState> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Color(0xff0F172A), // Drawer icon color
          ),
          actions: [
            Icon(Icons.notifications_none,color: Color(0xff0F172A),),
            SizedBox(width: 20,)
          ],
          title: Text('Tailor App',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Color(0xff0F172A),),
          ),),
        drawer: Drawer(
          shadowColor: Colors.black,
          surfaceTintColor: Colors.black,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  decoration:InputDecoration(
                      suffixIcon: Icon(Icons.filter_list_alt,color: iconecolor),
                      prefixIcon: Icon(CupertinoIcons.search,color: iconecolor,),
                      hintText: 'Search Customer...',
                      hintStyle: TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: hinttextcolor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 300,),
                Text('No Customers Yet',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Color(0xff0F172A),fontSize: 22),),
                SizedBox(height: 10,),
                Text('Add Your First Customer To\nGet Started',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w400,color:hinttextcolor,fontSize: 16),),
                SizedBox(height: 20,),
                MyButton(title: 'ADD CUSTOMER',icon:CupertinoIcons.add,),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,color: iconecolor,size: 24,),
              label:'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,color: iconecolor,size: 24,),
              label:'Customers',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,color: iconecolor,size: 24,),
              label:'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
