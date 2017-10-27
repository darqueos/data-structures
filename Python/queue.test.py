
import unittest
from queue import Queue

class TestQueue(unittest.TestCase):

    def setUp(self):
        self.queue = Queue(5)

    def test_enqueue(self):
        self.queue.enqueue("A")
        self.assertEqual(self.queue.peek(), "A")

    def test_dequeue(self):
        self.queue.enqueue("A")
        item = self.queue.dequeue()
        self.assertEqual(item, "A")
        self.assertEqual(len(self.queue), 0)

if __name__ == '__main__':
    unittest.main()
