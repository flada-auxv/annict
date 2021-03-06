# == Schema Information
#
# Table name: likes
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  recipient_id   :integer          not null
#  recipient_type :string(510)      not null
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  likes_user_id_idx  (user_id)
#

class LikesController < ApplicationController
  before_action :authenticate_user!

  def checkin_create(checkin_id)
    create_like(Checkin, checkin_id)
  end

  def checkin_destroy(checkin_id)
    destroy_like(Checkin, checkin_id)
  end

  def comment_create(comment_id)
    create_like(Comment, comment_id)
  end

  def comment_destroy(comment_id)
    destroy_like(Comment, comment_id)
  end

  def status_create(status_id)
    create_like(Status, status_id)
  end

  def status_destroy(status_id)
    destroy_like(Status, status_id)
  end


  private

  def create_like(recipient_model, recipient_id)
    recipient = recipient_model.find(recipient_id)

    like = current_user.like_r(recipient)
    keen_client.likes.create(like) if like

    render status: 200, nothing: true
  end

  def destroy_like(recipient_model, recipient_id)
    recipient = recipient_model.find(recipient_id)

    current_user.unlike_r(recipient)

    render status: 200, nothing: true
  end
end
