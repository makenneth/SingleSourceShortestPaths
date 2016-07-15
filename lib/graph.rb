require 'byebug'
class Graph
  attr_reader :vertices, :edges
  def initialize(vertices, edges)
    @vertices = vertices
    @edges = edges
  end

  def bellman_ford(source)
    costs = Hash.new(Float::INFINITY)
    costs[source] = 0

    vertices.length.times do |i|
      edges.each_with_index do |edge, j|
        src, dest, weight = edge.src, edge.dest, edge.weight
        if costs[src] != Float::INFINITY && 
            costs[src] + weight < costs[dest]
          costs[dest] = costs[src] + weight 
        end
      end
    end
    #need to check for circularity..
    costs
  end

  def dijkstra(source)
    frontier = Hash.new(Float::INFINITY)
    frontier[source] = 0
    shortest_paths = {
      source => 0
    }

    while frontier.length > 0
      cur_vertex, cur_cost = frontier.min_by(&:last) #can be improved to O(1)
      frontier.delete(cur_vertex) #can be improved to O(log n)

      shortest_paths[cur_vertex] = cur_cost
      cur_vertex.to_edges.each do |edge|
        dest, weight = edge.dest, edge.weight
        next if shortest_paths[dest]

        if weight + cur_cost < frontier[dest]
          frontier[dest] = weight + cur_cost
        end
      end
    end

    shortest_paths
  end
end