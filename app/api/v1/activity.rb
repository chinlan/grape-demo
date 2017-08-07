module Api
  module V1
    class Activity < Grape::API
      helpers do
        include Api::Helpers::ErrorCode
        include Api::Helpers::PermittedParams
      end
      resources :activities do
        desc "Get an activity based on given id"
        params do
          requires :id, type: String,
                        desc: "The activity id",
                        allow_blank: false
        end
        get ':id' do
          activity = ::Activity.where(id: params[:id]).take
          if activity.nil?
            get_error(:activity_not_found)
          else
            activity = activity.api_obj
          end
          {
            activity: activity
          }
        end
        desc "Create a new activity"
        params do
          group :activity, type: Hash do
            requires :title, type: String
            optional :start_at, type: Time
            optional :end_at, type: Time
          end
        end
        post do
          activity_params = permitted_params(params)
                            .require(:activity)
                            .permit(:title, :start_at, :end_at)
          activity = ::Activity.new(activity_params)
          if activity.save
            {
              activity: activity.api_obj
            }
          else
            get_error(:create_failed)
          end
        end
      end
    end
  end
end
