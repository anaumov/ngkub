require 'spec_helper'

describe PublicationsController do

  it_should_render_404_if_the_resource_was_not_found [:show, :edit, :update, :destroy]


  before(:each) do
    Publication.create(:title => "Asta la vista", :slug => "aloha", :intro => "all like bla bla about sport", :body => " Jane all like bla bla about sport")
    sign_in User.create(:email => "allah@akbar.ru", :approved => true, :admin => true)
  end


  describe "create action" do
    it "redirects to pulications page" do
      post :create, :publication => {:title => "ALoha mutherfuckers", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport"}
      response.should redirect_to(publications_path)
    end

    it "renders 'new' template" do
      post :create, :publication => {:title => "ALoha mutherfuckers", :slug => "aloha", :intro => "ali baba like bla bla about sport", :body => " Jane all like bla bla about sport"}
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
      get :destroy, :id => 1
      response.should render_template("index")
      flash[:notice].should == "Publication Asta la vista deleted"
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
