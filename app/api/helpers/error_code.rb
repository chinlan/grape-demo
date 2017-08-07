module Api
  module Helpers
    module ErrorCode
      API_ERROR = {
        activity_not_found: {
          res_code: 404,
          code: "00000",
          msg: "Activity not found."
        },
        create_failed: {
          res_code: 400,
          code: "00001",
          msg: "Failed to create new activity."
        }
      }

      def get_error(error, show_msg = true)
        error_data = API_ERROR[error]
        if error_data
          error_msg = show_msg ? error_data[:msg] : nil
          error_hash = error_format(error_data[:code], error_msg)
          error!(error_hash, error_data[:res_code])
        else
          raise 'Unknown error.'
        end
      end

      def error_format(error_code, error_msg = nil)
        if error_msg
          { error: error_code, msg: error_msg }
        else
          { error: error_code }
        end
      end
    end
  end
end
