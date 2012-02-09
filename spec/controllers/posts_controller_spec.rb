require 'spec_helper'

describe PostsController do

  before do
    @user = Factory(:user)
  end

  it "should list existing posts" do
    @post = Factory :post
    sign_in @user

    get :index

    response.status.should eq(200)
    response.should render_template(:action => "index")
  end

  it "should show existing posts" do
    @post = Factory :post
    sign_in @post.creator.user

    get :show, :id => @post.id

    response.status.should eq(200)
    response.should render_template(:action => "show")
  end

  it "should show form form for new posts" do
    @post = Factory :post
    sign_in @post.creator.user

    get :new

    response.status.should eq(200)
    response.should render_template(:action => "new")
  end

  it "should create new posts" do
    @post = Factory :post
    sign_in @post.creator.user

    post :create, :post => {:title => Faker::Lorem.words, :message => {:body => Faker::Lorem.paragraphs}}

    response.status.should eq(302)
    response.should redirect_to("/posts/#{assigns["post"].id}")
  end

end
