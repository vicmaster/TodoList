require 'spec_helper'

describe ListsController do

  describe "Get: Index" do
    specify do
      List.should_receive(:all)
      get :index
      response.should be_successful
    end
  end

  describe "Get: New" do
    specify do
      List.should_receive(:new)
      get :new
      response.should be_successful
    end
  end

  describe "Delete: Destroy" do
    let(:list) { mock List }

    before do
      List.should_receive(:find).and_return list
      delete :destroy, id: 1
    end

    specify do
      response.should be_redirect(lists_url)
    end

    specify do
      flash[:notice].should_not be_nil
    end

  end

=begin
  describe "Post: Create" do
    before do
      List.should_receive(:new)
    end

    context 'When create OK' do
      before do
        List.any_instance.should_receive(:save).and_return true
        post :create
        response.should be_successful
      end

      it 'should redirect to index' do
        response.should respond_to(list_path)
      end

      it 'should set error message' do
        flash[:notice].should_not be_nil
      end
    end

    context 'When create error' do
      before do
        List.any_instance.should_receive(:save)
        post :create
      end

      it 'should redirect to new' do
        response.should redirect_to(new_list_path)
      end

      it 'should set error message' do
        flash[:error].should_not be_nil
      end
    end
  end
=end


end
