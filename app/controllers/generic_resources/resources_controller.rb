class GenericResources::ResourcesController < GenericResources.configuration.parent_controller.to_s.constantize

  before_action :assign_resource, except: [:all]

  def all

  end

  def index
    session["#{@resource_class.to_s.underscore}_page"] = params[:page].present? ? params[:page].to_i : 1
  end

  def new
    @resource = @resource_class.new
    render layout: nil if request.xhr?
  end

  def edit
    render layout: nil if request.xhr?
  end

  def create
    @resource = @resource_class.new(resource_attributes)
    if @resource.save
      flash[:notice] = I18n.t('generic_resources.controller.flash.notice.created', resource_name: @resource_class.model_name.human)
    else
      flash[:error] = I18n.t('generic_resources.controller.flash.error.not_created',
        resource_name: @resource_class.model_name.human, errors: @resource.errors.messages)
    end

    redirect_to_index
  end

  def update
    if @resource.update_attributes(resource_attributes)
      flash[:notice] = I18n.t('generic_resources.controller.flash.notice.updated', resource_name: @resource_class.model_name.human)
    else
      flash[:error] = I18n.t('generic_resources.controller.flash.error.not_updated',
        resource_name: @resource_class.model_name.human, errors: @resource.errors.messages)
    end

    redirect_to_index
  end

  def destroy
    if GenericResource.resources[params[:resource_name]][:resource_deleteable]
      @resource.destroy
      flash[:notice] = I18n.t('generic_resources.controller.flash.notice.destroyed', resource_name: @resource_class.model_name.human)
    else
      flash[:notice] = I18n.t('generic_resources.controller.flash.error.not_destroyed', resource_name: @resource_class.model_name.human)
    end
    redirect_to_index
  end

  private

  def resource_attributes
    params.require(params[:resource_name]).permit(*GenericResource.resources[params[:resource_name]][:permitted_attributes])
  end


  def assign_resource
    if params[:resource_name].nil?
      flash[:error] = I18n.t('generic_resources.controller.flash.error.resource_type_missing')
      redirect_to action: :index
    elsif GenericResource.resources[params[:resource_name]].nil?
      flash[:error] = I18n.t('generic_resources.controller.flash.error.resource_type_not_found', resource_name: params[:resource_name])
      redirect_to action: :index
    else
      @resource_class = GenericResource.resources[params[:resource_name]][:class]

      if params[:id]
        @resource       = @resource_class.find(params[:id])
      elsif params[:action] != 'new' && params[:action] != 'create'
        @resources = @resource_class.page(params[:page] || 1).per(GenericResources.configuration.per_page)
      end
    end
  end

  def redirect_to_index
    page = session["#{@resource_class.to_s.underscore}_page"]
    redirect_to generic_resources.url_for(action: 'index', resource_name: params[:resource_name], page: page)
  end

end
