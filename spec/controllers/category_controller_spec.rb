require 'spec_helper'

describe CategoryController do

  it "should save a Category in db" do
    Category.should_receive(:save)
    post :new, :category => {:title => "sports", :slug => "sport", :intro => "all about sport" }
  end

  it "should return a Category" do
    Category.should_receive(:show).with("id" => "1")
    post :new, :category => {:title => "sports", :slug => "sport", :intro => "all about sport" }
    post :show, :category => {:id => 1 }
  end


end
