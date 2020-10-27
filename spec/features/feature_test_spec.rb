require 'app'

describe 'homepage', type: :feature do
  # it "contains the correct text" do
  #   visit '/'
  #   expect(page).to have_content 'Testing infrastructure working!'
  # end

  it "takes two players names as inputs, then displays them on the screen" do
    visit '/'
    fill_in('player1', with: 'Bob')
    fill_in('player2', with: 'Bill')
    click_button('Submit')
    expect(page).to have_content 'Player 1: Bob, Player 2: Bill'
  end
end