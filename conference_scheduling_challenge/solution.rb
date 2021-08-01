require_relative "talk"
require_relative "schedule_talks"

TALKS = [
  {name: "Pryin open the black box 60 minutes", duration: 60,},
  {name: "Migrating a huge production codebase from sinatra to Rails 45 minutes", duration: 45,},
  {name: "How does bundler work 30 minutes", duration: 30,},
  {name: "Sustainable Open Source 45 minutes", duration: 45,},
  {name: "How to program with Accessiblity in Mind 45 minutes", duration: 45,},
  {name: "Riding Rails for 10 years lightning talk", duration: 5,},
  {name: "Implementing a strong code review culture 60 minutes", duration: 60,},
  {name: "Scaling Rails for Black Friday 45 minutes", duration: 45,},
  {name: "Docker isn't just for deployment 30 minutes", duration: 30,},
  {name: "Callbacks in Rails 30 minutes", duration: 30,},
  {name: "Microservices, a bittersweet symphony 45 minutes", duration: 45,},
  {name: "Teaching github for poets 60 minutes", duration: 60,},
  {name: "Test Driving your Rails Infrastucture with Chef 60 minutes", duration: 60,},
  {name: "SVG charts and graphics with Ruby 45 minutes", duration: 45,},
  {name: "Interviewing like a unicorn: How Great Teams Hire 30 minutes", duration: 30,},
  {name: "How to talk to humans: a different approach to soft skills 30 minutes", duration: 30,},
  {name: "Getting a handle on Legacy Code 60 minutes", duration: 60,},
  {name: "Heroku: A year in review 30 minutes", duration: 30,},
  {name: "Ansible : An alternative to chef lightning talk", duration: 5,},
  {name: "Ruby on Rails on Minitest 30 minutes", duration: 30,}
]

TALKS.each do |talk|
  Talk.new(talk[:name], talk[:duration])
end

ScheduleTalks.new.execute
