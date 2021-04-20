class Item {
    string data;
    int priority;
}

class Item getHighestPriority(class Item[] arr, int len) {
    class Item hi = arr[0];
    class Item ci = hi;
    for (int i = 1; i < len; i = i + 1) {
        ci = arr[i];
        if (ci.priority > hi.priority) {
            hi = ci;
        }
    }
    return hi;
}

// may want to add "insert(data, priority)" , "deleteHighestPriority()" 
// after implemented array functions


int main() {
    class Item i1 = Item("medium", 1);
    class Item i2 = Item("high", 2);
    class Item i3 = Item("extra high", 3);
    class Item i4 = Item("low", 0);
    class Item[] itemArr = [i1, i2, i3, i4];
    class Item hi = getHighestPriority(itemArr, 4);
    print(hi.priority);
    print(hi.data);
}