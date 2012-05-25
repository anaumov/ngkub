require 'spec_helper'

describe CategoriesController do

  it_should_render_404_if_the_resource_was_not_found [:show, :edit, :update, :destroy]


  before(:each) do
    @user  = User.create(:email => "allah@akbar.ru", :approved => true, :admin => false, :password => "000000")
    @admin = User.create(:email => "malik@akbar.ru", :approved => true, :admin => true, :password => "120000")
    sign_in @admin
    Category.create(:title => "sports", :slug => "sport", :intro => "all about sport")
  end


  describe "create action" do

    it "renders 'new' template" do
      post :create, :category => {:title => "", :slug => "sport", :intro => "all about sport" }
      response.should render_template("new")
    end


    it "render 404 if user isn't sing_in" do
      sign_out @admin
      post :create, :category => {:title => "adsfasdfasd", :slug => "sport", :intro => "all about sport" }
      response.response_code.should == 404
    end

    it "redirects to categories page if user is admin" do
      post :create, :category => {:title => "adsfasdfasd", :slug => "sport", :intro => "all about sport" }
      response.should redirect_to(categories_path)
    end

  end


  describe "show action" do

    it "renders 'show' template" do
      get :show, :id => 1
      response.should render_template("show")
    end

  end


  describe "index action" do

    it "renders 'index' template" do
      get :index
      response.should render_template("index")
    end

    it "alerts about empty categories list" do
      get :index
      response.should render_template("index")
     # flash[:notice].should == "No categories found"
    end

  end


  describe "destroy action" do

    it "render index template with notice about deleting a category" do
      get :destroy, :id => 1
      response.should render_template("index")
      flash[:notice].should == "category sports deleted"
    end

  end


  describe "edit action" do

    it "render edit template" do
      get :edit, :id => 1
      response.should render_template("edit")
    end

    it "response 404 code" do
      get :edit, :id => 'abc'
      response.response_code.should == 404
    end

  end

  describe "update action" do

    it "redirects to category page" do
      put :update, :id => 1, :category => {:title => "spor", :slug => "sport", :intro => "all about sport" }
      response.should redirect_to(categories_path)
    end

  end


end
