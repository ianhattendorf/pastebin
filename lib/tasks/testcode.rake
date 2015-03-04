namespace :testcode do
  unless Rails.env == 'production'
    require 'rubocop/rake_task'
    require 'reek/rake/task'

    desc 'Execute rubocop -DR'
    RuboCop::RakeTask.new(:rubocop) do |tsk|
      tsk.options = ['-DR'] # Rails, display cop name
      tsk.fail_on_error = false
    end

    desc 'Execute reek'
    Reek::Rake::Task.new do |tsk|
      tsk.source_files = ['app/**/*.rb', 'lib/**/*.rb', 'lib/tasks/*.rake', 'config/**/*.rb']
      tsk.fail_on_error = false
      # tsk.verbose = true
    end
  end
end

task :testcode do
  %w(rubocop reek).each { |task| Rake::Task["testcode:#{task}"].invoke }
end
