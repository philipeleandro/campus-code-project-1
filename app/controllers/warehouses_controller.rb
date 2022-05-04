class WarehousesController < ApplicationController
  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end

  def new
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :description, :code, :address, :city, :cep, :area)
    @warehouse = Warehouse.new(warehouse_params)
    @warehouse.save
    
    redirect_to root_path, notice: 'Cadastrado com sucesso'
  end
end