module Api
  module Helpers
    module PermittedParams
      def permitted_params params
        ActionController::Parameters.new params
      end
    end
  end
end
