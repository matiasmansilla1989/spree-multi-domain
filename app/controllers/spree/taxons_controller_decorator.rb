Spree::TaxonsController.class_eval do
   def show
    @taxon = Spree::Taxon.find_by_store_id_and_permalink!(current_store.id, params[:id])
    return unless @taxon
    @searcher = build_searcher(params.merge(:taxon => @taxon.id))
    @products = @searcher.retrieve_products.filter_store(@current_store.id)
    @taxonomies = get_taxonomies.filter_store(@current_store.id)
  end
end
