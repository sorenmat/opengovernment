class Session < ActiveRecord::Base
  belongs_to :legislature
  has_many :roles
  has_many :bills
  named_scope :active, :conditions => ["date_part('year', current_timestamp) between start_year and end_year"]
  validates_uniqueness_of :name, :scope => :legislature

  def to_param
    name.parameterize
  end

end