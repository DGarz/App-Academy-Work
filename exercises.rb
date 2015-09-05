class Array

  def my_each
    self.length.times { |j| yield(self[j]) }
    self
  end

  def my_select(&blk)
    dup = self.dup
    selected_vals = []

    until dup.empty?
      current_val = dup.shift
      selected_vals << current_val if blk.call(current_val)
    end

    selected_vals
  end

  def my_reject(&blk)
    dup = self.dup
    selected_vals = []

    until dup.empty?
      current_val = dup.shift
      selected_vals << current_val unless blk.call(current_val)
    end

    selected_vals
  end

  def my_any?(&blk)
    dup = self.dup

    until dup.empty?
      return true if blk.call(dup.shift)
    end

    false
  end

  def my_all?(&blk)
    dup = self.dup

    until dup.empty?
      return false unless blk.call(dup.shift)
    end

    true
  end

  def my_flatten
    test_array = []
    self.each do |el|
      el.is_a?(Array) ? test_array += el.my_flatten : test_array << el
    end

    test_array
  end

  def my_zip(*args)
    zipped_ary = []

    self.each_with_index do |el, idx|
      nested_ary = [el]
      args.each do |arg|
        nested_ary << arg[idx]
      end
      zipped_ary << nested_ary
    end

    zipped_ary
  end

  def my_rotate(num = 1)
    num > 0 ? ary = self.dup : ary = self.reverse

    mag = num.abs % self.size
    front_end = ary.shift(mag)
    ary = ary + front_end

    num > 0 ? ary : ary.reverse
  end

  def my_join(joint = "")
    joined_str = ""
    self.length.times do |j|
      joined_str << self[j] + joint unless j == (self.length - 1)
    end
    joined_str << self[-1]
  end

  def my_reverse
    self.inject([], :unshift)
  end

end
