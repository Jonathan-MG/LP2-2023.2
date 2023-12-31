class ImageModel {
  late String url;
  late String alt;
  ImageModel(this.url, this.alt); //Construtor
  //Construtores nomeados
  ImageModel.fromJSON(Map<String, dynamic> decodedJSON) {
    url = decodedJSON["photos"][0]["src"]["portrait"];
    alt = decodedJSON['photos'][0]['alt'];
  }
  @override
  String toString() {
    return 'url: $url,\nalt: $alt';
  }
}
