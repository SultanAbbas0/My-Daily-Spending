import 'package:my_daily_spending/repositories/database_repository.dart';

class UserRepository {
  static getUsername() async {
    final data = await DataBaseRepository.database
        .from('user')
        .select()
        .eq('user_uid', DataBaseRepository.getCurrentUserUID());
    if (data.isEmpty) {
      return '';
    }
    return data.first['username'];
  }

  static String getProfilePictureUrl() {
    return DataBaseRepository.database.storage
        .from('profile_pictures')
        .getPublicUrl(DataBaseRepository.getCurrentUserUID()!);
  }

  static String getDefaultProfilePictureUrl() {
    return DataBaseRepository.database.storage
        .from('profile_pictures')
        .getPublicUrl('default_pfp');
  }

  static uploadProfilePicture(file) async {
    try {
      await DataBaseRepository.database.storage
          .from('profile_pictures')
          .upload('${DataBaseRepository.getCurrentUserUID()}', file);
    } catch (_) {
      await DataBaseRepository.database.storage
          .from('profile_pictures')
          .update('${DataBaseRepository.getCurrentUserUID()}', file);
    }
  }
}
