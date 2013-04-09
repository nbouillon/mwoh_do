require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Marvel War of Heroes: Deck Optimizer (Beta)'" do
      visit '/static_pages/home'
      page.should have_content('Marvel War of Heroes: Deck Optimizer (Beta)')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "MWoH:DO")
    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_content('About')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "MWoH:DO | About")
    end
  end

  describe "Math page" do

    it "should have the content 'Math'" do
      visit '/static_pages/math'
      page.should have_content('Math')
    end

    it "should have the title 'Math'" do
      visit '/static_pages/math'
      page.should have_selector('title',
                        :text => "MWoH:DO | Math")
    end
  end
end