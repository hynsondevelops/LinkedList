require_relative 'Node'

class LinkedList
	def initialize
		@head = Node.new
		@tail = @head
	end

	def append(value)
		if (@head.value == nil) #empty list
			@head.value = value
		elsif (@head.nextNode == nil) #just a head node
			@head.nextNode = Node.new(value)
			@tail = @head.nextNode
		else #more than 1 node in current list
			@tail.nextNode = Node.new(value)
			@tail = @tail.nextNode
		end
	end

	def prepend(value)
		@head = Node.new(value, @head)
	end

	def size
		currentNode = @head
		size = 0
		while (currentNode != nil)
			size += 1
			currentNode = currentNode.nextNode
		end
		return size
	end

	def head 
		return @head
	end

	def tail
		return @tail
	end

	def at(index)
		currentNode = @head
		size = 0
		while (currentNode != nil)
			if (size == index)
				return currentNode
			end
			size += 1
			currentNode = currentNode.nextNode
		end
	end

	def pop
		beforeTail = self.at(self.size - 2)
		beforeTail.nextNode = nil
		@tail = beforeTail
	end

	def contains?(value)
		currentNode = @head
		while (currentNode != nil)
			if (currentNode.value == value)
				return true
			end
			currentNode = currentNode.nextNode
		end
		return false
	end

	def find(value)
		currentNode = @head
		index = 0
		while (currentNode != nil)
			if (currentNode.value == value)
				return index
			end
			index += 1
			currentNode = currentNode.nextNode
		end
		return nil
	end

	def to_s
		stringFormat = ""
		currentNode = @head
		while (currentNode != nil)
			stringFormat += "(#{currentNode.value}) -> "
			currentNode = currentNode.nextNode
		end
		stringFormat += "nil"
	end

	def insert_at(index, value)
		insertAfterThis = self.at(index - 1)
		insertAfterThis.nextNode = Node.new(value, insertAfterThis.nextNode)
	end

	def remove_at(index)
		removeNext = self.at(index - 1)
		removeNext.nextNode = removeNext.nextNode.nextNode
	end

	def printList
		puts self.to_s
	end
end

#Some Tests
list = LinkedList.new
list.append(2)
list.append(3)
list.append(4)
list.append(5)
list.prepend(1)
list.printList
puts list.size
puts list.tail.value
puts list.at(0).value
list.pop
list.printList
puts list.contains?(1)
puts list.contains?(8)
puts list.find(9)
puts list.to_s
list.insert_at(2, 100)
list.printList
list.remove_at(2)
list.printList