
class ProductModel{
  String? productname;
  double? price;
  double? qty;
  DateTime? createTime;
  String? id;
  bool delete;
  List? photo=[];

  ProductModel({
    required this.productname,
    required this.price,
    required this.qty,
    required this.createTime,
    required this.id,
    required this.delete,
    required this.photo,
  });

  Map<String,dynamic> toMap(){
    final Map<String,dynamic> data=<String,dynamic>{};
    data['productname']= productname;
    data['price']= price;
    data['qty']= qty;
    data['createTime']=createTime;
    data['id']=id;
    data['delete']=delete;
    data['photo']=photo;
    return data;
  }
  ProductModel.fromMap(Map<String, dynamic> map)
      : productname = map['productname'],
        price = map['price'],
        qty = map['qty'],
        createTime = (map['createTime']).toDate(),
        id = map['id'],
        delete = map['delete'],
        photo= map['photo'];

  ProductModel copyWith({
    String? productname ,
    double? price,
    double? qty,
    DateTime? createTime,
    String? id,
    bool? delete,
    List? photo

  })=> ProductModel(
      productname: productname??this.productname,
      price: price??this.price,
      qty: qty??this.qty,
      createTime: createTime??this.createTime,
      id: id??this.id,
      delete: delete??this.delete,
      photo: photo??this.photo
  );
}