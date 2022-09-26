import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../net/api_client.dart';

final providerApi = StateProvider<ApiClient>((ref) => ApiClient(Dio()));