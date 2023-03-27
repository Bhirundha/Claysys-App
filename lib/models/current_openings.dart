import 'package:cloud_firestore/cloud_firestore.dart';

class details{
  String designation;
  String experience;
  String detail;
  bool isVisible;

  details({ required this.designation ,required this.experience, required this.detail, required this.isVisible});

  // factory details.fromJson(Map<String, dynamic> json) {
  //   return details(designation: json['designation'], experience: json['experience'], detail: json['detail'], isVisible: json['isVisible']);
  // }
}


List<details> item = [
  details(
      designation: 'Software Engineer',
      experience: 'Exp:02-10 Years',
      detail: 'Lorem ipsum dolor sit amet,consectetur\nadipiscing etc..',
      isVisible: true),
  details(
      designation: 'Project Coordinator',
      experience: 'Exp 0-4 Years',
      detail: 'Lorem ipsum dolor sit amet,consectetur\nadipiscing etc..',
      isVisible: false),
  details(
      designation: 'Project Manager',
      experience: 'Exp:01-08 Years',
      detail: 'Lorem ipsum dolor sit amet,consectetur\nadipiscing etc..',
      isVisible: false),
];


