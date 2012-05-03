require 'spec_helper'

describe CategoriesController do

  it_should_render_404_if_the_resource_was_not_found [:show, :edit, :update, :destroy]


  before(:each) do
    Category.create(:title => "sports", :slug => "sport", :intro => "all about sport")
  end


  describe "create action" do
    it "redirects to categories page" do
      post :create, :category => {:title => "sports", :slug => "sport", :intro => "all about sport" }
      response.should redirect_to(categories_path)
    end

    it "renders 'new' template" do
      post :new, :category => {:title => "adsfasdfasd", :slug => "sport", :intro => "all about sport" }
      response.should render_template("new")
    end
  end


  describe "show action" do

    it "renders 'show' template" do
      get :show, :id => 1
      response.should render_template("show")
    end
    
    it "response 404 code" do
      get :show, :id => 'abc'
      response.response_code.should == 404
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
