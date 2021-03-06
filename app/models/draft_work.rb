# == Schema Information
#
# Table name: draft_works
#
#  id                :integer          not null, primary key
#  work_id           :integer
#  season_id         :integer
#  sc_tid            :integer
#  title             :string           not null
#  media             :integer          not null
#  official_site_url :string           default(""), not null
#  wikipedia_url     :string           default(""), not null
#  released_at       :date
#  twitter_username  :string
#  twitter_hashtag   :string
#  released_at_about :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  number_format_id  :integer
#
# Indexes
#
#  index_draft_works_on_number_format_id  (number_format_id)
#  index_draft_works_on_sc_tid            (sc_tid)
#  index_draft_works_on_season_id         (season_id)
#  index_draft_works_on_work_id           (work_id)
#

class DraftWork < ActiveRecord::Base
  include DraftCommon
  include WorkCommon

  belongs_to :origin, class_name: "Work", foreign_key: :work_id
  belongs_to :work

  validates :sc_tid, numericality: { only_integer: true }, allow_blank: true
  validates :title, presence: true
end
