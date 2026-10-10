//                  CUSTOMER MODEL                     //
class CustomerModel {
  //                  CUSTOMER DETAILS                 //
  int id;
  String name;
  String phone;
  String address;
  //                    MEASUREMENTS                   //
  String shirtLength;
  String shoulder;
  String chest;
  String waist;
  String hip;
  String sleeve;
  String collar;
  String bottom;
  String trouserLength;
  String notes;

  //              ADDITIONAL INFORMATION               //String notes;
  //                    CONSTRUCTOR                    //
  CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,

    required this.shirtLength,
    required this.shoulder,
    required this.chest,
    required this.waist,
    required this.hip,
    required this.sleeve,
    required this.collar,
    required this.bottom,
    required this.trouserLength,
    required this.notes,
  });
}