# == Schema Information
#
# Table name: organizations
#
#  id               :integer          not null, primary key
#  name             :string           not null
#  url              :string
#  wikipedia_url    :string
#  twitter_username :string
#  aasm_state       :string           default("published"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_organizations_on_aasm_state  (aasm_state)
#  index_organizations_on_name        (name) UNIQUE
#

class Organization < ActiveRecord::Base
  include AASM
  include DbActivityMethods
  include OrganizationCommon

  aasm do
    state :published, initial: true
    state :hidden

    event :hide do
      after do
        work_organizations.each(&:hide!)
      end

      transitions from: :published, to: :hidden
    end
  end

  has_many :draft_work_organizations, dependent: :destroy
  has_many :work_organizations, dependent: :destroy
end
