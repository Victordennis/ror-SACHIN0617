class Talk
  @@talks = []
  def initialize(name, duration)
    @@talks << { name: name, duration: duration }
  end

  def self.all
    general_talks = []
    lightning_talks = []
    @@talks.each do |talk|
      talk[:duration] == 5 ? lightning_talks.push(talk) : general_talks.push(talk)
    end

    return general_talks, lightning_talks
  end
end