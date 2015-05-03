require 'net/http'

namespace :tempo do
  task :starting do
    set :start_time, Time.now

    begin
      current_branch = execute "git branch | sed -n '/\* /s///p'".chomp
    rescue
      current_branch = "master"
    end
    set :current_branch, current_branch
  end

  task :finished do
    branch = fetch(:current_branch)
    start_time = fetch(:start_time)
    elapsed = Time.now.to_i - start_time.to_i
    commit_id = execute "git rev-parse --verify HEAD"
    git_author_name = execute "git config user.name".chomp
    git_author_email = execute "git config user.email".chomp

    message = "#{git_author_name} deployed #{fetch(:repo_url)} with branch #{branch} on #{fetch(:stage)} in #{elapsed} seconds."

    Tempo.post(
        project: fetch(:tempo_project),
        token: fetch(:tempo_token),
        payload: {
            message: message,
            branch: branch,
            sha1: commit_id.chop!,
            author_name: git_author_name,
            author_email: git_author_email
        }
    )
  end

  def execute(command, directory = ".")
    directory = ARGV.first unless ARGV.empty?
    `#{command}`
  end
end

after 'deploy:starting', 'tempo:starting'
after 'deploy:finished', 'tempo:finished'
