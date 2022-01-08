# frozen_string_literal: true

namespace :db do
  desc 'Check files list'
  task :check_segment_files, [:files_list] => :environment do |_task, args|
  files_list = args.files_list.present?

  puts args.files_list
  # output = `rails db:migrate`
  # puts output
  # next if ENV['SLACK_DATABASE_NEWS_TOKEN'].blank?

  # migrations_data = output.scan(/== (\d+) [A-Za-z]+: migrated/).map do |match|
  #   migration_id = match.first
  #   "```\n#{File.read(Dir["db/migrate/#{migration_id}*"].first)}```"
  # end

  # next if migrations_data.blank?

  # body = <<~BODY
  #   Latest changes on database `#{Rails.env}`:
  #   #{migrations_data.join("\n")}
  # BODY

  # Net::HTTP.post(
  #   URI('https://slack.com/api/chat.postMessage'),
  #   {
  #     channel: '#database-news',
  #     text: body,
  #     username: 'DatabaseBot'
  #   }.to_json,
  #   'Authorization' => "Bearer #{ENV['SLACK_DATABASE_NEWS_TOKEN']}",
  #   'Content-Type' => 'application/json; charset=utf-8',
  #   'Accept' => 'application/json; charset=utf-8'
  # )
  end
end
