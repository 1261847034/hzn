namespace :api do
  desc "Build api doc from slate/ to public/api_doc/ directory"
  task :build_doc do
    puts "cd #{Rails.root}/slate; bundle && bundle exec middleman build --clean"
    Bundler.with_clean_env {
      system "cd #{Rails.root}/slate; bundle && bundle exec middleman build --clean"
    }
  end
end
