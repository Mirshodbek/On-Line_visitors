class Data {
  final String title;
  final String image;

  Data(this.title, this.image);
}

class InnerList {
  final String name;
  List<String> children;

  InnerList({this.name, this.children});
}

class Country {
  final String country;

  Country(this.country);
}

List<Country> buxoroList = [
  Country('Buxoro tumani Davlat xizmatlari markazi'),
  Country('Gʻijduvon tumani Davlat xizmatlari markazi'),
  Country('Buxoro shahar Davlat xizmatlari markazi'),
  Country('Vobkent tumani Davlat xizmatlari markazi'),
];

List<Country> andijonList = [
  Country('Andijon shahar Davlat xizmatlari markazi'),
  Country('Baliqchi tuman Davlat xizmatlari markazi'),
  Country('Andijon tuman Davlat xizmatlari markazi'),
  Country('Asaka tuman Davlat xizmatlari markazi'),
];

List<Country> toshkentList = [
  Country('Angren shahar Davlat xizmatlari markazi'),
  Country('Bekobod tuman Davlat xizmatlari markazi'),
  Country('Bekobod shahar Davlat xizmatlari markazi'),
  Country('Boʻka tuman Davlat xizmatlari markazi'),
];

List<Country> samarqandList = [
  Country('Bulungʻur tuman Davlat xizmatlari markazi'),
  Country('Ishtixon tuman Davlat xizmatlari markazi'),
  Country('Jomboy tuman Davlat xizmatlari markazi'),
  Country('Vobkent tumani Davlat xizmatlari markazi'),
];

List<List<Country>> countryList = [
  buxoroList,
  andijonList,
  toshkentList,
  samarqandList
];

List<String> headerValue = [
  'Buxoro Viloyati',
  'Andijon Viloyati',
  'Toshkent Viloyati',
  'Samarqand Viloyati',
];

List<String> buxoro = [
  'Buxoro tumani Davlat xizmatlari markazi',
  'Gʻijduvon tumani Davlat xizmatlari markazi',
  'Buxoro shahar Davlat xizmatlari markazi',
  'Vobkent tumani Davlat xizmatlari markazi',
];
List<String> andijon = [
  'Andijon shahar Davlat xizmatlari markazi',
  'Baliqchi tuman Davlat xizmatlari markazi',
  'Andijon tuman Davlat xizmatlari markazi',
  'Asaka tuman Davlat xizmatlari markazi'
];
List<String> toshkent = [
  'Angren shahar Davlat xizmatlari markazi',
  'Bekobod tuman Davlat xizmatlari markazi',
  'Bekobod shahar Davlat xizmatlari markazi',
  'Boʻka tuman Davlat xizmatlari markazi',
];
List<String> andijons = [
  'Bulungʻur tuman Davlat xizmatlari markazi',
  'Ishtixon tuman Davlat xizmatlari markazi',
  'Jomboy tuman Davlat xizmatlari markazi',
  'Kattaqoʻrgʻon tuman Davlat xizmatlari markazi'
];

List<List<String>> country = [buxoro, andijon, toshkent, andijons];
