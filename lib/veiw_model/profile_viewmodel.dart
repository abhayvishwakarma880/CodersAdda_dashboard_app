import 'package:coders_adda_app/models/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileViewModel with ChangeNotifier {
  UserProfile _user = UserProfile(
    name: "Abc",
    email: "abc@email.com",
    phone: "+91 1234567890",
    avatar: "https://i.pravatar.cc/300",
    collegeName: "Indian Institute of Technology, Delhi",
    course: "B.Tech Computer Science",
    semester: "6th Semester",
    technology: "Flutter, Android, Web Development",
    skills: "Dart, Java, Python, JavaScript, React, Node.js",
    bio: "Passionate mobile app developer with expertise in Flutter and Android. Love building innovative solutions and learning new technologies.",
    githubUrl: "https://github.com/alexjohnson",
    linkedinUrl: "https://linkedin.com/in/alexjohnson",
    portfolioUrl: "https://alexjohnson.dev",
    joinDate: DateTime.now().subtract(Duration(days: 180)),
    completedCourses: 8,
    ongoingCourses: 3,
    learningProgress: 0.75,
  );

  List<Achievement> _achievements = [
    Achievement(
      title: "Flutter Expert",
      description: "Completed Advanced Flutter Development Course",
      icon: "🎯",
      achievedAt: DateTime.now().subtract(Duration(days: 30)),
    ),
    Achievement(
      title: "Top Performer",
      description: "Scored 95% in Programming Fundamentals",
      icon: "🏆",
      achievedAt: DateTime.now().subtract(Duration(days: 60)),
    ),
    Achievement(
      title: "Project Master",
      description: "Built 5+ Real World Applications",
      icon: "🚀",
      achievedAt: DateTime.now().subtract(Duration(days: 90)),
    ),
  ];

  bool _notificationsEnabled = true;

  UserProfile get user => _user;
  List<Achievement> get achievements => _achievements;
  bool get notificationsEnabled => _notificationsEnabled;

  void updateProfile(UserProfile newProfile) {
    _user = newProfile;
    notifyListeners();
  }

  void toggleNotifications(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  int get totalLearningHours {
    return (user.completedCourses * 20) + (user.ongoingCourses * 10);
  }

  String get memberSince {
    final months = DateTime.now().difference(user.joinDate).inDays ~/ 30;
    return '$months months';
  }


   // Edit Profile Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController technologyController = TextEditingController();
  TextEditingController githubController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController portfolioController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController avatarController = TextEditingController();
  
  bool initialized = false;

  void initializeWithUser(UserProfile user) {
    if (initialized) return;
    
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone;
    collegeController.text = user.collegeName;
    courseController.text = user.course;
    semesterController.text = user.semester;
    technologyController.text = user.technology;
    githubController.text = user.githubUrl;
    linkedinController.text = user.linkedinUrl;
    portfolioController.text = user.portfolioUrl;
    bioController.text = user.bio;
    avatarController.text = user.avatar;
    
    initialized = true;
    notifyListeners();
  }

  // Don't forget to dispose controllers
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    collegeController.dispose();
    courseController.dispose();
    semesterController.dispose();
    technologyController.dispose();
    githubController.dispose();
    linkedinController.dispose();
    portfolioController.dispose();
    bioController.dispose();
    avatarController.dispose();
    super.dispose();
  }
}