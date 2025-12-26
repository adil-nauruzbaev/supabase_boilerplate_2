import 'package:supabase_boilerplate/core/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseClient get _client => Supabase.instance.client;

  Future<AppUser?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {
        'first_name': firstName,
        'last_name': lastName,
      },
    );

    return _mapUser(response.user);
  }

  Future<AppUser?> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return _mapUser(response.user);
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  AppUser? getCurrentUser() {
    return _mapUser(_client.auth.currentUser);
  }

  Future<AppUser?> updateUser({
    String? firstName,
    String? lastName,
  }) async {
    final metadata = <String, dynamic>{
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
    };

    final response = await _client.auth.updateUser(
      UserAttributes(
        data: metadata.isEmpty ? null : metadata,
      ),
    );

    return _mapUser(response.user);
  }

  AppUser? _mapUser(User? user) {
    if (user == null || user.email == null) {
      return null;
    }

    final metadata = user.userMetadata ?? <String, dynamic>{};
    return AppUser(
      email: user.email!,
      firstName: metadata['first_name'] as String? ?? '',
      lastName: metadata['last_name'] as String? ?? '',
    );
  }
}

