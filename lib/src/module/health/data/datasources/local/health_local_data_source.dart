abstract class IHealthLocalDataSource {
  IHealthLocalDataSource();

  Future<void> updateUserHealthData();
  Future<void> readUserHealthData();
  Future<void> removeUserHealthData();
}