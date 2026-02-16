import 'package:coders_adda_app/models/home_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final HomeModel _homeData = HomeModel(
    banners: [
      BannerItem(
    title: "Get 70% Off on New Courses",
    subtitle: "Limited Time Offer",
    route: "/subscription",
    imageUrl: "https://img.freepik.com/free-psd/e-learning-online-distance-classes-horizontal-banner-template_23-2149442062.jpg?t=st=1762588776~exp=1762592376~hmac=b51633613b7a3fc78c7b22c113b89979fe0936d047d61fbe6bf712cc02e87346&w=1480", 
  ),
     BannerItem(
    title: "Get 70% Off on New Courses",
    subtitle: "Limited Time Offer",
    route: "/subscription",
    imageUrl: "https://img.freepik.com/free-psd/e-learning-online-distance-classes-horizontal-banner-template_23-2149442062.jpg?t=st=1762588776~exp=1762592376~hmac=b51633613b7a3fc78c7b22c113b89979fe0936d047d61fbe6bf712cc02e87346&w=1480",
  ),
   BannerItem(
    title: "Get 70% Off on New Courses",
    subtitle: "Limited Time Offer",
    route: "/subscription",
    imageUrl: "https://img.freepik.com/free-psd/e-learning-online-distance-classes-horizontal-banner-template_23-2149442062.jpg?t=st=1762588776~exp=1762592376~hmac=b51633613b7a3fc78c7b22c113b89979fe0936d047d61fbe6bf712cc02e87346&w=1480",
  ),
   BannerItem(
    title: "Get 70% Off on New Courses",
    subtitle: "Limited Time Offer",
    route: "/subscription",
    imageUrl: "https://img.freepik.com/free-psd/e-learning-online-distance-classes-horizontal-banner-template_23-2149442062.jpg?t=st=1762588776~exp=1762592376~hmac=b51633613b7a3fc78c7b22c113b89979fe0936d047d61fbe6bf712cc02e87346&w=1480",
  ),
    ],
   coursesOnSale: [
  Course(
    id: "1",
    title: "Advanced Flutter Development",
    instructor: "Sarah Wilson",
    price: 199,
    thumbnail: "https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=400&h=250&fit=crop",
  ),
  Course(
    id: "2",
    title: "Advanced Java Development",
    instructor: "Sarah Wilson",
    price: 199,
    thumbnail: "https://images.unsplash.com/photo-1542831371-29b0f74f9713?w=400&h=250&fit=crop",
  ),
  Course(
    id: "3",
    title: "Complete Android Masterclass",
    instructor: "Mike Chen",
    price: 299,
    thumbnail: "https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?w=400&h=250&fit=crop",
  ),
],
    freeCourses: [
      Course(
        id: "4",
        title: "Introduction to Dart Programming",
        instructor: "John Doe",
        price: 199,
        thumbnail: "https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=400&h=250&fit=crop",
        isFree: true,
      ),
      Course(
        id: "5",
        title: "Introduction to Dart Programming",
        instructor: "John Doe",
        price: 199,
        thumbnail: "https://images.unsplash.com/photo-1542831371-29b0f74f9713?w=400&h=250&fit=crop",
        isFree: true,
      ),
      Course(
        id: "6",
        title: "Introduction to Dart Programming",
        instructor: "John Doe",
        price: 199,
        thumbnail: "https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?w=400&h=250&fit=crop",
        isFree: true,
      ),
    ],
    freePdfs: [
      PdfItem(
        id: "1", 
        title: "Flutter Cheat Sheet", 
        size: "2.4 MB", 
        isFree: true,

      ),
    ],
    paidPdfs: [
      PdfItem(
        id: "2", 
        title: "Advanced Architecture", 
        size: "4.2 MB", 
        isFree: false,

      ),
    ],
    jobs: [
      Job(id: "1", title: "Senior Flutter Developer", company: "TechCorp Inc."),
      Job(id: "2", title: "Android Engineer", company: "MobileFirst"),
    ],
  );

  HomeModel get homeData => _homeData;

  void navigateToCategory(String category) {
    // Navigation logic
  }

  void navigateToCourse(String courseId) {
    // Navigation logic
  }
}