module Api
  module V1
    class Base < Grape::API
      version 'v1'
      mount Api::V1::Activity
    end
  end
end
