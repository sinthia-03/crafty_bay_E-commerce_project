// {
// "_id": "67c35ee45e8a445235de1a67",
// "title": "Redmi A3X",
//
// "photos":[
//   "https://cdn.ostad.app/public/upload/2023-06-22T06-40-41.054Z-code-box-line.png"
// ]
// 'current_price':12000
// }
// }

class ProductModel {
  final String id;
  final String title;
  final List<String> photos;
  final int price;
  final double rating;
 ProductModel({
   required this.id,
   required this.title,
   required this.photos,
   required this.price,
   required this.rating
 });

 factory ProductModel.fromJson(Map<String, dynamic> jsonData){
   return ProductModel(id: jsonData['_id'],
       title: jsonData['title'],
       photos: List.from(jsonData['photos']),
       price: jsonData['current_price'],
       rating: 4.0
   );
 }



}