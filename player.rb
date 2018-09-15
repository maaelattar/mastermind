class Player
  attr_accessor :kind, :selection
  def initailize
    @kind = 'human'
    @selection = []
  end

  def compare(code)
    result_arr = Array.new(4, 'no_color')
    @selection.each_with_index do |element1, index1|
      code.each_with_index do |element2, index2|
        result_arr[index1] = 'red' if element1 == element2 && index1 == index2
        result_arr[index1] = 'white' if element1 == element2 && index1 != index2
      end
    end
    result_arr
  end
end
