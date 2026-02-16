import 'package:coders_adda_app/models/course_model.dart';
import 'package:flutter/material.dart';

class CourseViewModel with ChangeNotifier {
  List<Course> _allCourses = [];
  List<CourseCategory> _categories = [];
  String _selectedTechnology = 'All';
  late TabController _tabController;


  TabController get tabController => _tabController;


  CourseViewModel() {
    _loadDemoData();
  }

  void initializeTabController(TickerProvider vsync) {
    _tabController = TabController(length: 2, vsync: vsync);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      _selectedTabIndex = _tabController.index;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  int _selectedTabIndex = 0;

  List<Course> get allCourses => _allCourses;
  List<CourseCategory> get categories => _categories;
  String get selectedTechnology => _selectedTechnology;
  int get selectedTabIndex => _selectedTabIndex;

  List<Course> get freeCourses => _allCourses.where((course) => course.isFree).toList();
  List<Course> get paidCourses => _allCourses.where((course) => !course.isFree).toList();

  List<Course> get filteredCourses {
    if (_selectedTechnology == 'All') {
      return _selectedTabIndex == 0 ? freeCourses : paidCourses;
    }
    
    final courses = _selectedTabIndex == 0 ? freeCourses : paidCourses;
    return courses.where((course) => course.technology == _selectedTechnology).toList();
  }
  void _loadDemoData() {

    _categories = [
      CourseCategory(
        name: 'All',
        technology: 'All',
        courseCount: 12,
        icon: '📚',
      ),
      CourseCategory(
        name: 'Flutter',
        technology: 'Flutter',
        courseCount: 5,
        icon: '📱',
      ),
      CourseCategory(
        name: 'Android',
        technology: 'Android',
        courseCount: 3,
        icon: '🤖',
      ),
      CourseCategory(
        name: 'Web Dev',
        technology: 'Web',
        courseCount: 2,
        icon: '🌐',
      ),
      CourseCategory(
        name: 'AI/ML',
        technology: 'AI',
        courseCount: 2,
        icon: '🧠',
      ),
    ];


    _allCourses = [
  Course(
    id: '1',
    title: 'Introduction to Flutter',
    description: 'Learn the basics of Flutter development with Dart programming language. Perfect for beginners.',
    instructor: 'Sarah Wilson',
    price: 0,
    thumbnail: 'https://images.unsplash.com/photo-1551650975-87deedd944c3?w=400&h=250&fit=crop', // Flutter mobile development
    category: 'Mobile Development',
    technology: 'Flutter', 
    isFree: true,
    rating: 4.5,
    totalStudents: 1500,
    duration: '6 hours',
    totalLessons: 12,
    createdAt: DateTime.now().subtract(Duration(days: 30)), 
  ),
  Course(
    id: '2',
    title: 'Basics of HTML & CSS',
    description: 'Start your web development journey with HTML and CSS fundamentals.',
    instructor: 'Mike Chen',
    price: 0,
    thumbnail: 'https://images.unsplash.com/photo-1507238691740-187a5b1d37b8?w=400&h=250&fit=crop', // Web development code
    category: 'Web Development',
    technology: 'Web', 
    isFree: true,
    rating: 4.2,
    totalStudents: 2300,
    duration: '8 hours',
    totalLessons: 15,
    createdAt: DateTime.now().subtract(Duration(days: 45)), 
  ),
  Course(
    id: '3',
    title: 'Python for Beginners',
    description: 'Learn Python programming fundamentals and build your first projects.',
    instructor: 'Emily Davis',
    price: 0,
    thumbnail: 'https://images.unsplash.com/photo-1526379879527-8559ecfcaec0?w=400&h=250&fit=crop', // Python code
    category: 'Programming',
    technology: 'AI', 
    isFree: true,
    rating: 4.7,
    totalStudents: 3200,
    duration: '10 hours',
    totalLessons: 18,
    createdAt: DateTime.now().subtract(Duration(days: 60)), 
  ),
  Course(
    id: '4',
    title: 'Advanced Flutter Development',
    description: 'Master advanced Flutter concepts, state management, and architecture patterns.',
    instructor: 'Sarah Wilson',
    price: 1999,
    thumbnail: 'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=400&h=250&fit=crop', // Advanced Flutter
    category: 'Mobile Development',
    technology: 'Flutter', 
    isFree: false,
    rating: 4.8,
    totalStudents: 800,
    duration: '15 hours',
    totalLessons: 25,
    createdAt: DateTime.now().subtract(Duration(days: 20)), 
  ),
  Course(
    id: '5',
    title: 'Complete Android Masterclass',
    description: 'Become an expert Android developer with Kotlin and modern Android development.',
    instructor: 'Raj Kumar',
    price: 1499,
    thumbnail: 'https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?w=400&h=250&fit=crop', // Android development
    category: 'Mobile Development',
    technology: 'Android', 
    isFree: false,
    rating: 4.6,
    totalStudents: 1200,
    duration: '20 hours',
    totalLessons: 30,
    createdAt: DateTime.now().subtract(Duration(days: 15)), 
  ),
  Course(
    id: '6',
    title: 'Machine Learning with Python',
    description: 'Learn ML algorithms, data preprocessing, and model deployment.',
    instructor: 'Dr. Anjali Sharma',
    price: 2999,
    thumbnail: 'https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=400&h=250&fit=crop', // Machine learning
    category: 'Data Science',
    technology: 'AI', 
    isFree: false,
    rating: 4.9,
    totalStudents: 600,
    duration: '25 hours',
    totalLessons: 35,
    createdAt: DateTime.now().subtract(Duration(days: 10)), 
  ),
];

    notifyListeners();
  }

  void setSelectedTechnology(String technology) {
    _selectedTechnology = technology;
    notifyListeners();
  }

  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  List<CourseModule> getCourseModules(String courseId) {

    return [
      CourseModule(
        id: '1',
        title: 'Introduction to Course',
        duration: '45 min',
        lessonCount: 3,
        isLocked: false,
        lessons: [
          CourseLesson( 
            id: '1',
            title: 'Welcome to the Course',
            duration: '10 min',
            videoUrl: 'https://example.com/video1.mp4',
            isFree: true,
          ),
          CourseLesson( 
            id: '2',
            title: 'Course Overview',
            duration: '15 min',
            videoUrl: 'https://example.com/video2.mp4',
            isFree: true,
          ),
          CourseLesson( 
            id: '3',
            title: 'Setup Development Environment',
            duration: '20 min',
            videoUrl: 'https://example.com/video3.mp4',
            isFree: false,
          ),
        ],
      ),
      CourseModule(
        id: '2',
        title: 'Core Concepts',
        duration: '2 hours',
        lessonCount: 5,
        isLocked: true,
        lessons: [
          CourseLesson( 
            id: '4',
            title: 'Understanding Widgets',
            duration: '25 min',
            videoUrl: 'https://example.com/video4.mp4',
            isFree: false,
          ),
          CourseLesson( 
            id: '5',
            title: 'State Management',
            duration: '30 min',
            videoUrl: 'https://example.com/video5.mp4',
            isFree: false,
          ),
        ],
      ),
    ];
  }
}