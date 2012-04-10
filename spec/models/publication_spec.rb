require 'spec_helper'

describe Publication do

  it "does not allow to create publication with title less than 3 chars" do
    pub = Publication.create(:title => "ab", :body => ";dksfksdaj fkasdj ;fldkjas ;fkjads;l fkjadklsfj ;ladskj")
    pub.errors.should_not be_empty  
  end

end
