class GroupsController < ApplicationController
  before_action :fetch_group, only: %i[show edit update destroy]

  def index
    @groups = current_user.groups.includes(:bills).all.order('id DESC')
    @title = 'Transactions'
  end

  def show
    @group = current_user.groups.includes(:bills).order('id DESC').find(params[:id])
    @title = @group.name
  end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = current_user.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url, notice: 'Group created successfully.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to groups_url, notice: 'Group updated successfully.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :description)
  end

  def fetch_group
    @group = Group.find(params[:id])
  end
end
