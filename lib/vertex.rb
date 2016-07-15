class Vertex
  attr_reader :value, :to_edges, :from_edges
  def initialize(value)
    @value = value
    @to_edges = []
    @from_edges = []
  end

  def inspect
    value
  end
end
