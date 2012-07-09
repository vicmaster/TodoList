require 'spec_helper'

describe ListsController do

  describe "Get Index" do
    specify do
      List.should_receive(:all)
      get :index
      response.should be_successful
    end
  end

  describe "Get New" do
    specify do
      List.should_receive(:new)
      get :new
      response.should be_successful
    end
  end

 # describe "Post Create" do
 #   let(:list){}
 #   before do
 #     List.should_receive(:new).with(list)
 #   end
 #   specify do
 #     post :Create
 #     response.should be_successful
 #   end
 # end
end
