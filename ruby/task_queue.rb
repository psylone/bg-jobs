class TaskQueue
  attr_reader :queue

  def initialize
    @queue = Queue.new
  end

  def self.start
    new.tap(&:start)
  end

  def start
    Thread.new do
      loop do
        process(@queue.pop)
      end
    end
  end

  def push(value)
    @queue.push(value)
    value
  end

  private

  def process(value)
    value.call
  end
end
