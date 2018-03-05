class ProductsController < ApplicationController
  before_action :product_finder, only: [:show, :edit, :update, :destroy]
  def index
    if params[:category]
      @products = Product.where(category: params[:category])
      else
      @products = Product.all
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_creation_params)
    @product.user = current_user
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end
  def edit
    if @product.user == current_user
      @product = Product.find(params[:id])
    else
      flash[:alert] = "Ce n'est pas votre produit."
      redirect_to products_path
    end
  end
  def update

    @product = Product.find(params[:id])
    if @product.update(product_creation_params)
      redirect_to products_path
    else
      render :edit
    end

  end
  def destroy
    if @product.user == current_user
      @product.destroy
      redirect_to products_path
    else
      flash[:alert] = "Vous ne pouvez pas supprimer le produit d'un autre utilisateur."
      redirect_to products_path
    end
  end

  private

  def product_finder
    @product = Product.find(params[:id])
  end
  def product_creation_params
    params.require(:product).permit(:name, :category, :brand, :tagline, :size, :sku, :photo)
  end

end
