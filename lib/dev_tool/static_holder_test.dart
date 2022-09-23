/// 单例持有对象
/// 用于内存泄漏示例
class SingleInstanceHolderTest {
  static final SingleInstanceHolderTest _sigleton = SingleInstanceHolderTest();
  static SingleInstanceHolderTest get sigleton => _sigleton;

  final Set<Object> _holder = <Object>{};

  void hold(Object obj) {
    _holder.add(obj);
  }

  void clear() {
    _holder.clear();
  }
}

/// 静态持有对象
/// 用于内存泄漏示例
class StaticHolderTest {
  static final Set<Object> _holder = <Object>{};

  static void hold(Object obj) {
    _holder.add(obj);
  }

  static void clear() {
    _holder.clear();
  }
}
