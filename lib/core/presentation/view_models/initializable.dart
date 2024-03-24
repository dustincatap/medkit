abstract interface class Initializable {
  Future<void> onInitialize();
}

abstract interface class InitializableParameter<T> {
  Future<void> onInitialize(T parameter);
}
