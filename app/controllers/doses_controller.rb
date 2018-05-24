class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all.map { |i| i.name}
    @preselected_ingredient_id = Ingredient.find_by_name('Dark rum').id
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(dose_params[:ingredient_id])

    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
