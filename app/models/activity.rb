class Activity < ApplicationRecord
  def api_obj
    {
      id: self.id,
      title: self.title,
      start_at: self.start_at,
      end_at: self.end_at,
      created_at: self.created_at,
      updated_at: self.updated_at
    }
  end
end
