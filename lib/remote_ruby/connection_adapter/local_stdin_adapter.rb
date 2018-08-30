module RemoteRuby
  # An adapter to expecute Ruby code on the local macine
  # inside a specified directory
  class LocalStdinAdapter < ::RemoteRuby::ExternalProcessAdapter
    attr_reader :working_dir

    def initialize(working_dir: '.')
      @working_dir = working_dir
    end

    def connection_name
      working_dir
    end

    private

    def command
      "cd \"#{working_dir}\" && ruby"
    end
  end
end
