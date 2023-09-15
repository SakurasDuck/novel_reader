class AsyncDone<T> {
  AsyncDone.value(T value)
      : _value = value,
        _done = false;

  AsyncDone.done()
      : _value = null,
        _done = true;

  final T? _value;

  final bool _done;

  bool get isDone => _done;

  T get value {
    assert(!isDone,'is done ');
    return _value!;
  }
}
