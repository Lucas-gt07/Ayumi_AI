class MemoryCore {
  final List<String> _memory = [];

  void add(String m) {
    if (m.trim().isEmpty) return;
    _memory.add(m);
  }

  List<String> get all => _memory;

  String last() {
    if (_memory.isEmpty) return "";
    return _memory.last;
  }
}
