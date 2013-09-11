require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Welcome'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Welcome')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                                :text => "theAlife | Home")
    end

  end

   describe "Forum" do

    it "should have the h1 'Forum'" do
      visit '/static_pages/forum'
      page.should have_selector('h1', :text => 'Forum')
    end

    it "should have the title 'Forum'" do
      visit '/static_pages/forum'
      page.should have_selector('title',
                                :text => "theAlife | Forum")
    end
  end

  describe "conprepgo" do

    it "should have the h1 'conprepgo'" do
      visit '/static_pages/conprepgo'
      page.should have_selector('h1', :text => 'Convince Prepare Go')
    end

    it "should have the title 'conprepgo'" do
      visit '/static_pages/conprepgo'
      page.should have_selector('title',
                                :text => "theAlife | conprepgo")
    end
  end
end