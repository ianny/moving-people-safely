# Replace all attributes(i.e. user input) sent to the server in
# production mode so that they are not transferred over to the
# ELK stack as the information is sensitive.

if Rails.env.production?
  FILTER_VALUE = '[FILTERED]'.freeze
  Rails.application.config.filter_parameters << ->(_key, value) do
    value.to_s.replace(FILTER_VALUE)
  end
end
