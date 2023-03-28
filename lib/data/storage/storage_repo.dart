mixin StorageRepo {
  Future? saveString({required String key, String? value});

  Future? saveInt({required String key, int? value});

  Future? saveDouble({required String key, double? value});

  Future? saveBool({required String key, bool? value});

  Future? saveStringList({required String key, List<String>? value});

  String? getString({required String key});

  int? getInt({required String key});

  double? getDouble({required String key});

  bool? getBool({required String key});

  bool? contains(String key);

  Future<bool>? remove(String key);

  List<String>? getStringList({required String key});
}
