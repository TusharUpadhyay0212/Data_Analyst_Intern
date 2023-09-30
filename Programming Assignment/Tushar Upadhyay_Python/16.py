class Queue:
    def __init__(self):
        self._data = []

    def enqueue(self, item):
        self._data.append(item)

    def dequeue(self):
        if not self.is_empty():
            return self._data.pop(0)

    def is_empty(self):
        return len(self._data) == 0

    def __len__(self):
        return len(self._data)

    def first(self):
        if self.is_empty():
            raise ValueError("Queue is empty")
        return self._data[0]


q = Queue()

q.enqueue(10)
q.enqueue(20)

print("Queue: ", q._data)
print("Length: ", len(q))
print("Dequeue: ", q.dequeue())
print("Queue: ", q._data)

q.enqueue(30)
q.enqueue(40)

print("Queue: ", q._data)
print("First Element: ", q.first())
print("Queue: ", q._data)
print("Dequeue: ", q.dequeue())
print("Queue: ", q._data)
