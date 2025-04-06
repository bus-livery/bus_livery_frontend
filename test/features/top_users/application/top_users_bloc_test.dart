import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/features/top_users/application/top_users_bloc.dart';
import 'package:livery/features/top_users/service/top_users_service.dart';
import 'package:mocktail/mocktail.dart';

class MockTopUsersService extends Mock implements TopUsersService {}

void main() {
  late TopUsersBloc topUsersBloc;
  late MockTopUsersService mockTopUsersService;

  setUp(() {
    mockTopUsersService = MockTopUsersService();
    topUsersBloc = TopUsersBloc(mockTopUsersService);
  });

  tearDown(() {
    topUsersBloc.close();
  });

  test('initial state should be TopUsersState.initial()', () {
    final state = topUsersBloc.state;
    expect(state.getTopUsersRes.status, equals(ApiStatus.initial));
    expect(state.getTopUsersRes.apiData, isNull);
    expect(state.getTopUsersRes.errorMessage, isNull);
  });

  group('FetchTopUsers', () {
    final mockUsers = [
      ProfileModel(
        id: 1,
        username: 'test_user',
        dp: 'https://example.com/image.jpg',
        likeCount: 10,
        violationCount: 0,
      ),
    ];

    blocTest<TopUsersBloc, TopUsersState>(
      'emits [loading, success] when fetchTopUsers succeeds',
      build: () {
        when(
          () => mockTopUsersService.fetchTopUsers(),
        ).thenAnswer((_) async => Right(mockUsers));
        return topUsersBloc;
      },
      act: (bloc) => bloc.add(FetchTopUsers()),
      expect:
          () => [
            isA<TopUsersState>().having(
              (state) => state.getTopUsersRes.status,
              'status',
              ApiStatus.loading,
            ),
            isA<TopUsersState>()
                .having(
                  (state) => state.getTopUsersRes.status,
                  'status',
                  ApiStatus.success,
                )
                .having(
                  (state) => state.getTopUsersRes.apiData,
                  'apiData',
                  mockUsers,
                ),
          ],
      verify: (_) {
        verify(() => mockTopUsersService.fetchTopUsers()).called(1);
      },
    );

    blocTest<TopUsersBloc, TopUsersState>(
      'emits [loading, error] when fetchTopUsers fails',
      build: () {
        when(
          () => mockTopUsersService.fetchTopUsers(),
        ).thenAnswer((_) async => const Left('Error fetching users'));
        return topUsersBloc;
      },
      act: (bloc) => bloc.add(FetchTopUsers()),
      expect:
          () => [
            isA<TopUsersState>().having(
              (state) => state.getTopUsersRes.status,
              'status',
              ApiStatus.loading,
            ),
            isA<TopUsersState>()
                .having(
                  (state) => state.getTopUsersRes.status,
                  'status',
                  ApiStatus.failure,
                )
                .having(
                  (state) => state.getTopUsersRes.errorMessage,
                  'errorMessage',
                  'Error fetching users',
                ),
          ],
      verify: (_) {
        verify(() => mockTopUsersService.fetchTopUsers()).called(1);
      },
    );

    blocTest<TopUsersBloc, TopUsersState>(
      'emits [loading, error] when fetchTopUsers throws exception',
      build: () {
        when(
          () => mockTopUsersService.fetchTopUsers(),
        ).thenThrow(Exception('Unexpected error'));
        return topUsersBloc;
      },
      act: (bloc) => bloc.add(FetchTopUsers()),
      expect:
          () => [
            isA<TopUsersState>().having(
              (state) => state.getTopUsersRes.status,
              'status',
              ApiStatus.loading,
            ),
            isA<TopUsersState>()
                .having(
                  (state) => state.getTopUsersRes.status,
                  'status',
                  ApiStatus.failure,
                )
                .having(
                  (state) => state.getTopUsersRes.errorMessage,
                  'errorMessage',
                  'Exception: Unexpected error',
                ),
          ],
      verify: (_) {
        verify(() => mockTopUsersService.fetchTopUsers()).called(1);
      },
    );

    blocTest<TopUsersBloc, TopUsersState>(
      'emits [loading, success with empty list] when fetchTopUsers returns empty list',
      build: () {
        when(
          () => mockTopUsersService.fetchTopUsers(),
        ).thenAnswer((_) async => const Right([]));
        return topUsersBloc;
      },
      act: (bloc) => bloc.add(FetchTopUsers()),
      expect:
          () => [
            isA<TopUsersState>().having(
              (state) => state.getTopUsersRes.status,
              'status',
              ApiStatus.loading,
            ),
            isA<TopUsersState>()
                .having(
                  (state) => state.getTopUsersRes.status,
                  'status',
                  ApiStatus.success,
                )
                .having(
                  (state) => state.getTopUsersRes.apiData,
                  'apiData',
                  isEmpty,
                ),
          ],
      verify: (_) {
        verify(() => mockTopUsersService.fetchTopUsers()).called(1);
      },
    );
  });
}
