import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:livery/features/top_users/service/top_users_service.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/utils/end_point.dart';
import 'package:mocktail/mocktail.dart';

class MockDioService extends Mock implements DioService {}

void main() {
  late TopUsersService topUsersService;
  late MockDioService mockDioService;

  setUp(() {
    mockDioService = MockDioService();
    topUsersService = TopUsersService(mockDioService);
  });

  group('TopUsersService', () {
    test('should return list of users when API call is successful', () async {
      // Arrange
      final mockResponse = [
        {
          'ID': 1,
          'username': 'test_user',
          'dp': 'https://example.com/image.jpg',
          'like_count': 10,
          'violation_count': 0,
        },
      ];

      when(
        () => mockDioService.request(
          EndPoints.profile.getAll,
          method: Method.get,
        ),
      ).thenAnswer(
        (_) async => Right(
          Response(data: mockResponse, requestOptions: RequestOptions()),
        ),
      );

      // Act
      final result = await topUsersService.fetchTopUsers();

      // Assert
      expect(result.isRight(), true);
      result.fold((failure) => fail('Should not return failure'), (users) {
        expect(users.length, 1);
        expect(users.first.id, 1);
        expect(users.first.username, 'test_user');
        expect(users.first.likeCount, 10);
      });
    });

    test('should return empty list when API returns empty array', () async {
      // Arrange
      when(
        () => mockDioService.request(
          EndPoints.profile.getAll,
          method: Method.get,
        ),
      ).thenAnswer(
        (_) async =>
            Right(Response(data: [], requestOptions: RequestOptions())),
      );

      // Act
      final result = await topUsersService.fetchTopUsers();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not return failure'),
        (users) => expect(users.isEmpty, true),
      );
    });

    test('should return error when API call fails', () async {
      // Arrange
      when(
        () => mockDioService.request(
          EndPoints.profile.getAll,
          method: Method.get,
        ),
      ).thenAnswer(
        (_) async =>
            Left(CustomDioException(message: 'API Error', statusCode: 500)),
      );

      // Act
      final result = await topUsersService.fetchTopUsers();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, 'API Error'),
        (users) => fail('Should not return success'),
      );
    });

    test('should return error when exception occurs', () async {
      // Arrange
      when(
        () => mockDioService.request(
          EndPoints.profile.getAll,
          method: Method.get,
        ),
      ).thenThrow(Exception('Network error'));

      // Act
      final result = await topUsersService.fetchTopUsers();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, 'Exception: Network error'),
        (users) => fail('Should not return success'),
      );
    });
  });
}
