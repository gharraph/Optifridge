class ItemKindsController < ApplicationController

  def index
    @item_kinds = ItemKind.find_by_name_lower_case params[:term]
    render :json => @item_kinds.map { |item_kind| item_kind.name }
  end
end
