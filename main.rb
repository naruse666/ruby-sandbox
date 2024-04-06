# frozen_string_literal: true

class Tree
  class Node
    attr_accessor :key, :value, :left, :right

    def initialize(key, value)
      @key = key
      @value = value
      @left = nil
      @right = nil
    end
  end

  def initialize
    @root = nil
  end

  private

  def insert!(node, key, value)
    return Node.new(key, value) if node.nil?

    if node.key == key
      node.value = value
    elsif key < node.key
      node.left = insert!(node.left, key, value)
    else
      node.right = insert!(node.right, key, value)
    end
    node
  end

  def search(node, key)
    while node
      if key == node.key
        return node
      elsif key < node.key
        node = node.left
      else
        node = node.right
      end
    end
  end

  def search_max(node)
    node = node.right while node.right
    node
  end

  def search_min(node)
    node = node.left while node.left
    node
  end

  def delete_min!(node)
    return node.right unless node.left

    node.left = delete_min!(node.left)
    node
  end

  def delete!(node, key)
    value = nil

    if node
      if key == node.key

        value = node.value

        return node.right, value if node.left.nil?

        return node.left, value if node.right.nil?

        min_node = search_min(node.right)
        node.key = min_node.key
        node.value = min_node.value
        node.right = delete_min!(node.right)
      elsif key < node.key
        node.left, value = delete!(node.left, key)
      else
        node.right, value = delete!(node.right, key)
      end
    end
    [node, value]
  end

  def traverse(node, &func)
    return unless node

    traverse(node.left, &func)
    func.call(node.key, node.value)
    traverse(node.right, &func)
  end

  public

  def [](key)
    node = search(@root, key)
    return unless node

    node.value
  end

  def []=(key, value)
    @root = insert!(@root, key, value)
  end

  def delete_key!(key)
    @root, value = delete!(@root, key)
    value
  end

  def min
    return unless @root

    node = search_min(@root)
    return unless node

    [node.key, node.value]
  end

  def max
    return unless @root

    node = search_max(@root)
    return unless node

    [node.key, node.value]
  end

  def each(&func)
    traverse(@root, &func)
  end

  def inspect
    format('#<Tree: %#x>', object_id)
  end
end
