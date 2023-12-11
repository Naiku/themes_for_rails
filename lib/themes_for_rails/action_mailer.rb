# encoding: utf-8
module ThemesForRails

  module ActionMailer

    extend ActiveSupport::Concern

    included do
      include ThemesForRails::ActionController
      alias_method :mail_without_theme, :mail
      alias_method :mail, :mail_with_theme
    end

    def mail_with_theme(headers = {}, &block)
      theme_opts = headers[:theme] || self.class.default[:theme]
      theme(theme_opts) if theme_opts

      mail_without_theme(headers, &block)
    end
    
  end

end
