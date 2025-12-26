import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  const AppUser({
    required this.email,
    this.firstName = '',
    this.lastName = '',
  });

  final String email;
  final String firstName;
  final String lastName;

  const AppUser.empty()
      : email = '',
        firstName = '',
        lastName = '';

  AppUser copyWith({
    String? email,
    String? firstName,
    String? lastName,
  }) {
    return AppUser(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  @override
  List<Object?> get props => [email, firstName, lastName];
}

