# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
u1 = User.find_or_create_by!(email: "owner@example.com", role: "owner")
u2 = User.find_or_create_by!(email: "author@example.com", role: "author")
u3 = User.find_or_create_by!(email: "respondent@example.com", role: "respondent")
scl = Scale.find_or_create_by!(title: "SDP Scale", version: "1.0", doi: "10.1234/sdp")
q1 = Question.find_or_create_by!(scale: scl, user: u2, body: "I feel confident using the system.", kind: "likert", required: true)
srv = Survey.find_or_create_by!(title: "SDP Pilot Survey", status: "draft", scale: scl, owner: u1)
Response.find_or_create_by!(survey: srv, question: q1, user: u3, value: "4")
