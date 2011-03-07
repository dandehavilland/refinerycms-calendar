class Event < ActiveRecord::Base
  default_scope order('start_at ASC')
  
  scope :current, where(['start_at < ? and end_at >= ?', Time.now, Time.now])
  scope :upcoming, where(['start_at >= ?', Time.now])
  scope :featured, where(['featured IS NOT NULL and featured = ?', true])
  scope :not_featured, where(['featured IS NULL or featured = ?', false])
  scope :archive, where(['end_at < ?', Time.now])
  
  acts_as_indexed :fields => [:title, :venue_name, :venue_address, :ticket_link, :description]

  validates :title, :presence => true, :uniqueness => true
  validates :ticket_price, :numericality => true
  
  has_friendly_id :title, :use_slug => true
  
  belongs_to :image
  
  def current?
    end_at >= Time.now
  end
  
  def upcoming?
    start_at >= Time.now
  end
  
  def archived?
    end_at < Time.now
  end
  
  def featured?
    featured == true
  end
  
  def status
    "current" if current?
    "coming up" if upcoming?
    "archived" if archived?
  end

end
