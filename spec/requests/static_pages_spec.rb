require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { should have_selector('h1', :text => 'Welcome') }

    it { should have_selector('title', text: full_title('')) }

    it { should have_selector('title', text: "theAlife") }

    it { should_not have_selector('title', :text => '| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
    end

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