module Api
  class Base < Grape::API
    format :json

    mount Api::V1::Base

    if Rails.env.development?
      add_swagger_documentation(
        mount_path: 'swagger_doc',
        api_version: 'v1',
        hide_format: true,
        hide_documentation_path: true
      )
    end
  end
end
