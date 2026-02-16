import 'package:coders_adda_app/models/course_model.dart';
import 'package:coders_adda_app/utils/app_colors/app_theme.dart';
import 'package:coders_adda_app/utils/app_sizer/app_sizer.dart';
import 'package:coders_adda_app/views/buy_new_courses_pages/course_purchase_page.dart';
import 'package:flutter/material.dart';

class AllCourseDetailPage extends StatelessWidget {
  final Course course;

  const AllCourseDetailPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header with Course Image
          SliverAppBar(
            expandedHeight: AppSizer.deviceHeight30,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildCourseHeaderImage(),
            ),
            pinned: true,
            actions: [
              // IconButton(
              //   icon: Icon(Icons.share),
              //   onPressed: () {},
              // ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),

          // Course Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppSizer.deviceWidth4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Title and Price Tag
                  _buildCourseTitleSection(),
                  
                  SizedBox(height: AppSizer.deviceHeight2),
                  
                  // Instructor Info
                  _buildInstructorSection(),
                  
                  SizedBox(height: AppSizer.deviceHeight3),
                  
                  // Course Description
                  _buildCourseDescription(),
                  
                  SizedBox(height: AppSizer.deviceHeight3),
                  
                  // What You'll Learn
                  _buildLearningOutcomes(),
                  
                  SizedBox(height: AppSizer.deviceHeight3),
                  
                  // Course Curriculum
                  _buildCourseCurriculum(),
                  
                  SizedBox(height: AppSizer.deviceHeight4),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // Fixed Bottom Action Button
      bottomNavigationBar: _buildBottomActionButton(context),
    );
  }

  Widget _buildCourseHeaderImage() {
    return Stack(
      children: [
        // Course Image
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            image: course.thumbnail.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(course.thumbnail),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: course.thumbnail.isEmpty
              ? Center(
                  child: Icon(
                    Icons.play_circle_filled,
                    color: AppColors.primaryColor,
                    size: AppSizer.deviceSp48,
                  ),
                )
              : null,
        ),
        
        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
            ),
          ),
        ),
        
        // Paid Tag - Only for paid courses
        if (!course.isFree)
          Positioned(
            top: AppSizer.deviceHeight2,
            right: AppSizer.deviceWidth4,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizer.deviceWidth3,
                vertical: AppSizer.deviceHeight0_5,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.workspace_premium,
                    color: Colors.white,
                    size: AppSizer.deviceSp12,
                  ),
                  SizedBox(width: AppSizer.deviceWidth1),
                  Text(
                    'PAID',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizer.deviceSp10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCourseTitleSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Title
              Text(
                course.title,
                style: TextStyle(
                  fontSize: AppSizer.deviceSp20,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              
              SizedBox(height: AppSizer.deviceHeight1),
              
              // Course Meta Info
              Row(
                children: [
                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: AppSizer.deviceSp16),
                      SizedBox(width: AppSizer.deviceWidth1),
                      Text(
                        '${course.rating}',
                        style: TextStyle(fontSize: AppSizer.deviceSp14),
                      ),
                    ],
                  ),
                  
                  SizedBox(width: AppSizer.deviceWidth3),
                  
                  // Students
                  Row(
                    children: [
                      Icon(Icons.people, color: AppColors.onSurfaceVariant, size: AppSizer.deviceSp16),
                      SizedBox(width: AppSizer.deviceWidth1),
                      Text(
                        '${course.totalStudents}',
                        style: TextStyle(fontSize: AppSizer.deviceSp14),
                      ),
                    ],
                  ),
                  
                  SizedBox(width: AppSizer.deviceWidth3),
                  
                  // Duration
                  Row(
                    children: [
                      Icon(Icons.schedule, color: AppColors.onSurfaceVariant, size: AppSizer.deviceSp16),
                      SizedBox(width: AppSizer.deviceWidth1),
                      Text(
                        course.duration,
                        style: TextStyle(fontSize: AppSizer.deviceSp14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Price Display - Right Side
        if (!course.isFree)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizer.deviceWidth3,
              vertical: AppSizer.deviceHeight1,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(AppSizer.deviceWidth2),
            ),
            child: Column(
              children: [
                Text(
                  '₹${course.price}',
                  style: TextStyle(
                    fontSize: AppSizer.deviceSp18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  course.duration.contains('Year') ? 'per year' : 'one-time',
                  style: TextStyle(
                    fontSize: AppSizer.deviceSp10,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildInstructorSection() {
    return Container(
      padding: EdgeInsets.all(AppSizer.deviceWidth4),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSizer.deviceWidth3),
      ),
      child: Row(
        children: [
          // Instructor Avatar
          Container(
            width: AppSizer.deviceWidth12,
            height: AppSizer.deviceWidth12,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                course.instructor.split(' ').map((e) => e[0]).take(2).join(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizer.deviceSp14,
                ),
              ),
            ),
          ),
          
          SizedBox(width: AppSizer.deviceWidth3),
          
          // Instructor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instructor',
                  style: TextStyle(
                    fontSize: AppSizer.deviceSp12,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: AppSizer.deviceHeight0_5),
                Text(
                  course.instructor,
                  style: TextStyle(
                    fontSize: AppSizer.deviceSp14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          
          // View Profile Button
          TextButton(
            onPressed: () {
              // Navigate to instructor profile
            },
            child: Text(
              'View More',
              style: TextStyle(
                fontSize: AppSizer.deviceSp12,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About This Course',
          style: TextStyle(
            fontSize: AppSizer.deviceSp18,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        SizedBox(height: AppSizer.deviceHeight1),
        
        Text(
          course.description,
          style: TextStyle(
            fontSize: AppSizer.deviceSp15,
            color: AppColors.onSurfaceVariant,
            height: 1.6,
          ),
        ),
        
        SizedBox(height: AppSizer.deviceHeight2),
        
        // Course Stats
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem('${course.totalLessons}', 'Lessons'),
            _buildStatItem(course.duration, 'Duration'),
            _buildStatItem(course.category, 'Category'),
            _buildStatItem(course.technology, 'Technology'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: AppSizer.deviceSp16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: AppSizer.deviceHeight0_5),
        Text(
          label,
          style: TextStyle(
            fontSize: AppSizer.deviceSp13,
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildLearningOutcomes() {
    final outcomes = [
      'Build real-world applications',
      'Understand core concepts deeply',
      'Master best practices',
      'Prepare for job interviews',
      'Work on practical projects'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What You\'ll Learn',
          style: TextStyle(
            fontSize: AppSizer.deviceSp18,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        SizedBox(height: AppSizer.deviceHeight2),
        
        Wrap(
          spacing: AppSizer.deviceWidth2,
          runSpacing: AppSizer.deviceHeight1,
          children: outcomes.map((outcome) => Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizer.deviceWidth3,
              vertical: AppSizer.deviceHeight1,
            ),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.successColor,
                  size: AppSizer.deviceSp14,
                ),
                SizedBox(width: AppSizer.deviceWidth1),
                Text(
                  outcome,
                  style: TextStyle(fontSize: AppSizer.deviceSp14),
                ),
              ],
            ),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildCourseCurriculum() {
    // Demo curriculum data
    final modules = [
      CourseModule(
        id: '1',
        title: 'Introduction to ${course.technology}',
        duration: '45 min',
        lessonCount: 3,
        isLocked: false,
        lessons: [
          CourseLesson(
            id: '1',
            title: 'Welcome and Course Overview',
            duration: '10:30',
            videoUrl: '',
            isFree: true,
            isCompleted: false,
          ),
          CourseLesson(
            id: '2',
            title: 'Setting Up Development Environment',
            duration: '15:45',
            videoUrl: '',
            isFree: true,
            isCompleted: false,
          ),
          CourseLesson(
            id: '3',
            title: 'Your First Project',
            duration: '18:20',
            videoUrl: '',
            isFree: !course.isFree,
            isCompleted: false,
          ),
        ],
      ),
      CourseModule(
        id: '2',
        title: 'Core Concepts & Fundamentals',
        duration: '2 hours 15 min',
        lessonCount: 5,
        isLocked: !course.isFree,
        lessons: [
          CourseLesson(
            id: '4',
            title: 'Understanding Basic Concepts',
            duration: '25:10',
            videoUrl: '',
            isFree: false,
            isCompleted: false,
          ),
          CourseLesson(
            id: '5',
            title: 'Advanced Techniques',
            duration: '30:25',
            videoUrl: '',
            isFree: false,
            isCompleted: false,
          ),
        ],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Course Curriculum',
              style: TextStyle(
                fontSize: AppSizer.deviceSp18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${course.totalLessons} lessons • ${course.duration}',
              style: TextStyle(
                color: AppColors.onSurfaceVariant,
                fontSize: AppSizer.deviceSp12,
              ),
            ),
          ],
        ),
        
        SizedBox(height: AppSizer.deviceHeight2),
        
        ...modules.map((module) => _buildCurriculumModule(module)).toList(),
      ],
    );
  }

  Widget _buildCurriculumModule(CourseModule module) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizer.deviceHeight2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.outline),
        borderRadius: BorderRadius.circular(AppSizer.deviceWidth3),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(
          horizontal: AppSizer.deviceWidth4,
          vertical: AppSizer.deviceHeight1,
        ),
        leading: Icon(
          module.isLocked ? Icons.lock : Icons.play_circle_outline,
          color: module.isLocked ? Colors.grey : AppColors.primaryColor,
          size: AppSizer.deviceSp20,
        ),
        title: Text(
          module.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: AppSizer.deviceSp14,
          ),
        ),
        subtitle: Text(
          '${module.lessonCount} lessons • ${module.duration}',
          style: TextStyle(fontSize: AppSizer.deviceSp12),
        ),
        trailing: module.isLocked 
            ? Icon(Icons.lock, color: Colors.grey)
            : null,
        children: [
          Divider(height: 1),
          ...module.lessons.map((lesson) => _buildLessonItem(lesson, module.isLocked)).toList(),
        ],
      ),
    );
  }

  Widget _buildLessonItem(CourseLesson lesson, bool isModuleLocked) {
    final isLocked = isModuleLocked || (!lesson.isFree && course.isFree);
    
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizer.deviceWidth6,
        vertical: AppSizer.deviceHeight1,
      ),
      leading: Container(
        width: AppSizer.deviceWidth8,
        height: AppSizer.deviceWidth8,
        decoration: BoxDecoration(
          color: isLocked ? Colors.grey : AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isLocked ? Icons.lock : Icons.play_arrow,
          color: Colors.white,
          size: AppSizer.deviceSp12,
        ),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(
          fontSize: AppSizer.deviceSp13,
          color: isLocked ? Colors.grey : null,
        ),
      ),
      subtitle: Text(
        lesson.duration,
        style: TextStyle(
          fontSize: AppSizer.deviceSp11,
          color: isLocked ? Colors.grey : AppColors.onSurfaceVariant,
        ),
      ),
      trailing: isLocked
          ? Icon(Icons.lock, color: Colors.grey, size: AppSizer.deviceSp16)
          : Icon(Icons.play_circle_outline, color: AppColors.primaryColor, size: AppSizer.deviceSp20),
      onTap: isLocked ? null : () {
        // Play lesson
        _playLesson(lesson);
      },
    );
  }

  Widget _buildBottomActionButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizer.deviceWidth4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: course.isFree
              ? FilledButton(
                  onPressed: () {
                    // ENROLL FOR FREE - Direct enrollment
                    _enrollInCourse(context);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.successColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: AppSizer.deviceHeight1_5),
                  ),
                  child: Text(
                    'ENROLL FOR FREE',
                    style: TextStyle(
                      fontSize: AppSizer.deviceSp16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : FilledButton(
                  onPressed: () {
                    // BUY NOW - Navigate to CourseCheckoutPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseCheckoutPage(course: course),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: AppSizer.deviceHeight1_5),
                  ),
                  child: Text(
                    'BUY NOW - ₹${course.price}',
                    style: TextStyle(
                      fontSize: AppSizer.deviceSp16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  void _playLesson(CourseLesson lesson) {
    // Implement lesson playback
    print('Playing lesson: ${lesson.title}');
  }

  void _enrollInCourse(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enroll in Course'),
        content: Text('Are you sure you want to enroll in "${course.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Successfully enrolled in ${course.title}'),
                  backgroundColor: AppColors.successColor,
                ),
              );
            },
            child: Text('Enroll'),
          ),
        ],
      ),
    );
  }
}