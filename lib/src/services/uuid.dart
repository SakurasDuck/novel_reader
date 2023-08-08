

import 'package:uuid/uuid.dart';


class UuidService {
  static const Uuid _uuid = Uuid();
  static String get uuid => _uuid.v4();
}