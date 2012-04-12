require 'spec_helper'

describe CategoryController do

  before(:each) do
    Category.create(:title => "sports", :slug => "sport", :intro => "all about sport")
  end

  it "redirects to category page" do
    post :new, :category => {:title => "sports", :slug => "sport", :intro => "all about sport" }
    response.should redirect_to(category_path(2))
  end

  it "renders 'new' template" do
    post :new, :category => {:title => "", :slug => "sport", :intro => "all about sport" }
    response.should render_template("new")
  end

  it "renders 'show' template" do
    get :show, :id => 1
    response.should render_template("show")
  end
  
  it "response 404 code" do
    get :show, :id => 'abc'
    #response.should render_file("#{Rails.root}/public/404.html")
    response.response_code.should == 404
  end

  it "renders 'index' template" do
    get :index
    response.should render_template("index")
  end

  it "alerts about empty categories list" do
    get :index
    response.should render_template("index")
   # flash[:notice].should == "No categories found"
  end

  it "render index template with notice about deleting a category" do
    get :delete, :id => 1
    response.should render_template("index")
    flash[:notice].should == "category sports deleted"
  end

  it "render 404 page with error" do
    get :delete, :id => 'abc'
    response.response_code.should == 404
    flash[:notice].should == "we haven't category with id=abc"
  end

  it "render edit template" do
    get :edit, :id => 1
    response.should render_template("edit")
  end

  it "response 404 code" do
    get :edit, :id => 'abc'
    response.response_code.should == 404
  end

  it "redirects to category page" do
    put :update, :id => 1, :category => {:title => "spor", :slug => "sport", :intro => "all about sport" }
    response.should redirect_to(category_path(1))
  end

end
