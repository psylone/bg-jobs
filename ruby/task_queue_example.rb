require 'sinatra'
require_relative 'task_queue'

WORKLOAD = 3..5

configure do
  set :server_settings, max_threads: 5
  set :queue, TaskQueue.start
end

task_queue = 'ok'

helpers do
  def queue
    settings.queue
  end

  def heavy_work
    sleep rand(WORKLOAD)
    logger.info('done')
  end
end

get '/' do
  queue.push(-> { heavy_work })
end
