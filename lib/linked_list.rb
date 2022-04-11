require_relative './node'
require 'pry'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def prepend(node)
    if head then node.next_node = head
    end
    self.head = node
  end

  def append(node)

    if head.nil? then self.head = node
    
    else
      last_node = head
      while last_node.next_node
        last_node = last_node.next_node
      end

      last_node.next_node = node
    end
  end

  def delete_head
    if head
      if head.next_node
        self.head = head.next_node
      else
        self.head = nil
      end
    end
  end

  def delete_tail
    if head && head.next_node
      second_last_node = head
      while second_last_node.next_node.next_node
        second_last_node = second_last_node.next_node
      end
      second_last_node.next_node = nil
    elsif
      head
      self.head = nil
    end
  end

  def add_after(index, node)
    if head.nil?
      return nil
    end

    before_node = head
    index.times do
      unless before_node.next_node.nil?
        before_node = before_node.next_node
      end
    end

    if before_node.next_node then node.next_node = before_node.next_node
    end
    before_node.next_node = node
  end

  def search(value)

    node = head
    while node
      if node.data == value then return node
      else
        node = node.next_node
      end
    end

    return nil
  end


end

# binding.pry