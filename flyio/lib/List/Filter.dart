class Filter {
  static const String By_Price = 'By Price';
  static const String By_Duration = 'By Duration';
  static const String By_Arrival_Time = 'By Arrival Time';
  static const String By_Departure_Time = 'By Departure Time';

  static const List<String> choices = <String>
  [
    By_Price,
    By_Duration,
    By_Departure_Time,
    By_Arrival_Time
  ];
}