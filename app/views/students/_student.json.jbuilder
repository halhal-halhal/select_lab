json.extract! student, :id, :name, :rank, :first, :second, :third, :created_at, :updated_at
json.url student_url(student, format: :json)