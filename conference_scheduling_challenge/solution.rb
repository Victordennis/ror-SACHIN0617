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

# ============================================================================
# class Talk
#   @@talks = []
#   def initialize(name, duration)
#     @@talks << { name: name, duration: duration }
#   end

#   def self.all
#     general_talks = []
#     lightning_talks = []
#     @@talks.each do |talk|
#       talk[:duration] == 5 ? lightning_talks.push(talk) : general_talks.push(talk)
#     end

#     return general_talks, lightning_talks
#   end

# end

# ============================================================================

TALKS.each do |talk|
  Talk.new(talk[:name], talk[:duration])
end

# ============================================================================

# class Track
#   attr_reader :track_name, :morning_session, :evening_session

#   def initialize(num)
#     @track_name = "Track #{num}"
#     @morning_session = TalkSession.new(9,12)
#     @evening_session = TalkSession.new(13,17)
#   end

#   def display_talks
#     puts track_name
#     total_talks = morning_session.talks + evening_session.talks
    
#     total_talks.each do |talk|
#       puts "#{talk[:start_time].strftime("%I:%M %p")} #{talk[:name]}"
#     end

#     puts "\n"
#   end
# end

# ============================================================================

# class TalkSession
#   attr_accessor :talks, :remaining_time

#   def initialize(start_time, end_time)
#     year = Time.now.year
#     month = Time.now.month
#     day = Time.now.day
#     @remaining_time = (end_time - start_time) * 60
#     @start_time = Time.local(year, month, day, start_time)
#     @end_time = Time.local(year, month, day, end_time)
#     @talks = []
#   end

#   def add_talk(talk)
#     if @remaining_time >= talk[:duration]
#       @talks.push({name: talk[:name], duration: talk[:duration], start_time: @start_time})
#       @remaining_time  -= talk[:duration]
#       @start_time += talk[:duration] * 60
#       return true
#     end
#     return false
#   end

#   def can_add_talk? (talk)
#     @remaining_time - talk[:duration] >= 0
#   end
# end

# ============================================================================

# class ScheduleTalks
#   def initialize
#     @tracks = [Track.new(1), Track.new(2)]
#   end

#   def execute
#     talks
#     add_talks
#   end

#   private

#   def talks
#     @talks, @lightning_talks = Talk.all
#     @talks = @talks.sort_by { |k| k[:duration] }
#   end

#   def add_talks
#     @tracks.each do |track|
#       add_talks_to_session(track.morning_session)
#       add_talks_to_session(track.evening_session)
      
#       track.display_talks
#     end
#   end

#   def add_talks_to_session(session)
#     add_general_talks(session)
#     add_lightening_talks(session)
#   end

#   def add_lightening_talks(session)
#     total_lightening_talk_time = 0
#     @lightning_talks.each { |talk| total_lightening_talk_time += talk[:duration] }

#     return if total_lightening_talk_time == 0

#     if session.remaining_time >= total_lightening_talk_time && ((@talks.first && session.remaining_time < @talks.first[:duration]) || @talks.length == 0)
#       while @lightning_talks.length > 0
#         lightning_talk = @lightning_talks.first
#         added = session.add_talk(lightning_talk)
#         @lightning_talks.shift()
#       end
#     end
#   end

#   def add_general_talks(session)
#     while @talks.length > 0
#       talk = @talks.first
#       if session.can_add_talk?(talk)
#         added = session.add_talk(talk)
#         @talks.shift() if added
#       else
#         break
#       end
#     end
#   end

# end

ScheduleTalks.new.execute

# ============================================================================



# ============================================================================

