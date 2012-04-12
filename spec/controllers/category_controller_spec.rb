require 'spec_helper'

describe CategoryController do

  it "should redirect to category list" do
    post :new, :category => {:title => "sports", :slug => "sport", :intro => "all about sport" }
    response.should redirect_to('/category/1')
  end

  it "should render 'new' template" do
    post :new, :category => {:title => "", :slug => "sport", :intro => "all about sport" }
    Category.should render_template("new")
  end

   it "should render 'show' template" do
    post :new, :category => {:title => "sports", :slug => "sport", :intro => "all about sport" }
    get :show, :id => 1
    Category.should render_template("show")
  end
  


end
