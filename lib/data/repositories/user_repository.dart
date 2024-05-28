import '../../../domain/entities/random_user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/local/i_user_local_datasource.dart';
import '../datasources/remote/i_user_remote_datasource.dart';

class UserRepository implements IUserRepository {
  late IUserRemoteDataSource remoteDataSource;
  late IUserLocalDataSource localDataSource;

  UserRepository(this.remoteDataSource, this.localDataSource);

  @override
  Future<bool> getUser() async {
    // TODO
    // Aquí debemos obtener una instancia de RandomUser del remoteDataSource
    RandomUser user = await remoteDataSource.getUser();
    // y pasarla al localDataSource
    await localDataSource.addUser(user);
    return true;
  }

  @override
  Future<List<RandomUser>> getAllUsers() => localDataSource.getAllUsers();

  @override
  Future<void> deleteUser(id) async => await localDataSource.deleteUser(id);

  @override
  Future<void> deleteAll() async => await localDataSource.deleteAll();

  @override
  Future<void> updateUser(user) async => await localDataSource.updateUser(user);
}
