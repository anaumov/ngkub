require 'spec_helper'

describe PublicationsController do

  it_should_render_404_if_the_resource_was_not_found [:show, :edit, :update, :destroy]


  before(:each) do
    Publication.create(:title => "Asta la vista", :slug => "aloha", :intro => "all like bla bla about sport", :body => " Jane all like bla bla about sport")
    @user = User.create(:email => "allah@akbar.ru", :approved => true, :admin => true, :password => "000000")
  end


  describe "create action" do
    it "redirects to sign_in page if user is not sing_in" do
      post :create, :publication => {title: "ALoha mutherfuckers", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport"}
      response.should redirect_to(new_user_session_path)
    end

    it "redirects to pulications page if user singed in" do
      sign_in @user
      post :create, :publication => {:title => "ALoha mutherfuckers", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport"}
      response.should redirect_to(publications_path)
    end

    it "redirect to 'new' template if it have validattion errors" do
      post :new, :publication => {:title => "", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport"}
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

    it "alerts about empty pulications list" do
      get :index
      response.should render_template("index")
    end

  end


  describe "destroy action" do

    it "render index template with notice about deleting a pulication" do
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
      put :update, :id => 1, :pulication => {:title => "ALoha mutherfuckers", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport"}
      response.should redirect_to(publications_path)
    end

  end
end
