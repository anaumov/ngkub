require 'spec_helper'

describe CategoryController do

  before(:each) do
    Category.create(:title => "sports", :slug => "sport", :intro => "all about sport")
  end

  it " redirects to category list" do
    post :new, :category => {:title => "sports", :slug => "sport", :intro => "all about sport" }
    response.should redirect_to(category_path(2))
  end

  it " renders 'new' template" do
    post :new, :category => {:title => "", :slug => "sport", :intro => "all about sport" }
    response.should render_template("new")
  end

  it " renders 'show' template" do
    get :show, :id => 1
    response.should render_template("show")
  end
  


end
