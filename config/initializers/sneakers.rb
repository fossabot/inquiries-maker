# require 'sneakers'
# # require 'sneakers/metrics/logging_metrics'
# Sneakers.configure  :heartbeat => 5,
#                     :amqp => 'amqp://guest:guest@localhost:5672',
#                     :vhost => '/',
#                     :exchange => 'sneakers',
#                     :exchange_type => :direct,
#                     prefetch: 10,      # Grab 10 jobs together. Betterspeed.
#                     threads: 10       # Threadpool size (good to match prefetch)
# # Sneakers.configure({
# #
# #   amqp: "amqp://#{ENV["RABBITMQ_USER_AND_PASS"]}@127.0.0.1:5672",
# #
# #   vhost: "/",
# #
# #   heartbeat: 5,            # Keep a good connection with broker
# #   # timeout_job_after: 5,    # Maximal seconds to wait for job
# #   # prefetch: 10,            # Grab 10 jobs together. Better speed.
# #   # threads: 10,             # Threadpool size (good to match prefetch)
# #   # workers: 4,              # Number of per-cpu processes to run
# #   # start_worker_delay: 0.3, # Delay between thread startup
# #   # env: Rails.env,          # Environment
# #   # durable: true,           # Is queue durable?
# #   # ack: true,               # Must we acknowledge?
# #   # exchange: 'sneakers',    # AMQP exchange
# #   # hooks: {},               # prefork/postfork hooks
# #   # runner_config_file: nil, # A configuration file (see below)
# #   # metrics: Sneakers::Metrics::LoggingMetrics.new,    # A metrics provider implementation
# #   # daemonize: true,         # Send to background
# #   # log: 'sneakers.log',     # Log file
# #   # pid_path: 'sneakers.pid', # Pid file
# #   # handler: Sneakers::Handlers::Maxretry
# # })
#
# Sneakers.logger.level = Logger::INFO