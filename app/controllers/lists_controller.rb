class ListsController < ApplicationController

  respond_to :html, :xml, :js
  layout 'todo'

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "List Created."
      redirect_to lists_url
    else
      flash[:error] = "Could not create a list."
      redirect_to new_list_url(@list)
    end
  end

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:notice] = "List Updated."
      respond_with(@list, location: list_url(@list))
    else
      flash[:error] = "Could not update a list"
      redirect_to edit_list_url(@list)
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List Deleted."
      redirect_to lists_url
    else
      flash[:error] = "Could not delete the list, Have you done everything?"
      redirect_to lists_url
    end
  end

end
