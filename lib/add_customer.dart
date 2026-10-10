import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_manegment/componenets.dart';
import 'package:tailor_manegment/customer_details.dart';
import 'package:tailor_manegment/home_screen.dart';
import 'package:tailor_manegment/models/customer_model.dart';


class AddCustomer extends StatefulWidget {
  final CustomerModel? customer;

  const AddCustomer({
    super.key,
    this.customer,
  });

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {

  //=========================================================
  //                  TEXT CONTROLLERS
  //=========================================================

  // Customer Information
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



  @override
  void initState() {
    super.initState();

    if (widget.customer != null) {
      nameController.text = widget.customer!.name;
      phoneController.text = widget.customer!.phone;
      addressController.text = widget.customer!.address;

      shirtLengthController.text = widget.customer!.shirtLength;
      shoulderController.text = widget.customer!.shoulder;
      chestController.text = widget.customer!.chest;
      waistController.text = widget.customer!.waist;
      hipController.text = widget.customer!.hip;
      sleeveController.text = widget.customer!.sleeve;
      collarController.text = widget.customer!.collar;
      bottomController.text = widget.customer!.bottom;
      trouserLengthController.text = widget.customer!.trouserLength;

      notesController.text = widget.customer!.notes;
    }
  }




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
            color: Color(0xff0F172A),
          ),

