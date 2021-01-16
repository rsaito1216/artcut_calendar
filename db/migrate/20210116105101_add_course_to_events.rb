class AddCourseToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :course_id, :integer
  end
end
