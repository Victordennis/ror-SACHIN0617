require_relative "talk_session"

class Track
  attr_reader :track_name, :morning_session, :evening_session

  def initialize(num)
    @track_name = "Track #{num}"
    @morning_session = TalkSession.new(9,12)
    @evening_session = TalkSession.new(13,17)
  end

  def display_talks
    puts track_name
    total_talks = morning_session.talks + evening_session.talks
    
    total_talks.each do |talk|
      puts "#{talk[:start_time].strftime("%I:%M %p")} #{talk[:name]}"
    end

    puts "\n"
  end
end