
import unittest
from stack import Stack

class TestStack(unittest.TestCase):

    def setUp(self):
        self.stack = Stack(5)

    def test_push(self):
        self.stack.push("A")
        self.assertEqual(self.stack.peek(), "A")

    def test_pop(self):
        self.stack.push("A")
        item = self.stack.pop()
        self.assertEqual(item, "A")
        self.assertEqual(len(self.stack), 0)

if __name__ == '__main__':
    unittest.main()
