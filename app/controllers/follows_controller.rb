class FollowsController < ApplicationController
  def index
    @follows = Follow.all

    render("follow_templates/index.html.erb")
  end

  def show
    @follow = Follow.find(params.fetch("id_to_display"))

    render("follow_templates/show.html.erb")
  end

  def new_form
    @follow = Follow.new

    render("follow_templates/new_form.html.erb")
  end

  def create_row
    @follow = Follow.new

    @follow.user_id = params.fetch("user_id")
    @follow.stock_id = params.fetch("stock_id")
    @follow.notes = params.fetch("notes")

    if @follow.valid?
      @follow.save

      redirect_back(:fallback_location => "/follows", :notice => "Follow created successfully.")
    else
      render("follow_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_stock
    @follow = Follow.new

    @follow.user_id = params.fetch("user_id")
    @follow.stock_id = params.fetch("stock_id")
    @follow.notes = params.fetch("notes")

    if @follow.valid?
      @follow.save

      redirect_to("/stocks/#{@follow.stock_id}", notice: "Follow created successfully.")
    else
      render("follow_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @follow = Follow.find(params.fetch("prefill_with_id"))

    render("follow_templates/edit_form.html.erb")
  end

  def update_row
    @follow = Follow.find(params.fetch("id_to_modify"))

    
    @follow.stock_id = params.fetch("stock_id")
    @follow.notes = params.fetch("notes")

    if @follow.valid?
      @follow.save

      redirect_to("/follows/#{@follow.id}", :notice => "Follow updated successfully.")
    else
      render("follow_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @follow = Follow.find(params.fetch("id_to_remove"))

    @follow.destroy

    redirect_to("/users/#{@follow.user_id}", notice: "Follow deleted successfully.")
  end

  def destroy_row_from_stock
    @follow = Follow.find(params.fetch("id_to_remove"))

    @follow.destroy

    redirect_to("/stocks/#{@follow.stock_id}", notice: "Follow deleted successfully.")
  end

  def destroy_row
    @follow = Follow.find(params.fetch("id_to_remove"))

    @follow.destroy

    redirect_to("/follows", :notice => "Follow deleted successfully.")
  end
end
