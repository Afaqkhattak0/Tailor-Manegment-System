import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_manegment/add_customer.dart';
import 'package:tailor_manegment/componenets.dart';
import 'package:tailor_manegment/home_screen.dart';
import 'package:tailor_manegment/models/customer_model.dart';

class CustomerDetails extends StatefulWidget {
  final CustomerModel customer;

  const CustomerDetails({
    super.key,
    required this.customer,
  });


  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController phoneController =
  TextEditingController();
  final TextEditingController addressController =
  TextEditingController();


  // Measurements
  final TextEditingController shirtLengthController =
  TextEditingController();

  final TextEditingController shoulderController =
  TextEditingController();

  final TextEditingController chestController =
  TextEditingController();

  final TextEditingController waistController =
  TextEditingController();

  final TextEditingController hipController =
  TextEditingController();

  final TextEditingController sleeveController =
  TextEditingController();

  final TextEditingController collarController =
  TextEditingController();

  final TextEditingController bottomController =
  TextEditingController();

  final TextEditingController trouserLengthController =
  TextEditingController();


  // Additional Information
  final TextEditingController notesController =
  TextEditingController();




  //=========================================================
  //                     DISPOSE
  //=========================================================
  // Controllers ko dispose karna zaroori hai.
  // Jab screen close hogi to memory properly release hogi.

  @override
  void dispose() {

    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();

    shirtLengthController.dispose();
    shoulderController.dispose();
    chestController.dispose();
    waistController.dispose();
    hipController.dispose();
    sleeveController.dispose();
    collarController.dispose();
    bottomController.dispose();
    trouserLengthController.dispose();

    notesController.dispose();

    super.dispose();
  }
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
          title: Text('Customer Details',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Color(0xff0F172A),),
          ),
        ),
        backgroundColor: Color(0xffF8FAFC),
        body:SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                      elevation: 4,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.blue.shade100
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xffDBEAFE),
                            child: const Icon(
                              Icons.person,
                              color: Color(0xff2563EB),
                              size: 28,
                            ),
                          ),
                          title: Text(widget.customer.name,style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Colors.red,fontSize: 16),),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(widget.customer.phone,
                            style: const TextStyle(fontFamily: "Poppins", fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xff64748B),
                            ),
                          ),
                          ),
                          onTap: () {},
                        ),
                      )
                  ),
                  SizedBox(height: 10,),
                  Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: Row(
                        children: [
                          Icon(Icons. straighten_outlined  ,color: bluecolor,size: 20,),
                          SizedBox(width: 10,),
                          Text('Measurements',style: TextStyle(color: bluecolor,fontFamily: 'Poppins',fontSize: 16,fontWeight: FontWeight.w600),),
                        ],
                      )),
                  SizedBox(height: 10,),
                  Card(
                    elevation: 3,
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all( 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Address',style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:titlecolor),),
                                Text(widget.customer.address,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 430,
                            color: Color(0xffE2E8F0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all( 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Shirt Length:',style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:titlecolor),),
                                Text(widget.customer.shirtLength,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 430,
                            color: Color(0xffE2E8F0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all( 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Shoulder',style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:titlecolor),),
                                Text(widget.customer.shoulder,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 430,
                            color: Color(0xffE2E8F0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all( 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Chest',style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:titlecolor),),
                                Text(widget.customer.chest,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 430,
                            color: Color(0xffE2E8F0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all( 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Waist',style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:titlecolor),),
                                Text(widget.customer.waist,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 430,
                            color: Color(0xffE2E8F0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all( 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Hip',style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:titlecolor),),
                                Text(widget.customer.hip,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 430,
                            color: Color(0xffE2E8F0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all( 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sleeve',style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:titlecolor),),
                                Text(widget.customer.sleeve,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 430,
                            color: Color(0xffE2E8F0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all( 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Collar',style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:titlecolor),),
                                Text(widget.customer.collar,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 430,
                            color: Color(0xffE2E8F0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all( 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Botton',style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:titlecolor),),
                                Text(widget.customer.bottom,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.event_note_outlined   ,color: bluecolor,size: 20,),
                      SizedBox(width: 7,),
                      Text('Notes',style: TextStyle(color: bluecolor,fontFamily: 'Poppins',fontSize: 16,fontWeight: FontWeight.w600),),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all( 12.0),
                    child: Text(widget.customer.notes,style: TextStyle(fontSize: 16,fontFamily: 'Pippins',fontWeight: FontWeight.w600,color:Color(0xff2563EB)),)
                  ),
                  SizedBox(height: 15,),
                  MyButton(
                    title: 'SAVE CUSTOMER',
                    icon: Icons.save,
                    onpressed: () {
                      Navigator.pop(context, widget.customer);
                    },
                  ),
                  SizedBox(height: 15,),
                  MyButton(
                    title: 'EDIT CUSTOMER',
                    icon: Icons.edit,
                    onpressed: () async {
                      CustomerModel? updatedCustomer = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCustomer(
                            customer: widget.customer,
                          ),
                        ),
                      );

                      if (updatedCustomer != null) {
                        Navigator.pop(context, updatedCustomer);
                      }
                    },
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
