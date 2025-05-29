class AddInventoryRequestModel {
  final String name;
  final String address;
  final List<String> rowsName;

  AddInventoryRequestModel({
    required this.name,
    required this.address,
    required this.rowsName
  });
  

  Map<String,dynamic> toJson() {
    return {
      'name' : name,
      'address' : address,
      'rowsName' : rowsName
    };
  }   
}
