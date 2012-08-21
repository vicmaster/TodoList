require 'spec_helper'

describe TasksController do

  describe "Post: Create" do
    let(:task) { mock Task, description: 'Clean all fornitures' }
    let(:list) { mock 'list' }
    before do
      Task.stub_chain(:tasks, :new).and_return task
    end

    context 'When create not fail' do
      before do
        task.should_receive(:save).and_return true
        post :create
      end

      specify do
        response.should be_success
        flash[:notice] = "Task Created."
      end
    end

    context 'When create fail' do
      before do
        task.should_receive(:save).and_return false
        post :create
      end

      specify do
        response.should be_redirect
        flash[:notice] = "Task Created."
      end
    end

  end

end
