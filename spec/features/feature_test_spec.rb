require 'app'

describe 'homepage', type: :feature do
  # it "contains the correct text" do
  #   visit '/'
  #   expect(page).to have_content 'Testing infrastructure working!'
  # end

  before(:each) do
    sign_in_and_play
  end

  it "takes two players names as inputs, then displays player1 name to the screen" do
    expect(page).to have_content 'Player 1: Bob'
  end

  it "takes two players names as inputs, then displays player2 name to the screen" do
    expect(page).to have_content 'Player 2: Bill'
  end

  it 'displays player2 hp to the screen' do
    expect(page).to have_content 'Player 2 HP: 60'
  end

  it 'allows player 1 to attack player 2, and receive confirmation' do
    click_button('Attack')
    expect(page).to have_content 'Player 2 was attacked'
  end

  it 'reduces player2 hp by 10 when attacked' do
    click_button('Attack')
    expect(page).to have_content 'Player 2 HP: 50'
  end
end
