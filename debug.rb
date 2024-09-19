def log(message)
  File.open('debug.log', 'a') do |file|
    file.puts("#{Time.now}: #{message}")
  end
end

# Example usage
log("This is a test message.")
