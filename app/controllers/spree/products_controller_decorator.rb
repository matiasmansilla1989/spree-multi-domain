Spree::ProductsController.class_eval do

  before_filter :can_show_product, :only => :show

  private

  def can_show_product
    @product ||= Spree::Product.friendly.find(params[:id])
    if @product.store != current_store
      raise ActiveRecord::RecordNotFound
    end
  end

end
