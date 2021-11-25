class DoublyNode<T> {
  T data;
  DoublyNode<T>? previous;
  DoublyNode<T>? next;
  DoublyNode(this.data);
}

class DoublyLinkedList<T> {
  DoublyNode<T>? head;
  DoublyNode<T>? tail;
  int count = 0;

  DoublyLinkedList() {
    clear();
  }

  /// Insert a new item List [data] at [index]. 
  void insert(int index, T data) {
    DoublyNode<T> node = DoublyNode<T>(data);
    DoublyNode<T> current = head!;
    
    // Search on the list through the [index].
    if (index == 0) {
      addFirst(data);
    } else if (index == count) {
      add(data);
    } else {
      for (int i = 0; i < index; i++) {
        current = current.next!;
      }

      // Input new item [node] in list.
      node.next = current;
      current.previous!.next = node;
      current.previous = node;
    }
    count++;
  }

  /// Add new list item at the end of list.
  void add(T data) {
    DoublyNode<T> node = DoublyNode<T>(data);
    if (head != null) {
      tail!.next = node;
      node.previous = tail;
    } else {
      head = node;
    }
    tail = node;
    count++;
  }

  /// Add new list item at first position on list.
  void addFirst(T data) {
    DoublyNode<T> node = DoublyNode<T>(data);
    DoublyNode<T> temp = head!;
    node.next = temp;
    head = node;
    if (count == 0) {
      tail = head;
    } else {
      temp.previous = node;
    }
    count++;
  }

  /// Change old list value to new [data] in [index].  
  void update(int index, T data) {

    // If [index] out of range throw new exceprion.
    if (index < 0 || index > count) {
      throw Exception('Index out of range');
    }
    DoublyNode<T> current = head!;
    for (int i = 0; i <= index - 1; i++) {
      current = current.next!;
    }
    current.data = data;
  }

  /// Remove list irem on [index].
  void remove(int index) {
    DoublyNode<T> current = head!;

    if (index < 0 || index > count) {
      throw Exception('Index out of range');
    } else if (index == 0) {
      head = head!.next;
    } else {
      for (int i = 0; i < index - 1; i++) {
        current = current.next!;
      }
      if (current.next!.next != null) {
        current.next = current.next!.next;
      } else {
        current.next = null;
      }
    }
    count--;
  }

  /// Return list item on inputed [index].
  T valueOf(int index) {
    if (index < 0 || index > count) {
      throw Exception('Index out of range');
    }
    DoublyNode<T> current = head!;
    for (int i = 0; i < index; i++) {
      current = current.next!;
    }
    return current.data;
  }

  /// Return index of list item on inputed [data]. 
  int indexOf(T data) {
    bool equals = false;
    int index = 0;
    DoublyNode<T> current = head!;
    
    while (current != null) {
      if (current.data == data) {
        equals = true;
        return index;
      }
      index++;
      if (current.next != null) {
        current = current.next!;
      } else {
        break;
      }
    }

    // Check if this item exists.
    if (equals == false) {
      throw Exception('This element does not exist');
    }
    return index;
  }

  /// Simple method's that return length of list and check if now empty.
  int length() => count;

  bool isEmpty() => count == 0;

  /// Returns all values of list as String in List format.
  String toString() {
    
    if (isEmpty()) {
      return '[]';
    }
    
    DoublyNode<T> current = head!;
    String result = '[ ${head!.data}';
    
    while (current != tail) {
      current = current.next!;
      result += ', ${current.data}';
    }
    result += ']';

    return result;
  }
  
  /// Clears the list.
  void clear() {
    head = null;
    tail = null;
    count = 0;
  }

  /// Converst this list in List<T>.   
  List<T> toList() {
    List<T> newList = [head!.data];
    DoublyNode<T> current = head!;
    while(current.next != null) {
      current = current.next!;
      newList.add(current.data);
      
    }
    return newList;
  }

  /// Check if list contains this element [data].
  bool contains(T data) {
    DoublyNode<T> current = head!;
    while (current.data != null) {
      if (current.data! == data) return true;
      //if (current.next == null) return false;
      current = current.next!;
    }
    return false;
  }
}
