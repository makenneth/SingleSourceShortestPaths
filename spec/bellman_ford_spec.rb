require 'rspec'
require 'graph'
require 'edge'
require 'vertex'


describe "Single Source Shortest Paths Algorithm" do
  let(:v0){ Vertex.new(0) }
  let(:v1){ Vertex.new(1) }
  let(:v2){ Vertex.new(2) }
  let(:v3){ Vertex.new(3) }
  let(:v4){ Vertex.new(4) }
  let(:e1){ Edge.new(v0, v1, -1)}
  let(:e2){ Edge.new(v0, v2, 2) }
  let(:e3){ Edge.new(v1, v2, 3) }
  let(:e4){ Edge.new(v1, v3, 2) }
  let(:e5){ Edge.new(v1, v4, 2) }
  let(:e6){ Edge.new(v4, v3, -3) }
  let(:e7){ Edge.new(v3, v2, 3) }
  let(:e8){ Edge.new(v2, v0, 2) }
  let(:graph){ Graph.new([v0, v1, v2, v3, v4], [e1, e2, e3, e4, e5, e6, e7, e8])}

  context "#bellman_ford" do
    it "can find the shortest paths to all other nodes" do
      expect(graph.bellman_ford(v0)).to eq({ 
        v0 => 0, 
        v1 => -1,
        v2 => 1,
        v3 => -2,
        v4 => 1
      })
      expect(graph.bellman_ford(v1)).to eq({ 
        v0 => 4, 
        v1 => 0,
        v2 => 2,
        v3 => -1,
        v4 => 2
      })
    end
  end

end