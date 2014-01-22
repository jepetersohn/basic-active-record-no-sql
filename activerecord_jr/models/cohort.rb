class Cohort < Database::Model

  #Class Methods

  def self.table_name
    "cohorts"
  end

  #Instance Methods

  self.attribute_names =  [:id, :name, :created_at, :updated_at]

  attr_reader :attributes, :old_attributes

  def table_name
    "cohorts"
  end

  def students
    Student.where('cohort_id = ?', self[:id])
  end

  def add_students(students)
    students.each do |student|
      student.cohort = self
    end

    students
  end
end