          actions: [
            Container(
              height: 40,
              width: 40,

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Center(
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(width: 20),
          ],

          title: Text(
            'Add Customer',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Color(0xff0F172A),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                //=================================================
                //              CUSTOMER INFORMATION
                //=================================================
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Customer Information',
                    style: TextStyle(
                      color: bluecolor,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                // FULL NAME
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                    ),

                    hintText: 'Full Name',
                    hintStyle: TextStyle(
                      color: hinttextcolor,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: bordercolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // PHONE
                TextFormField(
                  controller: phoneController,

                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                    ),

                    hintText: 'Phone Number',

                    hintStyle: TextStyle(
                      color: hinttextcolor,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                      borderSide: BorderSide(
                        color: bordercolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //address
                TextFormField(
                  controller: addressController,

                  keyboardType: TextInputType.streetAddress,

                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.home,
                    ),

                    hintText: 'Address',

                    hintStyle: TextStyle(
                      color: hinttextcolor,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                      borderSide: BorderSide(
                        color: bordercolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Container(
                  height: 1,
                  width: 470,
                  color: Color(0xffE2E8F0),
                ),
                SizedBox(height: 3),
                //=================================================
                //                  MEASUREMENTS
                //=================================================
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Measurements',
                    style: TextStyle(
                      color: bluecolor,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //=================================================
                //              SHIRT / SHOULDER / CHEST
                //================================================
                Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shirt Length,',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: shirtLengthController,

                              keyboardType: TextInputType.number,

                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.edit),

                                hintText: '0.0',

                                hintStyle: TextStyle(
                                  color: hinttextcolor,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),

                                  borderSide: BorderSide(
                                    color: bordercolor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text(
                              'Shoulder',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),

                            SizedBox(height: 5),

                            TextFormField(
                              controller: shoulderController,

                              keyboardType: TextInputType.number,

                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.edit),

                                hintText: '0.0',

                                hintStyle: TextStyle(
                                  color: hinttextcolor,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),

                                  borderSide: BorderSide(
                                    color: bordercolor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text(
                              'Chest',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),

                            SizedBox(height: 5),
                            TextFormField(
                              controller: chestController,

                              keyboardType: TextInputType.number,

                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.edit),

                                hintText: '0.0',

                                hintStyle: TextStyle(
                                  color: hinttextcolor,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),

                                  borderSide: BorderSide(
                                    color: bordercolor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                //=================================================
                //                  WAIST / HIP / SLEEVE
                //=================================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            'Waist,',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),

                          SizedBox(height: 5),
                          TextFormField(
                            controller: waistController,

                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.edit),

                              hintText: '0.0',

                              hintStyle: TextStyle(
                                color: hinttextcolor,
                              ),

                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),

                                borderSide: BorderSide(
                                  color: bordercolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'Hip',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: hipController,

                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.edit),

                              hintText: '0.0',

                              hintStyle: TextStyle(
                                color: hinttextcolor,
                              ),

                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),

                                borderSide: BorderSide(
                                  color: bordercolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            'Sleeve',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),

                          SizedBox(height: 5),

                          TextFormField(
                            controller: sleeveController,

                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.edit),

                              hintText: '0.0',

                              hintStyle: TextStyle(
                                color: hinttextcolor,
                              ),

                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),

                                borderSide: BorderSide(
                                  color: bordercolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 20),
                //=================================================
                //              COLLAR / BOTTOM / TROUSER
                //=================================================

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            'Collar',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),

                          SizedBox(height: 5),

                          TextFormField(
                            controller: collarController,

                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.edit),

                              hintText: '0.0',

                              hintStyle: TextStyle(
                                color: hinttextcolor,
                              ),

                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),

                                borderSide: BorderSide(
                                  color: bordercolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(width: 20),


                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            'Bottom',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),

                          SizedBox(height: 5),

                          TextFormField(
                            controller: bottomController,

                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.edit),

                              hintText: '0.0',

                              hintStyle: TextStyle(
                                color: hinttextcolor,
                              ),

                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),

                                borderSide: BorderSide(
                                  color: bordercolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            'Trouser Length',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),

                          SizedBox(height: 5),

                          TextFormField(
                            controller: trouserLengthController,

                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.edit),

                              hintText: '0.0',

                              hintStyle: TextStyle(
                                color: hinttextcolor,
                              ),

                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),

                                borderSide: BorderSide(
                                  color: bordercolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 20),
                //=================================================
                //             ADDITIONAL INFORMATION
                //=================================================
                Row(
                  children: [

                    Text(
                      'Additional Information ',
                      style: TextStyle(
                        color: Color(0xff7C3AED),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      '(Optional)',
                      style: TextStyle(
                        color: hinttextcolor,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //=================================================
                //                       NOTES
                //=================================================
                Container(
                  height: 100,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: avatarcolor,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.square_favorites,
                              color: iconecolor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Notes (e.g Special instruction..)',
                              style: TextStyle(
                                color: hinttextcolor,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: notesController,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //=================================================
                //                       ACTIONS
                //=================================================
                Align(
                  alignment: AlignmentGeometry.topLeft,

                  child: Text(
                    'Actions',
                    style: TextStyle(
                      color: Color(0xffEF4444),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MyButton(
                  title: 'Preview ',
                  icon: CupertinoIcons.eye,
                  onpressed: () async {

                    CustomerModel customer = CustomerModel(
                      id: widget.customer?.id ?? 0,
                      name: nameController.text,
                      phone: phoneController.text,
                      address: addressController.text,
                      shirtLength: shirtLengthController.text,
                      shoulder: shoulderController.text,
                      chest: chestController.text,
                      waist: waistController.text,
                      hip: hipController.text,
                      sleeve: sleeveController.text,
                      collar: collarController.text,
                      bottom: bottomController.text,
                      trouserLength: trouserLengthController.text,
                      notes: notesController.text,
                    );

                    CustomerModel? savedCustomer = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerDetails(
                          customer: customer,
                        ),
                      ),
                    );

                    if (savedCustomer != null) {
                      Navigator.pop(context, savedCustomer);
                    }
                  },
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: (){
                    nameController.clear();
                    phoneController.clear();
                    addressController.clear();
                    shirtLengthController.clear();
                    shoulderController.clear();
                    chestController.clear();
                    waistController.clear();
                    hipController.clear();
                    sleeveController.clear();
                    collarController.clear();
                    bottomController.clear();
                    trouserLengthController.clear();
                    notesController.clear();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: Color(0xffEF4444),
                      ),

                      color: Colors.white,

                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                          Icon(
                            CupertinoIcons.delete,
                            size: 27,
                            color: Color(0xffEF4444),
                          ),

                          SizedBox(width: 10),

                          Text(
                            'Clear Form',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color(0xffEF4444),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//MyButton(
//                   title: 'SAVE CUSTOMER',
//                   icon: Icons.save,
//                   onpressed: () {
//
//                     CustomerModel customer = CustomerModel(
//                       id: 0,
//                       name: nameController.text,
//                       phone: phoneController.text,
//                       address: addressController.text,
//                       shirtLength: shirtLengthController.text,
//                       shoulder: shoulderController.text,
//                       chest: chestController.text,
//                       waist: waistController.text,
//                       hip: hipController.text,
//                       sleeve: sleeveController.text,
//                       collar: collarController.text,
//                       bottom: bottomController.text,
//                       trouserLength: trouserLengthController.text,
//                       notes: notesController.text,
//                     );
//
//                     Navigator.pop(context, customer);
//                   },
//                 ),