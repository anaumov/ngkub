require 'spec_helper'

describe CategoryController do

  it "should create a Category" do
    Category.should_receive(:new).with("title" => "sports", "slug" => "sport", "intro" => "all about sport")
    post :new, :category => {:title => "sports", :slug => "sport", :intro => "all about sport" }
  end

  it "should return a Category" do
    Category.should_receive(:show).with("id" => "1")
    post :show, :category => {:id => 1 }
  end


end
