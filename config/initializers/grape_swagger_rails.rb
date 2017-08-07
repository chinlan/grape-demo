if Rails.env.development?
  GrapeSwaggerRails.options.url = "swagger_doc"
  GrapeSwaggerRails.options.app_name = 'grape-demo'
  GrapeSwaggerRails.options.app_url = '/api/'
end
