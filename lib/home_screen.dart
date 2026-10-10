import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_manegment/add_customer.dart';
import 'package:tailor_manegment/componenets.dart';
import 'package:tailor_manegment/customer_details.dart';
import 'package:tailor_manegment/models/customer_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // =====================================================
  // CUSTOMERS LIST
  // =====================================================

  List<CustomerModel> customers = [];

  // ====================================================
  // SEARCH CONTROLLER
  // =====================================================
  final TextEditingController searchController =
  TextEditingController();
  // =====================================================
  // SEARCH TEXT
  // =====================================================
  String searchText = '';

  // =====================================================
  // ADD CUSTOMER
  // =====================================================

  Future<void> addCustomer() async {
    CustomerModel? customer = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddCustomer(),
      ),
    );

    if (customer != null) {
      setState(() {
        customer.id = customers.length + 1;
        customers.add(customer);
      });
    }
  }

  // =====================================================
  // SEARCH CUSTOMERS
  // =====================================================

  List<CustomerModel> get filteredCustomers {

    if (searchText.isEmpty) {
      return customers;
    }

    return customers.where((customer) {

      return customer.name
          .toLowerCase()
          .contains(searchText.toLowerCase()) ||

          customer.phone
              .toLowerCase()
              .contains(searchText.toLowerCase());

    }).toList();
  }
  // =====================================================
  // DISPOSE
  // =====================================================

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  // =====================================================
  // BUILD
  // =====================================================

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(

        // =================================================
        // APP BAR
        // =================================================

        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Color(0xff0F172A),
          ),
          actions: [
            Icon(
              Icons.notifications_none,
              color: Color(0xff0F172A),
            ),
            SizedBox(width: 20),
          ],

          title: Text(
            'Tailor App',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Color(0xff0F172A),
            ),
          ),
        ),
        // =================================================
        // DRAWER
        // =================================================
        drawer: Drawer(
          shadowColor: Colors.black,
          surfaceTintColor: Colors.black,
          backgroundColor: Colors.blue,
        ),

        // =================================================
        // BODY
        // =================================================
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),

                // =========================================
                // WELCOME CARD
                // =========================================

                Card(

                  elevation: 4,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Container(

                    height: 150,

                    width: double.infinity,

                    decoration: BoxDecoration(

                      borderRadius:
                      BorderRadius.circular(16),

                      color: Color(0xff1D4EDB),
                    ),

                    child: Padding(

                      padding: const EdgeInsets.all(20),

                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          SizedBox(height: 20),

                          Text(
                            'Welcome, Tailor',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            'Manage your customers and\nmeasurements easily',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 20),


                // =========================================
                // SEARCH
                // =========================================

                TextFormField(

                  controller: searchController,

                  onChanged: (value) {

                    setState(() {
                      searchText = value;
                    });

                  },

                  decoration: InputDecoration(

                    suffixIcon: Icon(
                      Icons.filter_list_alt,
                      color: iconecolor,
                    ),

                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: iconecolor,
                    ),

                    hintText: 'Search Customer...',

                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: hinttextcolor,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),
                ),


                SizedBox(height: 20),


                // =========================================
                // CUSTOMER TITLE
                // =========================================

                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      'Customers',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0F172A),
                        fontSize: 16,
                      ),
                    ),

                    Text(
                      'Total(${customers.length})',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff475569),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 10),


                // =========================================
                // CUSTOMER LIST
                // =========================================

                filteredCustomers.isEmpty

                    ? Padding(

                  padding:
                  const EdgeInsets.only(top: 50),

                  child: Column(

                    children: [

                      Icon(
                        Icons.people_outline,
                        size: 60,
                        color: Colors.grey.shade400,
                      ),

                      SizedBox(height: 10),

                      Text(
                        searchText.isEmpty
                            ? 'No customers yet'
                            : 'Customer not found',

                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 5),

                      if (searchText.isEmpty)

                        Text(
                          'Tap + to add a customer',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                )

                    : Column(

                  children: [

                    ...filteredCustomers.map(

                          (customer) {

                        return Padding(

                          padding:
                          const EdgeInsets.only(
                            bottom: 10,
                          ),

                          child: Card(

                            elevation: 4,

                            shadowColor:
                            Colors.black12,

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                  16),
                            ),

                            child: Container(

                              height: 90,

                              width:
                              double.infinity,

                              decoration:
                              BoxDecoration(

                                color: cardcolor,

                                borderRadius:
                                BorderRadius
                                    .circular(16),
                              ),

                              child: ListTile(

                                // =================================
                                // ID
                                // =================================

                                leading: CircleAvatar(

                                  radius: 24,

                                  backgroundColor:
                                  Color(0xffDBEAFE),

                                  child: Text(

                                    '${customer.id}',

                                    style: TextStyle(

                                      color:
                                      Color(0xff2563EB),

                                      fontWeight:
                                      FontWeight.bold,

                                      fontSize: 16,
                                    ),
                                  ),
                                ),


                                // =================================
                                // NAME
                                // =================================

                                title: Text(

                                  customer.name.isEmpty
                                      ? 'No Name'
                                      : customer.name,

                                  style: TextStyle(

                                    fontFamily:
                                    'Poppins',

                                    fontWeight:
                                    FontWeight.w600,

                                    color:
                                    titlecolor,

                                    fontSize: 16,
                                  ),
                                ),


                                // =================================
                                // PHONE
                                // =================================

                                subtitle: Padding(

                                  padding:
                                  const EdgeInsets
                                      .only(top: 5),

                                  child: Text(

                                    '📞 ${customer.phone}',

                                    style: TextStyle(

                                      fontFamily:
                                      'Poppins',

                                      fontSize: 13,

                                      fontWeight:
                                      FontWeight.w400,

                                      color:
                                      Color(0xff64748B),
                                    ),
                                  ),
                                ),


                                // =================================
                                // ARROW
                                // =================================

                                trailing: Icon(

                                  Icons
                                      .arrow_forward_ios,

                                  size: 18,

                                  color:
                                  Color(0xff64748B),
                                ),


                                // =================================
                                // OPEN DETAILS
                                // =================================

                                onTap: () async {
                                  CustomerModel? updatedCustomer = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomerDetails(
                                        customer: customer,
                                      ),
                                    ),
                                  );

                                  if (updatedCustomer != null) {
                                    setState(() {
                                      int index = customers.indexWhere(
                                            (c) => c.id == updatedCustomer.id,
                                      );

                                      if (index != -1) {
                                        customers[index] = updatedCustomer;
                                      }
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),


        // =================================================
        // BOTTOM NAVIGATION
        // =================================================

        bottomNavigationBar:
        BottomNavigationBar(

          items: [

            BottomNavigationBarItem(

              icon: Icon(
                Icons.home,
                color: iconecolor,
                size: 24,
              ),

              label: 'Home',
            ),

            BottomNavigationBarItem(

              icon: Icon(
                Icons.person,
                color: iconecolor,
                size: 24,
              ),

              label: 'Customers',
            ),

            BottomNavigationBarItem(

              icon: Icon(
                Icons.settings,
                color: iconecolor,
                size: 24,
              ),

              label: 'Settings',
            ),
          ],
        ),


        // =================================================
        // ADD CUSTOMER BUTTON
        // =================================================

        floatingActionButton:
        FloatingActionButton(

          backgroundColor: bluecolor,

          foregroundColor: Colors.white,

          shape: const CircleBorder(),

          onPressed: addCustomer,

          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}























// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'package:tailor_manegment/add_customer.dart';
// import 'package:tailor_manegment/componenets.dart';
// import 'package:tailor_manegment/customer_details.dart';
// import 'package:tailor_manegment/models/customer_model.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   // =====================================================
//   // CUSTOMERS LIST
//   // =====================================================
//
//   List<CustomerModel> customers = [];
//
//
//   // =====================================================
//   // SEARCH CONTROLLER
//   // =====================================================
//
//   final TextEditingController searchController =
//   TextEditingController();
//
//
//   // =====================================================
//   // SEARCH TEXT
//   // =====================================================
//
//   String searchText = '';
//
//
//   // =====================================================
//   // ADD CUSTOMER
//   // =====================================================
//
//   Future<void> addCustomer() async {
//
//     CustomerModel? customer = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const AddCustomer(),
//       ),
//     );
//
//     if (customer != null) {
//
//       setState(() {
//
//         // Unique ID
//         customer.id = customers.length + 1;
//
//         customers.add(customer);
//
//       });
//
//     }
//   }
//
//
//   // =====================================================
//   // SEARCH CUSTOMERS
//   // =====================================================
//
//   List<CustomerModel> get filteredCustomers {
//
//     if (searchText.isEmpty) {
//       return customers;
//     }
//
//     return customers.where((customer) {
//
//       return customer.name
//           .toLowerCase()
//           .contains(searchText.toLowerCase()) ||
//
//           customer.phone
//               .toLowerCase()
//               .contains(searchText.toLowerCase());
//
//     }).toList();
//   }
//
//
//   // =====================================================
//   // DISPOSE
//   // =====================================================
//
//   @override
//   void dispose() {
//
//     searchController.dispose();
//
//     super.dispose();
//   }
//
//
//   // =====================================================
//   // BUILD
//   // =====================================================
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//        child: Scaffold(
//          appBar: AppBar(
//            backgroundColor: Colors.white,
//            iconTheme: const IconThemeData(
//              color: Color(0xff0F172A), // Drawer icon color
//            ),
//            actions: [
//              Icon(Icons.notifications_none,color: Color(0xff0F172A),),
//              SizedBox(width: 20,)
//            ],
//            title: Text('Tailor App',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Color(0xff0F172A),),
//          ),),
//          drawer: Drawer(
//            shadowColor: Colors.black,
//            surfaceTintColor: Colors.black,
//            backgroundColor: Colors.blue,
//          ),
//          body: SingleChildScrollView(
//            child: Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 20.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Card(
//                      elevation: 4,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(16),
//                      ),
//                      child: Container(
//                      height: 150,
//                      width: double.infinity,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(16),
//                        color: Color(0xff1D4EDB)
//                      ),
//                      child: Center(
//                        child: Padding(
//                          padding: const EdgeInsets.all(20),
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: [
//                              SizedBox(height: 20,),
//                              Text('Welcome, Tailor',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 18),),
//                              SizedBox(height: 10,),
//                              Text('Manage your customers and\nmeasurments easily',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color(0xffFFFFFF),fontSize: 14),)
//                            ],
//                          ),
//                        ),
//                      ),
//                    )
//                  ),
//                  SizedBox(height: 20,),
//                  TextFormField(
//                    controller: searchController,
//                    onChanged: (value){
//                      setState(() {
//                        searchText=value;
//                      });
//                    },
//                    decoration:InputDecoration(
//                        suffixIcon: Icon(Icons.filter_list_alt,color: iconecolor),
//                        prefixIcon: Icon(CupertinoIcons.search,color: iconecolor,),
//                        hintText: 'Search Customer...',
//                        hintStyle: TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: hinttextcolor),
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(10)
//                        )
//                    ),
//                  ),
//                  SizedBox(height: 20,),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text('Customers',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Color(0xff0F172A),fontSize: 16),),
//                      Text('Total(${customers.length})',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Color(0xff475569),fontSize: 14),),
//                    ],
//                  ),
//                  SizedBox(height: 10,),
//                  Column(
//                    children: [
//                      Card(
//                          elevation: 4,
//                          shadowColor: Colors.black12,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(16),
//                          ),
//                          child: Container(
//                            height: 90,
//                            width: double.infinity,
//                            decoration: BoxDecoration(
//                              color: cardcolor,
//                                borderRadius: BorderRadius.circular(16),
//                            ),
//                            child: ListTile(
//                              leading: CircleAvatar(
//                                radius: 24,
//                                backgroundColor: Color(0xffDBEAFE),
//                                child: const Icon(
//                                  Icons.person,
//                                  color: Color(0xff2563EB),
//                                  size: 28,
//                                ),
//                              ),
//                              title: Text('Ali Khan',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: titlecolor,fontSize: 16),),
//                              subtitle: const Padding(
//                                padding: EdgeInsets.only(top: 5), child: Text("📞 0300-1234567",
//                                  style: TextStyle(fontFamily: "Poppins", fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xff64748B),
//                                  ),
//                                ),
//                              ),
//                              trailing: Icon(
//                                Icons.arrow_forward_ios,size: 18,color: Color(0xff64748B),
//                              ),
//                              onTap: () {},
//                            ),
//                          )
//                      ),
//
//                    ],
//                  )
//                ],
//              ),
//            ),
//          ),
//          bottomNavigationBar: BottomNavigationBar(
//            items: [
//              BottomNavigationBarItem(
//                  icon: Icon(
//                    Icons.home,color: iconecolor,size: 24,),
//                label:'Home',
//              ),
//              BottomNavigationBarItem(
//                  icon: Icon(
//                    Icons.person,color: iconecolor,size: 24,),
//                label:'Customers',
//
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(
//                  Icons.settings,color: iconecolor,size: 24,),
//                label:'Settings',
//              ),
//            ],
//          ),
//          floatingActionButton: FloatingActionButton(
//            backgroundColor: bluecolor,
//            foregroundColor: Colors.white,
//            shape: const CircleBorder(),
//            onPressed: () {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddCustomer()));
//            },
//
//            child: const Icon(Icons.add),
//          ),
//
//        ),
//      );
//    }
//  }
//
