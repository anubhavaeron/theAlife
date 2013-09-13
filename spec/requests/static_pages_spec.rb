require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { should have_selector('h1', :text => 'Welcome') }

    it { should have_selector('title', text: full_title('')) }

    it { should have_selector('title', text: "theAlife") }

    it { should_not have_selector('title', :text => '| Home') }

  end

  describe "Forum" do

    before { visit forum_path }

    it { should have_selector('h1', :text => 'Forum')}
    it { should have_selector('title',:text => "theAlife | Forum")}

  end


  describe "conprepgo" do

    before { visit conprepgo_path }

    it { should have_selector('h1', :text => 'Convince Prepare Go') }
    it { should have_selector('title',
                                :text => "theAlife | conprepgo") }
  end

  describe "about" do

    before { visit about_path }
    it { should have_selector('h1', :text => 'About Us') }
    it { should have_selector('title',
                                :text => "theAlife | about") }
  end

end