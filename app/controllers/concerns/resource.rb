# frozen_string_literal: true

# User _resource_
#
module Resource
  extend ActiveSupport::Concern

  included do
    helper_method :resource
  end

  protected

  # Like 'accounts' => 'account'
  def resource_name
    controller_name.singularize
  end

  # Like 'account' => 'accounts'
  def resources_name
    controller_name
  end

  # Like 'accounts' => @account
  def resource
    @resource = instance_variable_get(('@' + resource_name).to_sym)
  end

  def resource_class
    resource.class
  end

  # Set resource, method for <tt>before_action</tt>.
  #
  # Like AccountsContoller#set_account.
  #
  # <tt>Warninig:</tt> method should be defined in controller.
  def set_resource
    instance_eval('set_' + resource_name)
  end
end
