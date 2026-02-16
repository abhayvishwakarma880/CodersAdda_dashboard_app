class UserProfile {
  final  String name;
  final String email;
  final String phone;
  final String avatar;
  final String collegeName;
  final String course;
  final String semester;
  final String technology;
  final String skills;
  final String bio;
  final String githubUrl;
  final String linkedinUrl;
  final String portfolioUrl;
  final DateTime joinDate;
  final int completedCourses;
  final int ongoingCourses;
  final double learningProgress;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.collegeName,
    required this.course,
    required this.semester,
    required this.technology,
    required this.skills,
    required this.bio,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.portfolioUrl,
    required this.joinDate,
    this.completedCourses = 0,
    this.ongoingCourses = 0,
    this.learningProgress = 0.0,
  });
}

class Achievement {
  final String title;
  final String description;
  final String icon;
  final DateTime achievedAt;

  Achievement({
    required this.title,
    required this.description,
    required this.icon,
    required this.achievedAt,
  });
}