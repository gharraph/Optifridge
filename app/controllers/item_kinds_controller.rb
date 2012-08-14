class ItemKindsController < ApplicationController

  def index
    @item_kinds = ItemKind.order(:name).where("name like ?", "%#{params[:term]}%")
    render :json => @item_kinds.map { |item_kind| item_kind.name }
  end

  def show
  	item_kind = ItemKind.find_by_name(params[:id])
  	@locations = item_kind.shelf_lives.map {|shelf_life| shelf_life.location.name}
  	respond_to do |format|
   		format.html { render :partial => 'select' }
   	end
  end
end
