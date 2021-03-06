class ApplicationController < ActionController::Base
  protect_from_forgery

  TUMBLR_API_KEY = 'wQukqjUKktkK38DLQ54E3z02dw0CfWxedtwzwr7yapodUpfGC3'

  before_filter :participants, :tumblr

  def participants
    @participants ||= Participant.all.sort_by(&:number)
  end

  def about
    @about ||= About.first
  end

  def tumblr
    @tumblr_on = about.tumblr
    @tumblr_post_id = about.tumblr_post_id
  end
end
