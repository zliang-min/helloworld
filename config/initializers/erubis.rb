if defined?(Erubis)
  Erubis::Helpers::RailsHelper.show_src = false
  Erubis::Helpers::RailsHelper.preprocessing = true if Rails.env == 'production'
end
