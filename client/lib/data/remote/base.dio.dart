export 'base.dio_stub.dart'
    if (dart.library.io) 'base.dio_mobile.dart'
    if (dart.library.html) 'base.dio_web.dart';
