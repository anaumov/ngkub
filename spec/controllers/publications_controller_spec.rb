require 'spec_helper'


describe PublicationsController do

  it_should_render_404_if_the_resource_was_not_found [:show, :edit, :update, :destroy]


  before(:each) do
    @user  = User.create(:email => "allah@akbar.ru", :approved => true, :admin => false, :password => "000000")
    @admin = User.create(:email => "malik@akbar.ru", :approved => true, :admin => true, :password => "120000")
    sign_in @admin
    Category.create(:title => "sport", :slug => "sport", :intro => "aldksjlkasjdlkas")
    Publication.create(:title => "Asta la vista", :slug => "aloha", :intro => "all like bla bla about sport", :body => " Jane all like bla bla about sport", :category_id => "1")
  end


  describe "create action" do

    it "render 404 if user isn't sing_in" do
      sign_out @admin
      post :create, :publication => {title: "ALoha mutherfuckers", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport", :category_id => "1"}
      response.response_code.should == 404
    end

    it "redirects to pulications page if user is admin" do
      sign_in @admin
      post :create, :publication => {:title => "ALoha mutherfuckers", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport", :category_id => "1"}
      response.should redirect_to(publications_path)
    end


    it "render 404 if user isn't admin" do
      sign_out @admin      
      sign_in @user
      post :create, :publication => {:title => "ALoha mutherfuckers", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport"}
      response.response_code.should == 404
    end

    it "redirect to 'new' template if it have validattion errors" do
      post :create, :publication => {:title => "", :slug => "al", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport", :category_id => "1"}
      response.should render_template("new")
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

  end


  describe "destroy action" do

    it "render index template" do
      delete :destroy, :id => 1
      response.should render_template("index")
    end

  end


  describe "edit action" do

    it "render edit template" do
      get :edit, :id => 1
      response.should render_template("edit")
    end

  end

  describe "update action" do

    it "redirects to pulication page" do
      sign_in @admin
      put :update, :id => 1, :pulication => {:title => "ALoha mutherfuckers", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport"}
      response.should redirect_to(publications_path)
    end

  end
end
