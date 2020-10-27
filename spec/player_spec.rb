require 'player'

describe Player do
  let(:subject) { Player.new("Bob") }
  it "has a method to return the player name" do
    expect(subject.name).to eq "Bob"
  end
end