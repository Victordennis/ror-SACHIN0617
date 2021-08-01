class TalkSession
  attr_accessor :talks, :remaining_time

  def initialize(start_time, end_time)
    year = Time.now.year
    month = Time.now.month
    day = Time.now.day
    @remaining_time = (end_time - start_time) * 60
    @start_time = Time.local(year, month, day, start_time)
    @end_time = Time.local(year, month, day, end_time)
    @talks = []
  end

  def add_talk(talk)
    if @remaining_time >= talk[:duration]
      @talks.push({name: talk[:name], duration: talk[:duration], start_time: @start_time})
      @remaining_time  -= talk[:duration]
      @start_time += talk[:duration] * 60
      return true
    end
    return false
  end

  def can_add_talk? (talk)
    @remaining_time - talk[:duration] >= 0
  end
end