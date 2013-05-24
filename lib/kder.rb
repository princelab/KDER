require_relative 'kder/kde'
class Kder
  Major,Minor,Patch = File.readlines("VERSION").map(&:chomp)
  VERSION = [Major,Minor,Patch].join(".")
end
