class Array

  def my_each(&blk)
    self.length.times do |i|
      blk.call(self[i])
    end
  end

  def my_select(&blk)
    array = []
    self.my_each do |el|
      array << el if blk.call(el)
    end
  end

  def my_reject(&blk)
    array = []
    self.my_each do |el|
      array << el unless blk.call(el)
    end
  end

  def my_any?(&blk)
    self.my_each do |el|
      return true if blk.call(el)
    end
    false
  end

  def my_flatten
    array = []
    self.each do |el|
      el.is_a?(Array) array << el.my_flatten : array << el
    end
    array
  end

  def my_zip(*args)
    array = []
    self.length.times do |i|
      args.each do |arr|
        sub_array = [self[i]]
        sub_array << arr[i]
      end
      array << sub_array
    end
    array
  end

  def my_rotate(num = 1)
    (num % self.length).times do |i|
      number = array.shift
      array << number
    end
    array
  end
end
