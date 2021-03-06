require 'faker'

class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new


    # @review = Review.new
  end

  def drink
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:id])

  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @fakename = Faker::Superhero.name
    @cocktail.name = "#{@cocktail.name.capitalize} #{@fakename}"

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end

