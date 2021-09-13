require 'sinatra'

WORKLOAD = 3..5

configure do
  set :server_settings, max_threads: 5
end

helpers do
  def heavy_work
    sleep rand(WORKLOAD)
    logger.info('done')
  end
end

get '/' do
  Thread.new { heavy_work }
end
