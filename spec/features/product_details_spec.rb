require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "clicking a product goes to its page" do
    
    visit root_path

    # click first 'details' button
    first('a.btn').click

    # check we're on product page
    expect(page).to have_content 'Apparel'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Price'

  end

end
