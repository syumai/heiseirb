module Enumerable
  # eachを独自実装しよう！！！
  # forとかwhileでやってみてね。
  def my_each
    for item in self
      yield item
    end
  end

  def my_each_with_index
    for i in 0...self.count
      yield self[i], i
    end
  end

  # 下記問題、eachの使用は禁止。my_eachとかreduceはいいよん
  def my_find(arg=nil)
    for item in self
      return item if yield item
    end

    if arg
      arg.call
    else
      nil
    end
  end

  def my_map
    result = []
    my_each do |item|
      result.push(yield item)
    end
    result
  end

  def my_each_with_object(arg)
    for item in self
      yield item, arg
    end
    arg
  end

  def my_group_by
    result = {}
    my_each do |item|
      (result[yield item] ||= []).push(item)
    end
    result
  end

  def tally
    result = {}
    my_each do |item|
      result[item] ||= 0
      result[item] += 1
    end
    result
  end
end

class Array
  def my_zip(*args, &block)
    result = []
    my_each_with_index do |item, i|
      items = [item]
      for ary in args
        items.push(ary[i])
      end

      if block
        block.call(items)
      else
        result[i] = items
      end
    end

    if block
      nil
    else
      result
    end
  end
end
