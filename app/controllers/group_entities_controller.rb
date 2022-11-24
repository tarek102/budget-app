class GroupEntitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @entities = @group.group_entities.includes(:entity).map(&:entity)
    @entities = @entities.sort_by(&:created_at).reverse
  end
end