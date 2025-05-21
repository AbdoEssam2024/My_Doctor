class TimesOverViewModel {
  String date;
  String day;
  bool available;

  TimesOverViewModel({
    required this.date,
    required this.day,
    this.available = false,
  });
}

class AvailableDoctorsModel {
  String name;
  String startTime;
  String endTime;
  String specialization;

  AvailableDoctorsModel({
    required this.name,
    required this.specialization,
    required this.startTime,
    required this.endTime,
  });
}

class TopRatingDoctorsModel {
  String name;
  String specialization;
  String imagePath;
  String rating;
  bool isFavourite;

  TopRatingDoctorsModel({
    required this.name,
    required this.specialization,
    required this.imagePath,
    required this.rating,
    required this.isFavourite,
  });
}
