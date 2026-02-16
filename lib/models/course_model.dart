class Course {
  final String id;
  final String title;
  final String description;
  final String instructor;
  final double price;
  final String thumbnail;
  final String category;
  final String technology;
  final bool isFree;
  final double rating;
  final int totalStudents;
  final String duration;
  final int totalLessons;
  final DateTime createdAt;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.price,
    required this.thumbnail,
    required this.category,
    required this.technology,
    required this.isFree,
    this.rating = 0.0,
    this.totalStudents = 0,
    required this.duration,
    this.totalLessons = 0,
    required this.createdAt,
  });
}

class CourseCategory {
  final String name;
  final String technology;
  final int courseCount;
  final String icon;

  CourseCategory({
    required this.name,
    required this.technology,
    required this.courseCount,
    required this.icon,
  });
}

class CourseModule {
  final String id;
  final String title;
  final String duration;
  final int lessonCount;
  final bool isLocked;
  final List<CourseLesson> lessons;

  CourseModule({
    required this.id,
    required this.title,
    required this.duration,
    required this.lessonCount,
    this.isLocked = false,
    required this.lessons,
  });
}

class CourseLesson {
  final String id;
  final String title;
  final String duration;
  final String videoUrl;
  final bool isFree;
  final bool isCompleted;

  CourseLesson({
    required this.id,
    required this.title,
    required this.duration,
    required this.videoUrl,
    this.isFree = false,
    this.isCompleted = false,
  });
}
