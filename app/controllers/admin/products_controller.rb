class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :require_is_admin

 def index
   @products = Product.all
 end

 def show
   @product = Product.find(params[:id])
 end

 def new
   @product = Product.new
 end

 def create
   @product = Product.new(product_params)
   if @product.save
     redirect_to admin_products_path
     flash[:notice] = "新增成功"
   else
     render :new
   end
 end

 def edit
   @product = Product.find(params[:id])
 end

 def update
   @product = Product.find(params[:id])

   if @product.update(product_params)

     redirect_to admin_products_path
     flash[:notice] = "Update.success"
   else

     render :edit
   end
 end

 def destroy
   @product = Product.find(params[:id])
   @product.destroy
   redirect_to admin_products_path flash[:alert] = "Deleted Success"

 end

 private

 def product_params
  params.require(:product).permit(:title, :description, :price, :quantity, :image)
 end

end
