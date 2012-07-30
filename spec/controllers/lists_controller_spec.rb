require 'spec_helper'

describe ListsController do

  describe "Get: Index" do
    before do
      List.should_receive(:all)
    end

    specify do
      get :index
      response.should be_success
    end
  end

  describe "Get: New" do
    specify do
      List.should_receive(:new)
      get :new
      response.should be_success
    end
  end

  describe "Post: Create" do
    let(:list) { mock List, name: 'Home', description: 'Things to do at home' }

    before { List.should_receive(:new).and_return list }

    context 'When create successful' do
      before do
        list.should_receive(:save).and_return true
        post :create
      end

      specify do
        response.should redirect_to(lists_url)
      end

      specify do
        flash[:notice] = "List Created."
      end
    end

    context 'When create is not successful' do
      before do
        list.should_receive(:save)
        post :create
      end

      it 'should redirect to new' do
        response.should be_redirect
      end

      specify do
        flash[:error].should_not be_blank
      end
    end
  end

  describe "Get: Show" do
    let(:list) { mock 'list' }
    let(:task) { mock Task, description: 'Clean all fornitures' }

    before do
      List.should_receive(:find).with("1").and_return list
      list.stub_chain(:tasks, :new).and_return task
    end

    specify do
      get :show, id: 1
      response.should be_success
    end
  end

  describe "Delete: Destroy" do
    let(:list) { mock List }

    before do
      List.should_receive(:find).with('1').and_return list
    end

    context 'When destroy not fail' do

      before do
        list.should_receive(:destroy)
        delete :destroy, id: 1
      end

      specify do
        response.status.should eq 302
      end

      specify do
        flash[:notice] = "List Deleted."
      end
    end

    context 'When destroy fail' do

      before do
        list.should_receive(:destroy)
        delete :destroy, id: 1
      end

      specify do
        response.should redirect_to(lists_url)
      end

      specify do
        flash[:error].should_not be_blank
      end
    end
  end

end
