class GenericResources::ResourcesController < GenericResources.config.parent_controller.to_s.constantize

  before_filter :assign_resource

  def index
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def assign_resource
    if params[:resource_name].nil?
      flash[:error] = I18n.t('generic_resources.controller.flash.error.resource_type_missing')
      redirect_to :back
    elsif GenericResource.resources[params[:resource_name]].nil?
      flash[:error] = I18n.t('generic_resources.controller.flash.error.resource_type_not_found', resource_name: params[:resource_name])
      redirect_to :back
    else
      @resource_class = GenericResource.resources[params[:resource_name]][:class]

      if params[:id]
        @resource       = @resource_class.find(params[:id])
      else
        @resources = @resource_class.all
      end
    end
  end

end