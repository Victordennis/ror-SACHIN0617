require_relative "track"

class ScheduleTalks
  def initialize
    @tracks = [Track.new(1), Track.new(2)]
  end

  def execute
    talks
    add_talks
  end

  private

  def talks
    @talks, @lightning_talks = Talk.all
    @talks = @talks.sort_by { |k| k[:duration] }
  end

  def add_talks
    @tracks.each do |track|
      add_talks_to_session(track.morning_session)
      add_talks_to_session(track.evening_session)
      
      track.display_talks
    end
  end

  def add_talks_to_session(session)
    add_general_talks(session)
    add_lightening_talks(session)
  end

  def add_lightening_talks(session)
    total_lightening_talk_time = 0
    @lightning_talks.each { |talk| total_lightening_talk_time += talk[:duration] }

    return if total_lightening_talk_time == 0

    if session.remaining_time >= total_lightening_talk_time && ((@talks.first && session.remaining_time < @talks.first[:duration]) || @talks.length == 0)
      while @lightning_talks.length > 0
        lightning_talk = @lightning_talks.first
        added = session.add_talk(lightning_talk)
        @lightning_talks.shift()
      end
    end
  end

  def add_general_talks(session)
    while @talks.length > 0
      talk = @talks.first
      break if !session.can_add_talk?(talk)

      if session.can_add_talk?(talk)
        added = session.add_talk(talk)
        @talks.shift() if added
      end
    end
  end
end