module YAML
  # Load the document contained in +filename+.  Returns the yaml contained in
  # +filename+ as a ruby object
  def self.load_stream_from_file filename
    File.open(filename, 'r:bom|utf-8') { |f| self.load_stream f, filename }
  end
end