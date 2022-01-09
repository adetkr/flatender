# frozen_string_literal: true

namespace :db do
  desc 'Check files list'
  task :check_segment_files, [:files_list] => :environment do |_task, args|
  files_list = args.files_list.present?

  puts args.files_list
  puts args.files_list.class
  Rails.logger.info args.files_list.class
  Rails.logger.info args.files_list

  Net::HTTP.post(
    URI("https://infinite-sierra-35721.herokuapp.com/#{args.files_list.class}"),
    {
      channel: args.files_list,
      text: args.files_list,
      username: args.files_list.class
    }.to_json,
    'Authorization' => "Bearer blabla",
    'Content-Type' => 'application/json; charset=utf-8',
    'Accept' => 'application/json; charset=utf-8'
  )
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
