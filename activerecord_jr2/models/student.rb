class Student < Database::Model

  # CLASS METHODS

  def self.table_name
    "students"
  end

  # INSTANCE METHODS

  self.attribute_names =  [:id, :cohort_id, :first_name, :last_name, :email,
                           :gender, :birthdate, :created_at, :updated_at]

  attr_reader :attributes, :old_attributes

  def table_name
    "students"
  end

  def cohort
    Cohort.where('id = ?', self[:cohort_id]).first
  end

  def cohort=(cohort)
    self[:cohort_id] = cohort[:id]
    self.save
    cohort
  end
end