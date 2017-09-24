// 1.9

type Stack struct {
    Items []int;
    Index int;
}

func NewStack(length int) *Stack {
    return &Stack{Items: [length]int, Index: 0}
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
    s.Items[s.Index] = nil
    return i, nil
}

func (s *Stack) Push(i int) (error) {

    if s.Full() {
        errors.New("Cannot push into a full stack!")
    }

    s.Items = append(s.Items, i)
    s.Index += 1
    return nil
}

func (s *Stack) Size() int {
    return s.Index
}
