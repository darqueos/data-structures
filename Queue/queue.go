package queue

import "errors"

type Queue struct {
	Items []int
	First, Last, Length int
}

func NewQueue(l int) *Queue {
	return &Queue{Items: make([]int, l, l*2), First: 0, Last: 0, Length: 0}
}

func (q *Queue) Len() int {
	return q.Length
}

func (q *Queue) Empty() bool {
	return q.Length == 0
}

func (q *Queue) Full() bool {
	return q.Length == len(q.Items)
}

func (q *Queue) Peek() (int, error) {

	if q.Empty() {
		return 0, errors.New("Cannot peek at an empty queue!")
	}

	return q.Items[q.First], nil
}

func (q *Queue) Dequeue() (int, error)) {

	if q.Empty() {
		return 0, errors.New("Cannot dequeue from an empty queue!")
	}

	i := q.Items[q.First]
	q.Items = q.Items[:q.First]
	q.First = (q.First + 1) % len(q.Items)
	q.Length -= 1
	return i, nil
}

func (q *Queue) Enqueue(i int) error {

	if q.Full() {
		return errors.New("Cannot enqueue into a full queue!")
	}

	q.Last = (q.Last + 1) % len(q.Items)
	q.Items = append(q.Items, i)
	q.Length += 1
	return nil
}
