require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/registrations/index" do
  before(:each) do
    mevent = mock_model(Event, :registrations => [mock_model(Registration, :name => "Joey"), mock_model(Registration, :name => "Dough Bradbury")], :null_object => true)
    assigns[:event] = mevent
  end
  
  it "should display an error if the registration failed" do
    mock_error = mock("Error", :count => 1, :full_messages => ["hello"])
    assigns[:registration] = mock_model(Registration, :name => nil, :errors => mock_error)
    render 'registrations/index'
    
    response.should have_tag("div[class=errorExplanation]")
  end
end
