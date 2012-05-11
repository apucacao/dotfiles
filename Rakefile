# credits: https://github.com/henrik/dotfiles/blob/master/Rakefile by @henrik

IGNORE_FILES = %w(README.markdown Rakefile osx)

def confirm (msg)
  print "> #{msg} (y/n)"
  STDIN.gets.chomp.match(/^y/i)
end

def info (msg, prefix='*')
  STDOUT.puts "#{prefix} #{msg}"
end

def info_rm (msg)
  info(msg, 'x')
end

def error (msg)
  STDERR.puts "! #{msg}"
end

desc 'Install dotfiles to homedir'
task :install do
  
  Dir['*'].each do |name|
    next if IGNORE_FILES.include?(name)
    
    source = File.expand_path(name)
    dotfile = ".#{name}"
    target = File.expand_path("~/#{dotfile}")
    
    if File.symlink?(target)
      link = File.readlink(target)
      info_rm "Removing symlink #{target} --> #{link}" if link != source
      FileUtils.rm(target)
    elsif File.exists?(target)
      if confirm("remove #{target}?")
        FileUtils.rm_rf(target)
        info_rm "removed #{target}"
      else
        next
      end
    end
    
    contents = File.read(source) rescue ''

    if contents.include?('<replace')
      info "#{source} has <replace> placeholders"

      contents.gsub!(/<replace (.+)?>/) do
        begin
          File.read(File.expand_path("~/Dropbox/secrets/#{$1}"))
        rescue => e
          error "Could not replace `#{$&}`: #{e.message}"
          ''
        end
      end

      File.open(target, 'w') {|f| f.write contents }
      info "wrote #{target}"
    else
      FileUtils.ln_s(source, target)
      info "added symlink #{target} to #{source}"
    end    
  end  
end

desc 'Update all submodules'
task :update do
  lines = File.open('.gitmodules').readlines()
  
  lines.each do |l|
    next unless l.strip.start_with?('path')
    path = l.match(/= (.+)/)[1]
    
    out = IO.popen("cd #{path}; git pull").read().strip
    info "updated #{path}" unless out == 'Already up-to-date.'
  end
end
