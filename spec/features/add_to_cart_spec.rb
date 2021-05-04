require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do

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

  scenario "Adding product to cart increases cart quantity by 1" do
    
    visit root_path

    # check cart has quantity (0)
    expect(find('a[href="/cart"]')).to have_content '(0)'

    # click first 'add' button
    click_button('Add', match: :first)

    # check cart has quantity (1)
    expect(find('a[href="/cart"]')).to have_content '(1)'

  end

end
