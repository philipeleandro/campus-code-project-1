class ProductModelsController < ApplicationController
  def index
    @product_models = ProductModel.all
  end

  def new
    @product_model = ProductModel.new
  end

  def create
    @product_model = ProductModel.new(product_model_params)

    if @product_model.save
      redirect_to product_models_path, notice: 'Cadastrado com sucesso'
    else
      flash.now[:notice] = 'Produto não cadastrado'
      render 'new'
    end
  end

  private
  def product_model_params
    params.require(:product_model).permit(:name, :weigth, :width, :height, :depth, :sku, :supplier_id)
  end
end