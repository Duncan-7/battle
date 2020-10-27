require 'app'

describe 'homepage', type: :feature do
  # it "contains the correct text" do
  #   visit '/'
  #   expect(page).to have_content 'Testing infrastructure working!'
  # end

  before(:each) do
    visit '/'
    fill_in('player1', with: 'Bob')
    fill_in('player2', with: 'Bill')
    click_button('Submit')
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
end
