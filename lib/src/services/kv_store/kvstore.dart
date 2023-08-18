
import 'base_store.dart'
    if (dart.library.html) 'web_kvstore.dart'
    if (dart.library.io) 'io_store.dart';
import 'i_kvstore.dart';

export 'i_kvstore.dart';

IKvStore? _kvStore;

IKvStore get kvStore {
  _kvStore ??= createKvstore('novel_cache');
  return _kvStore!;
}
