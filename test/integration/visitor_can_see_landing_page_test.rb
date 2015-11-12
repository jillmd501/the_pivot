require 'test_helper'

class VisitorCanSeeLandingPageTest < ActionDispatch::IntegrationTest
  test 'visitor can see landing page' do
    visit root_path

    assert page.has_content? 'ColoRideo'
    assert page.has_css? '#tagline'
    assert page.has_link? 'Start Your Adventure'
    assert page.has_css? '.about-us'
  end

  test 'start button leads to cities index' do
    visit root_path
    click_link 'Start Your Adventure'

    assert_equal current_path, cities_path
  end
end
