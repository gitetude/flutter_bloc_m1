class TextPrixDistModel{
  final int id;
  final String type;
  final String description;
  final String? date;
  final String? dateFin;

  TextPrixDistModel({
    required this.id,
    required this.type,
    required this.description,
    this.date,
    this.dateFin});

factory TextPrixDistModel.fromJson(Map<String,dynamic> json) {
 return  TextPrixDistModel(
   id: json['id'],
   type: json['type'],
   description: json['description'],
   date: json['date'],
   dateFin: json['dateFin']

 );
}
}