require 'spec_helper'
include OwnTestHelper

describe "Beers page" do
  before :each do
    FactoryGirl.create(:user)
    sign_in(username:"Pekka", password:"Foobar1")
    FactoryGirl.create(:brewery, name:"Koff")
    visit new_beer_path
  end

  it "beer is saved" do
    fill_in('beer_name', with:'Olut')
    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(1)
  end

  it "invalid beer is not saved" do
    expect{
      click_button('Create Beer')
    }.to_not change{Beer.count}.to eq(0)
    expect(current_path).to eq(beers_path)
    expect(page).to have_content 'error'

  end
end
