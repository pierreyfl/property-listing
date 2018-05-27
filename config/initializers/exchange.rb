Exchange::Configuration.new do |c|
  c.implicit_conversions = false
  c.cache = {
    subclass: :memory,
    host: nil,
    port: nil,
    expire: :daily
  }
end
