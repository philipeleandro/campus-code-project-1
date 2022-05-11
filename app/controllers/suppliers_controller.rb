class SuppliersController < ApplicationController
  before_action :set_supplier, only:[:show, :edit, :update]
  
  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to suppliers_path, notice: 'Cadastrado com sucesso'
    else
      flash.now[:notice] = 'Fornecedor não cadastrado'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to supplier_path, notice: 'Editado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível atualizar o fornecedor'
      render 'edit'
    end
  end
  
  private
  def supplier_params
    params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number, :full_address, :city, :state, :email, :phone)
  end

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end
end