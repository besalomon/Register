json.array! @courses.each do |course|
  json.id course.id
  json.name course.name
  json.short_name course.short_name
end