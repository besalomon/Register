class Course < ApplicationRecord
  belongs_to :user, optional:true
  has_many :student_courses
  has_many :teacher_courses
  has_many :teachers, through: :teacher_courses
  has_many :teachers, through: :teacher_courses
  has_many :course_departments
  has_many :departments, through: :course_departments

  validates :name, presence: { message: ":please input the name" }
  validates :long_description, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |course|
        csv << course.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    course = find_by_id(row["id"]) || new
    course.attributes = row.to_hash.slice(*accessible_attributes)
    course.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Csv.new(file.path, nil, :ignore)
  when ".xls" then Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end
end
