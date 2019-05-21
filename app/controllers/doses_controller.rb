class DosesController < ApplicationController

  def new
   @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params_dose)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params["id"])
    @cocktail = @dose.cocktail
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
