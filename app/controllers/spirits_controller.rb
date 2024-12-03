class SpiritsController < ApplicationController
  before_action :set_spirit, only: [:show, :edit, :update, :destroy]

  def index
    @spirits = Spirit.all
  end

  def new
    @spirit = Spirit.new
  end

  def show
    
  end

  def edit
    
  end
  
  def create
    @spirit = Spirit.new(spirit_params)
    if @spirit.save
      flash[:notice] = "Spirit was created successfully"
      redirect_to spirits_path
    else render :new, status: :unprocessable_entity
    end
  end

  def update
    if @spirit.update(spirit_params)
      flash[:notice] = "Spirit was updated successfully"
      redirect_to spirits_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @spirit.destroy
    redirect_to spirits_path
  end

  private

  def spirit_params
    (params.require(:spirit).permit(:name, :abv, :spirit_type, :user_id))
  end

  def set_spirit
    @spirit = Spirit.find(params[:id])
  end


end




