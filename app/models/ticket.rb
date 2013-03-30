class Ticket < ActiveRecord::Base
  attr_accessible :name, :email, :subject, :status
  validates_presence_of :name, :email, :subject

  has_many :ticket_histories
  belongs_to :ticket_status
  belongs_to :admin

  before_create :assign_status, :assign_reference_number, :generate_token
  after_create  :notify_customer, :build_creation_log
  after_save    :update_customer

  def self.search status_id,keyword=nil
    return self.search_by_keyword keyword unless keyword.nil?
    self.search_by_list_type status_id
  end

  # ticket status seeded in prior
  def self.search_by_list_type status_id=nil
    case status_id.to_i
    when 1 then return Ticket.where("ticket_status_id IN (0,1)") #unassigned tickets
    when 2 then return Ticket.where("ticket_status_id != 5") #open tickets
    when 3 then return Ticket.where("ticket_status_id = 3") #on hold tickets
    when 4 then return Ticket.where("ticket_status_id IN (4,5)") #closed tickets
    else
      Ticket.all
    end
  end

  def self.search_by_keyword keyword
    where("reference_number  LIKE '%#{keyword}%' or subject LIKE '%#{keyword}%'")
  end

  # shortcut to status name
  def status
    ticket_status.try(:description)
  end

  def build_update_log admin,type
    message = type == 'admin' ? "#{admin} change ownership into #{self.nil? ? self.admin.name : I18n.t('nobody')}" :
                "#{admin} update status into #{self.status}"

    history = ticket_histories.build(:activity => message)
    history.save
  end

private

  def assign_status
    self.ticket_status_id = 1    
  end

  def assign_reference_number
    ref = generate_reference_number
    assign_reference_number if Ticket.all.collect(&:reference_number).include? ref
    self.reference_number = ref
  end

  def generate_reference_number
    char_section = (0...3).map{ ('A'..'Z').to_a[rand(26)] }.join
    num_section  = (0...6).map{ (0..9).to_a[rand(9)] }.join
    "#{char_section}-#{num_section}"
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  def notify_customer
    SystemMailer.new_issue_posted(self).deliver
  end

  def update_customer
    SystemMailer.new_updates_posted(self).deliver
  end

  def build_creation_log
    history = self.ticket_histories.build(:activity => "#{self.name} reported an issue.")
    history.save
  end
end
