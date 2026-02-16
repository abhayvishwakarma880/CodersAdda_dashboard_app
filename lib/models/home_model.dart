class HomeModel {
  final List<BannerItem> banners;
  final List<Course> coursesOnSale;
  final List<Course> freeCourses;
  final List<PdfItem> freePdfs;
  final List<PdfItem> paidPdfs;
  final List<Job> jobs;

  HomeModel({
    required this.banners,
    required this.coursesOnSale,
    required this.freeCourses,
    required this.freePdfs,
    required this.paidPdfs,
    required this.jobs,
  });
}

class BannerItem {
  final String title;
  final String subtitle;
  final String route;
  final String? imageUrl;

  BannerItem({
    required this.title,
    required this.subtitle,
    required this.route,
    this.imageUrl,
  });
}

class Course {
  final String id;
  final String title;
  final String instructor;
  final double price;
  final String thumbnail;
  final bool isFree;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.price,
    required this.thumbnail,
    this.isFree = false,
  });
}

class PdfItem {
  final String id;
  final String title;
  final String size;
  final bool isFree;

  PdfItem({
    required this.id,
    required this.title,
    required this.size,
    this.isFree = false,
  });
}

class Job {
  final String id;
  final String title;
  final String company;
  final bool isPremium;

  Job({
    required this.id,
    required this.title,
    required this.company,
    this.isPremium = false,
  });
}