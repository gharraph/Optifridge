class ItemKindsController < ApplicationController

  def index
    @item_kinds = ItemKind.order(:name).where("name like ?", "%#{params[:term].upcase}%")
    render :json => @item_kinds.map { |item_kind| item_kind.name }
  end
end
