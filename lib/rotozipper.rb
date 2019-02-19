require "zlib"
require "active_support/core_ext/array"
require "rotozipper/version"
require "rotozipper/rainbow"

module Rotozipper
  class Error < StandardError; end

  class Logger
    
    attr_accessor :logger

    def initialize(logger_path)
      @logger = ::Logger.new logger_path
    end

    def puts(message)
      @logger.info message
    end

  end
  
  ##
  # Rotates and zips each file in specified directory.
  #
  # @param [String] glob_path source directory glob path.
  # @param [String] output_path directory which contains zipped and rotates files.
  # @param [String] logger_path an optional logger file as output.
  #
  # @return [nil]
  def self.launch(glob_path, output_path = 'history', logger_path = nil)
    logger = logger_path.present? ? Rotozipper::Logger.new(logger_path) : $stdout
    logger.puts "Beginning to rotozip folder #{glob_path}..".darkorchid
    unless Dir.exists? output_path
      logger.puts "Creating output folder '#{output_path}'..".darkorchid
      FileUtils.mkdir_p output_path
    end
    
    log_files = Dir.glob(glob_path)
    logger.puts "Found #{log_files.count} files.".darkorchid
    log_files.each do |log_file|
      unless File.file? log_file
        logger.puts "Skipping resource '#{log_file}' as it is not a file.".darkorchid
        next
      end
      log_file_basename = File.basename log_file, File.extname(log_file)
      zipped_file = "#{output_path}/#{log_file_basename}-#{Time.current.strftime('%Y%m%d-%H%M%S-%L')}.gz"
      Zlib::GzipWriter.open(zipped_file) do |gz|
        gz.mtime = File.mtime(log_file)
        gz.orig_name = log_file
        gz.write IO.binread(log_file)
      end
      File.truncate(log_file, 0)
      logger.puts "Rotozipped file '#{log_file}' to '#{zipped_file}'.".darkorchid
    end

    logger.puts "Rotozip completed!".darkorchid
  end

end
