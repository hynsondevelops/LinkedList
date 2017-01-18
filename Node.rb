class Node

	attr_accessor :value, :nextNode

	def initialize(value = nil, nextNode = nil) 
		@value = value
		@nextNode = nextNode
	end
end