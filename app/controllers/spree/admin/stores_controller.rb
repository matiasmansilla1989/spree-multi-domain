class Spree::Admin::StoresController < Spree::Admin::ResourceController

  before_filter :load_payment_methods
  before_filter :load_shipping_methods

  def index
    respond_with(current_store) do |format|
      format.html
      format.json
    end
  end

  private
    def load_payment_methods
      @payment_methods = Spree::PaymentMethod.all.filter_store(current_store)
    end

    def load_shipping_methods
      @shipping_methods = Spree::ShippingMethod.all.filter_store(current_store)
    end
end
