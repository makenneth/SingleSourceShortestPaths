class Edge
  attr_reader :src, :dest, :weight
  def initialize(src, dest, weight)
    @src = src
    @dest = dest
    @weight = weight
    src.to_edges << self
    dest.from_edges << self
  end

  def inspect
    "src: #{src.value} | dest: #{dest.value} | weight: #{weight}"
  end
end