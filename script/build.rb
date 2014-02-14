#!/usr/bin/env ruby
# Run it like ruby script/build.rb $commit $package

def run(cmd)
  p "Running: #{cmd}"
  system cmd
end

def checkout(commit)
  Dir.chdir("/home/action/.parts/autoparts") do
    run "git remote update"
    run "git checkout #{commit}"
  end
end

def install(package)
  run "parts install #{package} --source"
end

commit = ARGV[0]
package = ARGV[1]

checkout commit
success = install package

if success
  exit 0
else 
  exit 1
end
