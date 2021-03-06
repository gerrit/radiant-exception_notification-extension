# -*- encoding: utf-8 -*-
require_dependency 'application_controller'
require 'radiant-exception_notification-extension'

class ExceptionNotificationExtension < Radiant::Extension
  version RadiantExceptionNotificationExtension::VERSION
  description "Adds exception notification with Radiant-managed error pages"
  url "http://github.com/digitalpulp"
  
  def activate
    ApplicationController.send :include, ExceptionNotification
    Page.send(:include, ExceptionNotification::PageExtensions)
    InternalServerErrorPage # instantiate class within Page.descendants
  end
  
  def deactivate
  end
  
end