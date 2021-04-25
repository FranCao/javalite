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

void printNodes(class Node head) {
    class Node n = head;
    while (n.next != null) {
        print(n.data);
        n = n.next;
    }
    print(n.data);
}

class Node head = Node(42, null);
printNodes(head);
int[] dataArr = [3,4,5];
push(head, dataArr[0]);
push(head, dataArr[1]);
push(head, dataArr[2]);
printNodes(head);
pop(head);
printNodes(head);
