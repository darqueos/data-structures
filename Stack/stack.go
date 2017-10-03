
package stack

import "errors"

type Stack struct {
	Items []int
	Index int
}

func NewStack(l int) *Stack {
	return &Stack{Items: make([]int, l, l*2), Index: 0}
}

func (s *Stack) Empty() bool {
	return s.Index == 0
}

func (s *Stack) Full() bool {
	return s.Index == len(s.Items)
}

func (s *Stack) Peek() (int, error) {

	if s.Empty() {
		return 0, errors.New("Cannot peek at an empty stack!")
	}

	return s.Items[s.Index], nil
}

func (s *Stack) Pop() (int, error) {

	if s.Empty() {
		return 0, errors.New("Cannot pop from an empty stack!")
	}

	s.Index -= 1
	i := s.Items[s.Index]
	s.Items = s.Items[:s.Index]
	return i, nil
}

func (s *Stack) Push(i int) error {

	if s.Full() {
		errors.New("Cannot push into a full stack!")
	}

	s.Items = append(s.Items, i)
	s.Index += 1
	return nil
}

func (s *Stack) Len() int {
	return s.Index
}
