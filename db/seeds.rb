# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Song.destroy_all

audio_files = [
  { title: "First Song", filename: "song.mp3" }
]

audio_files.each do |file|
  song = Song.create!(title: file[:title])

  file_path = Rails.root.join("db/seed_files/#{file[:filename]}")
  song.audio_file.attach(
    io: File.open(file_path),
    filename: file[:filename],
    content_type: 'audio/mpeg'
  )

  puts "Created song: #{song.title} with audio #{file[:filename]}"
end
