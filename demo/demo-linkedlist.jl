class Node {
    int data;
    class Node next;
}

void push(class Node head, int data) {
    class Node n = head;
    while (n.next != null) {
        n = n.next;
    }
    n.next = Node(data, null);
}

int pop(class Node head) {
    class Node n = head.next;
    int data = head.data;
    if (n == null) {
        head = null;
    } else {
        class Node prev = head;
        while (n.next != null) {
            n = n.next;
            prev = prev.next;
        }
        data = n.data;
        prev.next = null;
    }
    return data;
}


// intialize head
class Node head = Node(42, null);
printNodes(head);

// push new nodes
int[] dataArr = [3,4,5];
for (int i = 0; i < length(dataArr); i = i + 1) {
    push(head, dataArr[i]);
}

printNodes(head);

// pop the last node
print("popped:");
print(pop(head));
print("");
printNodes(head);


void printNodes(class Node head) {
    print("list:");
    class Node n = head;
    while (n.next != null) {
        print(n.data);
        n = n.next;
    }
    print(n.data);
    print("");
}

