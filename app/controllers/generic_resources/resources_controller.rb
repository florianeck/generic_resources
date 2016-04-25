class GenericResources::ResourcesController < GenericResources.configuration.parent_controller.to_s.constantize

  before_filter :assign_resource, except: [:all]

  def all

  end

  def index

  end

  def new
    @resource = @resource_class.new
    render layout: nil if request.xhr?
  end

  def edit
    render layout: nil if request.xhr?
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def resource_attributes

  end


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
      elsif params[:action] != 'new'
        @resources = @resource_class.page(params[:page] || 1).per(GenericResources.configuration.per_page)
      end
    end
  end

end