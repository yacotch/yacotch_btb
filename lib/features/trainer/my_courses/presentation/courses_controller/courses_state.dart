<<<<<<< HEAD
part of 'courses_cubit.dart';

@immutable
abstract class CoursesState {}

class CoursesInitial extends CoursesState {}

class GetCoursesLoaded extends CoursesState {
  final List<CourseModel> courses;
  GetCoursesLoaded(this.courses);
}
class GetCoursesLoading extends CoursesState {}
class GetCoursesError extends CoursesState {}

class GetCourseReviewsLoaded extends CoursesState {
  final List<ReviewModel> reviews;

  GetCourseReviewsLoaded(this.reviews);
}
class GetCourseReviewsLoading extends CoursesState {}
class GetCourseReviewsError extends CoursesState {}

class GetCourseLoaded extends CoursesState {}
class GetCourseLoading extends CoursesState {}
class GetCourseError extends CoursesState {}

=======
part of 'courses_cubit.dart';

@immutable
abstract class CoursesState {}

class CoursesInitial extends CoursesState {}

class GetCoursesLoaded extends CoursesState {
  final List<CourseModel> courses;
  GetCoursesLoaded(this.courses);
}
class GetCoursesLoading extends CoursesState {}
class GetCoursesError extends CoursesState {}

class GetCourseReviewsLoaded extends CoursesState {
  final List<ReviewModel> reviews;

  GetCourseReviewsLoaded(this.reviews);
}
class GetCourseReviewsLoading extends CoursesState {}
class GetCourseReviewsError extends CoursesState {}

class GetCourseLoaded extends CoursesState {}
class GetCourseLoading extends CoursesState {}
class GetCourseError extends CoursesState {}

>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
