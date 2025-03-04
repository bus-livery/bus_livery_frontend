import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/utils/di/injection.config.dart';

GetIt getIt = GetIt.instance;

@injectableInit
Future configureDependencies() async => getIt.init();
